(require 'slime)
(require 'paredit)
(require 'numen)

(defvar pneumen-ps-compiler-function nil)

(defvar pneumen-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c j") 'pneumen-ps-expand)
    (define-key map (kbd "C-M-x") 'pneumen-send-toplevel)
    map))

(define-minor-mode pneumen-minor-mode
  "\\{pneumen-minor-mode-map}"
  :lighter " Pneumen")

(defun pneumen-parenscript-input-compiler (string)
  (let ((ps (format "(princ (ps* (read-from-string %S)))" string)))
    (car (slime-eval `(swank:eval-and-grab-output ,ps) "PS"))))

(defun run-pneumen (&optional ps-compiler-fn)
  (interactive)
  (unless ps-compiler-fn
    (setq ps-compiler-fn 'pneumen-parenscript-input-compiler))
  (setq pneumen-ps-compiler-function ps-compiler-fn)
  (run-numen ps-compiler-fn))

(defun pneumen-setup-repl ()
  (paredit-mode +1)
  (set (make-local-variable 'lisp-indent-function) 'common-lisp-indent-function)
  (set (make-local-variable 'indent-line-function) 'lisp-indent-line)
  (define-key numen-mode-map (kbd "C-c j") 'pneumen-ps-expand)
  ;; (define-key numen-mode-map (kbd "RET") 'pneumen-newline-and-indent)
  (define-key numen-mode-map (kbd "RET") 'numen-return)
  (define-key numen-mode-map (kbd "M-RET") 'numen-return)
  (define-key numen-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol)
  (define-key numen-mode-map (kbd "SPC") 'slime-space)
  (define-key numen-mode-map (kbd "M-.") 'slime-edit-definition))

(defun pneumen-newline-and-indent ()
  (interactive)
  (save-restriction
    (let ((inhibit-read-only t))
      (cond ((get-text-property (point) 'old-input)
             (numen-grab-old-input)
             (goto-char (numen-prompt-end))
             (paredit-ignore-sexp-errors (indent-sexp))
             (goto-char (point-max)))
            ((numen-current-input)
             (narrow-to-region (numen-prompt-start) (point-max))
             (paredit-newline))
            ;; let empty input produce a new prompt (feels more like a terminal)
            (t (numen-send-input))))))

(defun pneumen-ps-expand (&optional arg)
  (interactive "P")
  (let* ((target (when arg (read-from-minibuffer "Target: ")))
         (ps (slime-sexp-at-point))
         (js (funcall pneumen-ps-compiler-function ps target)))
    (with-current-buffer (numen-update-secondary-source-buffer "ps-to-js" js)
      (numen-display-in-sticky-window)
      (goto-char (point-min)))))

(defun pneumen-send-toplevel (&optional arg)
  (interactive)
  (save-excursion
    (mark-defun)
    (let* ((ps (buffer-substring-no-properties (point) (mark)))
           (js (funcall pneumen-ps-compiler-function ps)))
      (save-window-excursion
        (numen-switch-to-repl)
        (numen-request-evaluation js arg)
        (message "=> %s..."  (pneumen-substring (numen-strip-newlines ps) 0 30))))))

(defun pneumen-switch-to-slime-repl ()
  (interactive)
  (let ((buffer (ignore-errors (slime-output-buffer))))
    (cond ((not (buffer-live-p buffer)) "Can't access Slime REPL")
          (t (with-current-buffer buffer
               (unless (buffer-local-value 'numen-sticky-window buffer)
                 (set (make-local-variable 'numen-sticky-window) (with-repl-buffer numen-sticky-window)))
               (numen-display-in-sticky-window)
               (goto-char (point-max)))))))

(defun pneumen-handle-server-message (msg)
  (acond ((hget msg :slime-eval)
          (pneumen-handle-slime-eval it (hget msg :callback-id) (hget msg :package))
          t)))

(defun pneumen-handle-slime-eval (string callback-id package)
  (lexical-let ((id callback-id))
    (pneumen-eval-async
     (lambda (errmsg output)
       (with-repl-buffer
        (numen-send-request (list :client_callback id :errmsg errmsg :output output))))
     string package)))

(defun pneumen-eval-async (proc string package)
  (lexical-let ((proc proc))
    (cond ((null (slime-current-connection))
           (funcall proc (list "Slime is not running" nil)))
          (t (slime-eval-async `(swank:eval-and-grab-output ,string)
               (lambda (result) (funcall proc nil result))
               package)))))

(defun pneumen-substring (string from &optional to)
  "Like `substring' but doesn't raise an error if FROM or TO
  exceed the length of STRING."
  (substring string (min from (length string))
             (when to (min to (length string)))))

(pushnew 'pneumen-handle-server-message numen-server-message-handlers)
(add-hook 'numen-startup-hook 'pneumen-setup-repl)

(provide 'pneumen)
