;;; -*- Mode: Emacs-Lisp -*-

;;;; Debugging config start

(progn
  (setq debug-on-error nil
        debug-on-signal nil
        warning-suppress-types nil))

;;;; Debugging config end

;;;; set environment and variables

;;;
(defun eval-next-sexp ()
  (interactive)
  (forward-sexp)
  (eval-last-sexp nil))
(define-key emacs-lisp-mode-map (kbd "<M-return>") 'eval-next-sexp)

;;; latest Slime for Common Lisp
(load (expand-file-name "quicklisp/slime-helper.el" (getenv "HOME")))
(require 'slime)

;;; package.el

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when (require 'package)
  (package-initialize))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(defadvice package-download-tar
  (after package-download-tar-initialize activate compile)
  "initialize the package after compilation"
  (package-initialize))

(defadvice package-download-single
  (after package-download-single-initialize activate compile)
  "initialize the package after compilation"
  (package-initialize))


;;; env: loading directories
(progn
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/" (getenv "HOME"))) load-path) 
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/cedet/common/" (getenv "HOME"))) load-path)
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/cl-lookup/" (getenv "HOME"))) load-path)
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/g-client/" (getenv "HOME"))) load-path)
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/llvm/" (getenv "HOME"))) load-path) 
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/clean-mode/" (getenv "HOME"))) load-path)  
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/imaxima/" (getenv "HOME"))) load-path) 
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/eli/" (getenv "HOME"))) load-path) 
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/git-emacs/" (getenv "HOME"))) load-path) 
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/emacs-ee-0.0.2/" (getenv "HOME"))) load-path)
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/bigloo/" (getenv "HOME"))) load-path)
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/gauche-mode" (getenv "HOME"))) load-path)
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/lsdb" (getenv "HOME"))) load-path) 
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/bash-completion" (getenv "HOME"))) load-path)
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/ebib/src" (getenv "HOME"))) load-path)
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/mark-multiple" (getenv "HOME"))) load-path) 
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/mythryl-mode" (getenv "HOME"))) load-path)
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/Saaxy" (getenv "HOME"))) load-path)
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/auto-complete-clang" (getenv "HOME"))) load-path)
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/opa-mode" (getenv "HOME"))) load-path)
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/o-blog" (getenv "HOME"))) load-path)
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/iced-coffee-mode" (getenv "HOME"))) load-path)
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/numen" (getenv "HOME"))) load-path)
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/js2-refactor.el" (getenv "HOME"))) load-path)
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/nyan-mode" (getenv "HOME"))) load-path)
  (push (file-name-as-directory
         (expand-file-name ".emacs.d/emacs-for-python" (getenv "HOME"))) load-path)
  )

(put 'erase-buffer 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(abbrev-mode t t)
 '(blink-cursor-mode nil)
 '(browse-url-firefox-new-window-is-tab t)
 '(browse-url-new-window-flag t)
 '(buffers-menu-grouping-function (quote group-buffers-menu-by-mode-then-alphabetically))
 '(buffers-menu-sort-function (quote sort-buffers-menu-by-mode-then-alphabetically))
 '(buffers-menu-submenus-for-groups-p t)
 '(column-number-mode t)
 '(cua-mode nil nil (cua-base))
 '(desktop-save-mode t nil (desktop))
 '(dired-recursive-deletes (quote top))
 '(echo-keystrokes 0.02)
 '(enable-recursive-minibuffers t)
 '(header-copyright-notice "Copyright (c) 2008-2011 Mathematical Systems Inc, Tokyo, Japan - All rights reserved.
")
 '(header-date-format "%Y-%m-%dT%T%z")
 '(indent-region-mode t)
 '(indent-tabs-mode nil)
 '(kill-whole-line t)
 '(make-header-hook (quote (header-mode-line header-blank header-copyright header-blank header-file-name header-description header-author header-maintainer header-license header-creation-date header-version header-modification-date header-modification-author header-update-count header-end-line header-commentary header-blank header-blank header-blank header-end-line header-code header-eof)))
 '(minibuffer-auto-raise t)
 '(mouse-autoselect-window nil)
 '(nxhtml-skip-welcome t)
 '(outline-minor-mode-prefix [(control o)])
 '(paren-mode (quote paren) nil (paren))
 '(ps-n-up-printing 2)
 '(ps-paper-type (quote a4))
 '(quack-default-program "mzscheme")
 '(quack-fontify-style nil)
 '(quack-fontify-threesemi-p t)
 '(quack-programs (quote ("gosh -i" "bigloo" "csi" "csi -hygienic" "gosh" "gsi" "gsi ~~/syntax-case.scm -" "guile" "kawa" "mit-scheme" "mred -z" "mzscheme" "mzscheme -M errortrace" "rs" "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi")))
 '(require-final-newline t)
 '(safe-local-variable-values (quote ((Package . CL-GD) (Package . CL-INTERPOL) (Package . CL-WHO) (Package . DOCUMENTATION-TEMPLATE) (flyspell-mode) (org-export-html-extension . "markdown") (Package . DRAKMA) (ruby-compilation-executable . "ruby") (ruby-compilation-executable . "ruby1.8") (ruby-compilation-executable . "ruby1.9") (ruby-compilation-executable . "rbx") (ruby-compilation-executable . "jruby") (lexical-binding . t) (package . excl) (Package . CCL) (Package . ga) (Package . CLIM-INTERNALS) (Package . CLOUSEAU) (Package . CL-PPCRE) (Package . CHUNGA) (Package . HUNCHENTOOT) (Package . FLEXI-STREAMS) (Package RT :use "COMMON-LISP" :colon-mode :external) (header-auto-update-enabled) (pbook-monochrome . t) (pbook-style . article) (pbook-include-toc) (pbook-author . "Paul Khuong") (Package . Lexical-Contexts) (Package . FSet) (Package APE :USE CL :COLON-MODE :EXTERNAL) (Package ABIGAIL :USE CL :COLON-MODE :EXTERNAL) (Syntax . Ansi-common-lisp) (Package PARTIAL :USE CL :SHADOW (CLASS METHOD DEFCONSTANT DEFPARAMETER DEFVAR DEFUN DEFCLASS DEFMETHOD) :COLON-MODE :EXTERNAL) (Syntax . Common-Lisp) (syntax . COMMON-LISP) (Package ITERATE :use "COMMON-LISP" :colon-mode :external) (Package . CL-FAD) (Package . cl-user) (Package . cls-loader\.parser) (Syntax . COMMON-LISP) (Package . LEXER) (Base . 10) (Package . CL-USER) (Package . als\.sgml\.util) (Package . als\.sgml\.db) (Package . :cl-user) (Syntax . ANSI-Common-Lisp) (Package . als\.sgml\.loader) (Package . user) (readtable . py-user-readtable) (Readtable . PY-AST-USER-READTABLE) (indent-tabs) (package) (Package) (syntax) (Syntax) (base) (Base))))
 '(save-abbrevs nil)
 '(scroll-bar-mode nil)
 '(session-use-package t nil (session))
 '(setq tab-stop-list t)
 '(shell-file-name "/bin/bash")
 '(show-paren-delay 0)
 '(show-paren-mode (quote paren) nil (paren))
 '(speedbar-frame-parameters (quote ((minibuffer) (width . 20) (border-width . 0) (menu-bar-lines . 0) (tool-bar-lines . 0) (unsplittable . t) (set-background-color "black"))))
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(truncate-lines nil)
 '(unicode-helper-data-txt "/usr/share/perl/5.8.8/unicore/UnicodeData.txt")
 '(user-full-name "Jianshi Huang")
 '(user-mail-address "jianshi.huang@gmail.com")
 '(view-lossage-message-count 1000)
 '(x-select-enable-clipboard t))

(fset 'yes-or-no-p 'y-or-n-p)

(setq tab-always-indent 'complete)

(setq-default frame-title-format
              (list '((buffer-file-name
                       " %f"
                       (dired-directory
                        dired-directory
                        (revert-buffer-function
                         " %b"
                         ("%b - Dir:  " default-directory)))))))

;;; coding system
;; (load "chinese-gbk") ; need to download and install some elisp files
;; (defun load-cn ()
;;   (interactive)
;;   (set-language-environment 'Chinese-gb) ; or 'chinese-gb
;;   (set-default-coding-systems 'gb2312)
;;   (set-buffer-file-coding-system 'gb2312-unix)
;;   (set-keyboard-coding-system 'gb2312)
;;   (set-selection-coding-system 'gb2312)
;;   (set-terminal-coding-system 'gb2312)
;;   (setq locale-coding-system 'gb2312)
;;   (setq current-language-environment "Chinese")
;;   )
;; (load-cn)

;; (defun load-jp ()
;;   (interactive)
;;   (set-language-environment 'Japanese)  ; or 'chinese-gb
;;   ;;   (set-default-coding-systems 'euc-jp)
;;   ;;   (set-buffer-file-coding-system 'euc-jp-unix)
;;   ;;   (set-keyboard-coding-system 'euc-jp)
;;   ;;   (set-selection-coding-system 'euc-jp)
;;   ;;   (set-terminal-coding-system 'euc-jp)
;;   ;;   (setq locale-coding-system 'euc-jp)
;;   ;;   (setq current-language-environment "EUC-JP")
;;   (set-default-coding-systems 'utf-8)
;;   (set-buffer-file-coding-system 'utf-8-unix)
;;   (set-keyboard-coding-system 'utf-8)
;;   (set-selection-coding-system 'utf-8)
;;   (set-terminal-coding-system 'utf-8)
;;   (setq locale-coding-system 'utf-8)
;;   (setq current-language-environment "Japanese"))
;; (load-jp)

(defun load-utf8 ()
  (interactive)
  (set-language-environment 'UTF-8)
  (set-default-coding-systems 'utf-8)
  (set-buffer-file-coding-system 'utf-8-unix)
  (set-keyboard-coding-system 'utf-8)
  (set-selection-coding-system 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (setq locale-coding-system 'utf-8)
  (setq current-language-environment "UTF-8"))


;;; insert-date
(defun insert-date (prefix)
  "Insert the current date. With prefix-argument, use ISO format. With
   two prefix arguments, write out the day and month name."
  (interactive "P")
  (let ((format (cond
                  ((not prefix) "%Y-%m-%d")
                  ((equal prefix '(4)) "%Y %B %d, %A.")
                  ((equal prefix '(16)) (read-from-minibuffer "Format:"))))
        ;; (system-time-locale "ja_JP")  ; doesn't work
        )
    (insert (format-time-string format))))

;;; file header
(require 'header2)
(add-hook 'write-file-hooks 'auto-update-file-header)
;; (add-hook 'lisp-mode-hook 'auto-make-header)
(defvar header-lisp-license "LLGPL")

(defun header-license ()
  "Insert text saying that this is free software."
  (insert header-prefix-string "License: " header-lisp-license "\n"))

;;; align-regexp
(define-key global-map (kbd "C-x a r") 'align-regexp)

;;; compilation
(require 'smart-compile)

;;; backup
(defconst  use-backup-dir t)
(setq backup-by-copying     t   ; don't clobber symlinks
      backup-directory-alist    '(("." . "~/.backup"))
      delete-old-versions   t
      kept-new-versions     6
      kept-old-versions     5
      version-control       t)

;;; auto-fill
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;; nyan cat mdoe
(require 'nyan-mode)

;;; interactive replace
(load-library "iedit")

;;; recursive search
(define-key isearch-mode-map (kbd "C-o")
  (lambda ()
    (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string
                 (regexp-quote isearch-string))))))

(defun isearch-yank-regexp (regexp)
  "Pull REGEXP into search regexp."
  (let ((isearch-regexp nil)) ;; Dynamic binding of global.
    (isearch-yank-string regexp))
  (if (not isearch-regexp)
      (isearch-toggle-regexp))
  (isearch-search-and-update))

(defun isearch-yank-symbol ()
  "Put symbol at current point into search string."
  (interactive)
  (let ((sym (find-tag-default)))
    (if (null sym)
        (message "No symbol at point")
        (isearch-yank-regexp
         (concat "\\_<" (regexp-quote sym) "\\_>")))))
(define-key isearch-mode-map "\C-f" 'isearch-yank-symbol)

;;; recursive edit
;; inspired by Erik Naggum's `recursive-edit-with-single-window'
(defmacro recursive-edit-preserving-window-config (body)
  "*Return a command that enters a recursive edit after executing BODY.
 Upon exiting the recursive edit (with\\[exit-recursive-edit] (exit)
 or \\[abort-recursive-edit] (abort)), restore window configuration
 in current frame."
  `(lambda ()
     "See the documentation for `recursive-edit-preserving-window-config'."
     (interactive)
     (save-window-excursion
      ,body
      (recursive-edit))))

(define-key global-map (kbd "C-c 0") (recursive-edit-preserving-window-config (delete-window)))
(define-key global-map (kbd "C-c 1")
  (recursive-edit-preserving-window-config
   (if (one-window-p 'ignore-minibuffer)
       (error "Current window is the only window in its frame")
     (delete-other-windows))))

;;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-strip-common-suffix t)

;;; winner -- restore windows configuration
(when (fboundp 'winner-mode)
  (winner-mode 1))

;;; font-lock
(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t
      font-lock-maximum-size nil
      font-lock-support-mode 'jit-lock-mode
      font-lock-verbose nil)

;;; Linkd
;; (require 'linkd)
;; (setq linkd-use-icons t)
;; (setq linkd-icons-directory "~/.emacs.d/linkd-icons")
;; (add-hook 'text-mode-hook 'linkd-mode)

;;; unicode-helper
(require 'unicode-helper "unicode-helper-mode")

;;; http-twiddle
(require 'http-twiddle)

;;; w3m
(require 'w3m nil t)
;;(require 'mime-w3m)
(setq w3m-icon-directory "~/.emacs.d/emacs-w3m/icons")
(setq w3m-home-page "http://cliki.net/")

(defun w3m-buffer (&optional url charset)
  "Render the current buffer.
    See `w3m-region' for the optional arguments."
  (interactive (list (w3m-expand-file-name-as-url
                      (or (buffer-file-name)
                          default-directory))))
  (w3m-region (point-min) (point-max) url charset))

(defun w3m-browse-url-other-window (url &optional newwin)
  (interactive
   (browse-url-interactive-arg "w3m URL: "))
  (let ((pop-up-frames nil))
    (switch-to-buffer-other-window
     (w3m-get-buffer-create "*w3m*"))
    (w3m-browse-url url)))

;;; webjump
(require 'webjump-plus)
(define-key global-map (kbd "C-c j") 'webjump)
(setq webjump-sites
      (append '(("My Blog" . "www.huangjs.net/blog/")
                ("Cliki" .
                 [simple-query "http://www.cliki.net/" "http://www.cliki.net/admin/search?words=" ""]))
              webjump-plus-sites
              webjump-sample-sites))

;;; browse-apropos-url
;; Don't know if it's the best way , but it seemed to work. (Requires emacs >= 20)
(setq apropos-url-alist
      '(("^gw?:? +\\(.*\\)" . ;; Google Web
         "http://www.google.com/search?q=\\1")

        ("^g!:? +\\(.*\\)" . ;; Google Lucky
         "http://www.google.com/search?btnI=I%27m+Feeling+Lucky&q=\\1")

        ("^gl:? +\\(.*\\)" .  ;; Google Linux
         "http://www.google.com/linux?q=\\1")

        ("^gi:? +\\(.*\\)" . ;; Google Images
         "http://images.google.com/images?sa=N&tab=wi&q=\\1")

        ("^gg:? +\\(.*\\)" . ;; Google Groups
         "http://groups.google.com/groups?q=\\1")

        ("^gd:? +\\(.*\\)" . ;; Google Directory
         "http://www.google.com/search?&sa=N&cat=gwd/Top&tab=gd&q=\\1")

        ("^gn:? +\\(.*\\)" . ;; Google News
         "http://news.google.com/news?sa=N&tab=dn&q=\\1")

        ("^gt:? +\\(\\w+\\)|? *\\(\\w+\\) +\\(\\w+://.*\\)" . ;; Google Translate URL
         "http://translate.google.com/translate?langpair=\\1|\\2&u=\\3")

        ("^gt:? +\\(\\w+\\)|? *\\(\\w+\\) +\\(.*\\)" . ;; Google Translate Text
         "http://translate.google.com/translate_t?langpair=\\1|\\2&text=\\3")

        ("^/\\.$" . ;; Slashdot
         "http://www.slashdot.org")

        ("^/\\.:? +\\(.*\\)" . ;; Slashdot search
         "http://www.osdn.com/osdnsearch.pl?site=Slashdot&query=\\1")

        ("^fm$" . ;; Freshmeat
         "http://www.freshmeat.net")

        ("^ewiki:? +\\(.*\\)" . ;; Emacs Wiki Search
         "http://www.emacswiki.org/cgi-bin/wiki?search=\\1")

        ("^ewiki$" . ;; Emacs Wiki
         "http://www.emacswiki.org")

        ("^arda$" . ;; The Encyclopedia of Arda
         "http://www.glyphweb.com/arda/")

        ))

(defun browse-apropos-url (text &optional new-window)
  (interactive (browse-url-interactive-arg "Location: "))
  (let ((text (replace-regexp-in-string
               "^ *\\| *$" ""
               (replace-regexp-in-string "[ \t\n]+" " " text))))
    (let ((url (assoc-default
                text apropos-url-alist
                '(lambda (a b) (let () (setq __braplast a) (string-match a b)))
                text)))
      (browse-url (replace-regexp-in-string __braplast url text) new-window))))

(defun browse-apropos-url-on-region (min max text &optional new-window)
  (interactive "r \nsAppend region to location: \nP")
  (browse-apropos-url (concat text " " (buffer-substring min max)) new-window))


;;; google client
(load-library "g")
(setq g-user-email "jianshi.huang@gmail.com")
(setq g-html-handler 'w3m-buffer)

;;; undo-tree
(require 'undo-tree)

;;; ee
(require 'ee-autoloads)

;;; geektool
(defun geektool ()
  (interactive)
  ;; full-screen frame settings
  (menu-bar-mode -1)
  (tool-bar-mode -1) 
  (switch-to-buffer-other-frame (buffer-name))
  ;; create windows as needed
  (delete-other-windows)
  (calendar)
  (split-window-horizontally)
  (other-window 2)
  (split-window)
  (set-window-text-height nil 25)
  (split-window-horizontally)
  (other-window 1)
  ;; terminal window width
  (enlarge-window-horizontally
   (- 80 (window-width)))
  ;; now start programms
  (ansi-term "/bin/bash" "top")
  (insert "top")
  (term-send-input)
  (other-window 1)
  (split-window-horizontally)
  (switch-to-buffer "ps-top")
  (enlarge-window-horizontally
   (- 30 (window-width)))
  (shell-command "geektool-pstop1.sh" "ps-top")
  (other-window 1)
  (split-window)
  (switch-to-buffer "External IP")
  (shell-command "echo External IP: `curl -s http://checkip.dyndns.org/ | sed 's/[a-zA-Z<>/ :]//g'`" "External IP")
  (split-window)
  (other-window 1)
  (switch-to-buffer "Network")
  (shell-command "my-connections.sh" "Network")
  (other-window 1)
  (find-file (file-name-sans-versions "/private/var/log/system.log" t))
  (other-window 1)
  (switch-to-buffer "Uptime")
  (split-window)
  (switch-to-buffer "Disk")
  (other-window 2)
  (shell-command "uptime | awk '{printf "Uptime: " $3 " " $4 " " $5 " " }'; top -l 1 |
               awk '/PhysMem/ {printf "RAM : " $8 ", "}' ; top -l 2 |
               awk '/CPU usage/ && NR > 5 {print $6, $7=":", $8, $9="user", $10, $11="sys", $12, $13}'"
               "Uptime")
  (other-window 1)
  (shell-command "df -h | grep disk0s3 | awk '{print "Macintosh HD:", $2, "total,", $3, "used,", $4, "remaining"}'" "Disk")
  (other-window 1)
  ;; turn off undo for terminal, to avoid memory exhaust
  (with-current-buffer "*top*" (setq buffer-undo-list t)))


;;; Configure outbound mail (SMTP)
;; (setq smtpmail-smtp-server "smtp.msi.co.jp"
;;       smtpmail-local-domain "msi.co.jp"
;;       smtpmail-default-smtp-server "smtp.msi.co.jp"
;;       send-mail-function 'smtpmail-send-it
;;       message-send-mail-function 'message-smtpmail-send-it
;;       message-default-mail-headers "Bcc: huang@msi.co.jp"
;;       ;; smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
;;       ;; smtpmail-smtp-service 587
;;       ;; smtpmail-auth-credentials '(("smtp.gmail.com"
;;       ;;                   587
;;       ;;                   "jianshi.huang@gmail.com"
;;       ;;                   nil))
;;       )



;;; gnus
;; (require 'gnus)

;; (setq msi-mail
;;       `(nnimap "mail"
;;                (imap-shell-program "~/bin/imap")
;;                (nnimap-stream shell)))

;; (setq gnus-select-method msi-mail
;;       gnus-secondary-select-methods nil
;;       mail-user-agent 'gnus-user-agent
;;       mail-self-blind t)

;; (add-to-list 'gnus-secondary-select-methods
;;              '(nnmaildir "localhost"
;;                (directory "~/Maildir")
;;                (directory-files nnheader-directory-files-safe)
;;                (get-new-mail nil)))

;; (setq gnus-nntp-server nil
;;       gnus-read-active-file nil
;;       gnus-save-newsrc-file nil
;;       gnus-read-newsrc-file nil
;;       gnus-check-new-newsgroups nil
;;       mail-sources nil
;;       mm-coding-system-priorities '(iso-8859-1 iso-2022-jp iso-2022-jp-2 utf-8))


;;; mew
;; (require 'mew nil t)
;; (autoload 'mew-send "mew" nil t)

;; ;; Optional setup (Read Mail menu for Emacs 21):
;; (if (boundp 'read-mail-command)
;;     (setq read-mail-command 'mew))

;; ;; Optional setup (e.g. C-xm for sending a message):
;; (autoload 'mew-user-agent-compose "mew" nil t)
;; (if (boundp 'mail-user-agent)
;;     (setq mail-user-agent 'mew-user-agent))
;; (if (fboundp 'define-mail-user-agent)
;;     (define-mail-user-agent
;;         'mew-user-agent
;;         'mew-user-agent-compose
;;       'mew-draft-send-message
;;       'mew-draft-kill
;;       'mew-send-hook))

;; (define-key global-map (kbd "C-c m") 'mew)

;; (add-hook 'mew-draft-mode-hook 'orgtbl-mode)
;; (add-hook 'mew-draft-mode-hook 'turn-on-orgstruct++)

;; ;;; lsdb
;; (autoload 'lsdb-gnus-insinuate "lsdb")
;; (autoload 'lsdb-gnus-insinuate-message "lsdb")
;; (add-hook 'gnus-startup-hook 'lsdb-gnus-insinuate)
;; (add-hook 'message-setup-hook
;;           (lambda ()
;;             (define-key message-mode-map "\C-c\C-t" 'lsdb-complete-name)))
;; (add-hook 'gnus-summary-mode-hook
;;           (lambda ()
;;             (define-key gnus-summary-mode-map ":" 'lsdb-toggle-buffer)))

;; (autoload 'lsdb-mew-insinuate "lsdb")
;; (add-hook 'mew-init-hook 'lsdb-mew-insinuate)
;; (add-hook 'mew-draft-mode-hook
;;           (lambda ()
;;             (define-key mew-draft-header-map "\M-I" 'lsdb-complete-name)))
;; (add-hook 'mew-summary-mode-hook
;;           (lambda ()
;;             (define-key mew-summary-mode-map "L" 'lsdb-toggle-buffer)))

;;; boxquote, footage and snip (for emails)
(require 'boxquote nil t)
(require 'footnote nil t)
(add-hook 'message-mode-hook 'footnote-mode)
(add-hook 'message-mode-hook 'turn-on-filladapt-mode)
(add-hook 'message-mode-hook 'turn-on-auto-fill)
(add-hook 'message-mode-hook 'turn-on-font-lock)

(defun snip (b e summ)
  "remove selected lines, and replace it with [snip:summary (n lines)]"
  (interactive "r\nsSummary:")
  (let ((n (count-lines b e)))
    (delete-region b e)
    (insert (format "[snip%s (%d line%s)]"
                    (if (= 0 (length summ)) "" (concat ": " summ))
                    n
                    (if (= 1 n) "" "s")))))


;;; lookup acronyms
;;; Usage: M-x wtf
(load-library "wtf")
(defalias 'wtf 'wtf-is)

;;; env: color theme
(require 'color-theme)
(require 'manoj-colors)
(require 'color-theme-tango)
(require 'color-theme-zenburn)
(color-theme-initialize)
(setq color-theme-is-global t)

;;; paren-face
(load-library "paren-face")
(set-face-foreground 'paren-face "gray50")

;;; my-color-theme
(defun my-color-theme ()
  (interactive)
  (if window-system
      (progn
        (color-theme-zenburn)
        )
    (progn
      (color-theme-manoj-dark)
      )))


;;; highlight
(require 'highlight) 

;;; highlight-tail
(require 'highlight-tail)
(defun rgb-color (string)
  "Convert colors names to 24bit rgb number string in hexical mode"
  (format "#%02x%02x%02x"
          (/ (nth 0 (x-color-values string)) 256)
          (/ (nth 1 (x-color-values string)) 256)
          (/ (nth 2 (x-color-values string)) 256)))
(setq highlight-tail-colors `((,(rgb-color "white") . 0)
                              (,(rgb-color "snow3") . 50)
                              (,(rgb-color "white") . 100))
      highlight-tail-steps 10
      highlight-tail-timer 0.05)


;;; pretty symbols
(load-library "pretty-symbols")

;;; imenu
(require 'imenu+)
(define-key global-map (kbd "C-c i") 'imenu)
(add-hook 'c-mode-common-hook 'imenu-add-menubar-index)
(add-hook 'emacs-lisp-mode-hook 'imenu-add-menubar-index)
(add-hook 'lisp-mode-hook 'imenu-add-menubar-index)
(add-hook 'haskell-mode-hook 'imenu-add-menubar-index)
(add-hook 'scheme-mode-hook 'imenu-add-menubar-index)
(add-hook 'caml-mode-hook 'imenu-add-menubar-index)
(add-hook 'ruby-mode-hook 'imenu-add-menubar-index)
(add-hook 'python-mode-hook 'imenu-add-menubar-index)

;;; env: set frame transparecy
;;;(modify-frame-parameters (selected-frame) '((active-alpha . 1.0)))
;;;(modify-frame-parameters (selected-frame) '((inactive-alpha . 0.4)))

;;; more shell stuff
(defvar th-shell-popup-buffer nil)
(defun th-shell-popup ()
  "Toggle a shell popup buffer with the current file's directory as cwd."
  (interactive)
  (unless (buffer-live-p th-shell-popup-buffer)
    (save-window-excursion (shell "*Popup Shell*"))
    (setq th-shell-popup-buffer (get-buffer "*Popup Shell*")))
  (let ((win (get-buffer-window th-shell-popup-buffer))
        (dir (file-name-directory (or (buffer-file-name) user-init-file))))
    (if win
        (delete-window win)
      (pop-to-buffer th-shell-popup-buffer nil t)
      (comint-send-string nil (concat "cd " dir "\n")))))

;;;; keys
(setq mac-command-modifier 'meta)       ; set meta keymap
(setq mac-option-modifier 'alt)

;;; switch parens
(define-key key-translation-map [?\(] [?\[])
(define-key key-translation-map [?\[] [?\(])
(define-key key-translation-map [?\)] [?\]])
(define-key key-translation-map [?\]] [?\)])

;;; keys: global
(require 'paredit)
(paredit-mode 1)
(define-key paredit-mode-map (kbd ")") 'paredit-close-parenthesis)
(define-key paredit-mode-map (kbd "C-k") 'kill-sexp)
(define-key paredit-mode-map (kbd "M-k") 'paredit-kill) 
(define-key paredit-mode-map (kbd "M-(") 'paredit-wrap-sexp)
(define-key paredit-mode-map (kbd "M-)") 'paredit-splice-sexp)
(define-key paredit-mode-map (kbd "M-[") 'paredit-forward-barf-sexp)
(define-key paredit-mode-map (kbd "M-]") 'paredit-forward-slurp-sexp)
(define-key paredit-mode-map (kbd "C-(") 'paredit-backward-slurp-sexp)
(define-key paredit-mode-map (kbd "C-)") 'paredit-backward-barf-sexp)
(define-key paredit-mode-map (kbd "C-d") 'delete-char)
(define-key paredit-mode-map (kbd "C-M-j") 'paredit-forward-down)
;; clear
(define-key paredit-mode-map (kbd "M-r") nil)
(define-key paredit-mode-map (kbd "M-s") nil) 

;;; flyspell
(require 'flyspell)
(ispell-change-dictionary "american")
(add-hook 'text-mode-hook (lambda () (flyspell-mode 1)))
(add-hook 'org-mode-hook (lambda () (flyspell-mode 1)))
(add-hook 'c-mode-common-hook 'flyspell-prog-mode)
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)
(add-hook 'lisp-mode-hook 'flyspell-prog-mode)
(add-hook 'haskell-mode-hook 'flyspell-prog-mode)
(add-hook 'scheme-mode-hook 'flyspell-prog-mode)
(add-hook 'caml-mode-hook 'flyspell-prog-mode)
(add-hook 'ruby-mode-hook 'flyspell-prog-mode)
(add-hook 'python-mode-hook 'flyspell-prog-mode)

(define-key global-map (kbd "<C-tab>") 'other-window)
(define-key global-map (kbd "C-c p") 'flyspell-check-previous-highlighted-word)

;; replaced by bubble-buffer
;; (define-key global-map (kbd "<C-prior>") 'bury-buffer)
;; (define-key global-map (kbd "<C-next>") 'yic-next-buffer)

(define-key global-map (kbd "<C-M-prior>") 'other-window)
(define-key global-map (kbd "<C-M-next>") 'sams-other-window-backwards)

(define-key global-map (kbd "<M-left>") 'backward-sexp)
(define-key global-map (kbd "<M-right>") 'forward-sexp)
(define-key global-map (kbd "<M-up>") 'backward-up-list)
(define-key global-map (kbd "<M-down>") 'paredit-forward-down)

(define-key global-map (kbd "M-SPC") 'dabbrev-expand)
(define-key global-map (kbd "C-M-/") 'ispell-complete-word)
(define-key global-map (kbd "C-M-SPC") 'hippie-expand)
(define-key global-map (kbd "M-/") 'auto-complete)

(define-key global-map (kbd "<home>") 'beginning-of-buffer)
(define-key global-map (kbd "<end>") 'end-of-buffer)

(define-key global-map (kbd "<f1>") 'term)
(define-key global-map (kbd "<f2>") 'shell)
(define-key global-map (kbd "<f3>") 'start-sbcl)
(define-key global-map (kbd "<f4>") 'start-ccl)
(define-key global-map (kbd "<f9>") 'th-shell-popup)

(global-set-key [C-mouse-1] 'mouse-copy-ignore-event)
(global-set-key [C-drag-mouse-1] 'mouse-copy-ignore-event)
(global-set-key [C-down-mouse-1] 'mouse-insert-sexp-at-point)

(defun mouse-copy-ignore-event (event)
  "Ignores a (mouse) event.
This is used to override mouse bindings in a minor mode keymap,
but does otherwise nothing."
  (interactive "e"))

(defun mouse-insert-sexp-at-point (start-event)
  "Insert the sexp under the mouse cursor at point.
This command  must be bound to a mouse event."
  (interactive "*e")
  (let ((posn (event-start start-event)))
    (let ((sexp-at-mouse-pos
           (with-selected-window (posn-window posn)
             (save-excursion
               (goto-char (posn-point posn))
               (thing-at-point 'sexp)))))
      (if sexp-at-mouse-pos
          (progn
            (unless (or (bolp)
                        (and (minibufferp)
                             (= (point) (minibuffer-prompt-end)))
                        (save-excursion
                          (backward-char)
                          (looking-at "\\s-\\|\\s\(")))
              (insert " "))
            (insert sexp-at-mouse-pos)
            (unless (or (eolp)
                        (and (minibufferp)
                             (= (point) (minibuffer-prompt-end)))
                        (looking-at "\\s-\\|\\s\)"))
              (insert " ")))
          (error "Mouse not at a sexp")))))


(defun smart-space ()
  "make the space key behave in a smarter way"
  (interactive)
  (if (not (expand-abbrev))
      (insert " ")))

(defun just-one-space-afterward ()
  (interactive)
  (insert-string " ")
  (backward-char))

;; (define-key global-map (kbd "SPC") 'smart-space)
;; (define-key global-map (kbd "<backtab>") 'indent-for-tab-command)
;; (define-key global-map (kbd "M-<f5>") nil) ;don't use!
(define-key global-map (kbd "C-x SPC") 'just-one-space-afterward)

;; show unnecessary white spaces
;; (require 'show-wspace)
;; (unless show-ws-highlight-trailing-whitespace-p
;;   (show-ws-toggle-show-trailing-whitespace))

;; delete trailing whitespaces automatically
;; NOTE: will cause errors in MEW
;; (add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; trim spaces
(defun raise-to-prev-line ()
  (interactive)
  (move-beginning-of-line nil)
  (fixup-whitespace)
  (paredit-backward-delete)
  (fixup-whitespace))

(defun drop-to-next-line ()
  (interactive)
  (newline-and-indent)
  (forward-sexp))

(define-key global-map (kbd "M-t") 'fixup-whitespace)
(define-key global-map (kbd "C-t") 'transpose-sexps)
(define-key global-map (kbd "C-M-t") 'transpose-words)
(define-key global-map (kbd "<C-backspace>") 'raise-to-prev-line)
(define-key global-map (kbd "<C-return>") 'drop-to-next-line)
(define-key global-map (kbd "<C-M-backspace>") 'backward-kill-word)
(define-key global-map (kbd "RET") 'newline-and-indent)
;; (define-key global-map (kbd "C-j") 'indent-new-comment-line)

;; mark
(define-key global-map (kbd "C-x RET C-s") 'mark-end-of-sentence)
(define-key global-map (kbd "C-x RET C-l") 'mark-end-of-line)
(define-key global-map (kbd "C-x RET C-p") 'mark-paragraph)
(define-key global-map (kbd "C-x RET C-e") 'mark-sexp)
(define-key global-map (kbd "C-x RET C-w") 'mark-word)

;; captitalize
(defun upcase-previous-word ()
  (interactive)
  (backward-word)
  (upcase-word 1))

(define-key global-map (kbd "M-u") 'upcase-previous-word)

;; ffap
(require 'ffap)
(define-key global-map (kbd "C-x M-f") 'find-file-at-point)
(define-key global-map (kbd "C-x 4 f") 'ffap-other-window)
(define-key global-map (kbd "C-x 5 f") 'ffap-other-frame)

;; Emacs 23: bundled EasyPG
(require 'epa)
(epa-file-enable)
(setq epg-gpg-program "gpg")

;; ibuffer
(define-key global-map (kbd "C-x C-b") 'ibuffer)

(setq
 ibuffer-default-sorting-mode 'major-mode
 ibuffer-fontification-level t)

(add-hook 'ibuffer-mode-hooks
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "My-ibuffer-grps")
            (ibuffer-add-to-tmp-hide "\\*scratch\\*" "\\*Completions\\*")))

;; switch buffers
(when (require 'bubble-buffer nil t)
  (define-key global-map (kbd "<C-prior>") 'bubble-buffer-next)
  (define-key global-map (kbd "<C-next>") 'bubble-buffer-previous))
(setq bubble-buffer-omit-regexp "\\(^ .+$\\|\\*Messages\\*\\|*compilation\\*\\|\\*.+output\\*$\\|\\*TeX Help\\*$\\|\\*vc-diff\\*\\|\\*Occur\\*\\|\\*grep\\*\\|\\*cvs-diff\\*\\)")

;;; keys: paredit
(define-key global-map (kbd "M-)") 'paredit-splice-sexp)
;; marker
(define-key global-map (kbd "C-M-h") 'mark-sexp)
;; cursor movement
(define-key global-map (kbd "C-f") 'forward-sexp)
(define-key global-map (kbd "M-f") 'forward-word)
(define-key global-map (kbd "C-M-f") 'forward-list)
(define-key global-map (kbd "C-b") 'backward-sexp)
(define-key global-map (kbd "M-b") 'backward-word)
(define-key global-map (kbd "C-M-b") 'backward-list)
(define-key global-map (kbd "C-M-n") 'forward-paragraph)
(define-key global-map (kbd "C-M-p") 'backward-paragraph)
;; kill-sexp
(define-key global-map (kbd "C-k") 'kill-sexp)
(define-key global-map (kbd "M-k") 'kill-line)
(define-key global-map (kbd "C-M-k") 'kill-sentence)
;; deletion
(define-key isearch-mode-map [(backspace)] 'isearch-delete-char)

;;; ido
(require 'ido)
(ido-mode 1)
(ido-everywhere 1)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have
(setq ido-max-directory-size 300000
      ido-confirm-unique-completion t
      ido-use-filename-at-point 'guess
      ido-use-url-at-point t)
;; (setq ido-auto-merge-work-directories-length -1)
(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map [tab] 'ido-complete)))
(add-to-list 'ido-ignore-buffers "^ ")
(add-to-list 'ido-ignore-buffers "*Messages*")
(add-to-list 'ido-ignore-buffers "*ECB")
(add-to-list 'ido-ignore-buffers "*ESS")
(add-to-list 'ido-ignore-buffers "*Buffer")
(add-to-list 'ido-ignore-buffers "*Completions")
(add-to-list 'ido-ignore-buffers "^[tT][aA][gG][sS]$")
;; ido M-x
(defun ido-execute ()
  (interactive)
  (call-interactively
   (intern
    (ido-completing-read
     "M-x "
     (let (cmd-list)
       (mapatoms (lambda (S) (when (commandp S) (setq cmd-list (cons (format "%S" S) cmd-list)))))
       cmd-list)))))
(define-key global-map (kbd "C-x M-x") 'ido-execute)
;; ido tag
(defun my-ido-find-tag ()
  "Find a tag using ido"
  (interactive)
  (tags-completion-table)
  (let (tag-names)
    (mapc (lambda (x)
            (unless (integerp x)
              (push (prin1-to-string x t) tag-names)))
          tags-completion-table)
    (find-tag (ido-completing-read "Tag: " tag-names))))


;;; recentf and ido
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 100)
(defun my-choose-from-recentf ()
  "Use ido to select a recently opened file from the `recentf-list'"
  (interactive)
  (find-file (ido-completing-read "Open file: " recentf-list nil t)))
(define-key global-map (kbd "C-x C-M-f") 'my-choose-from-recentf)

;;; keywiz
(require 'keywiz)

;;; eshell
;; (require 'eshell)
;; (require 'em-smart)
;; (setq eshell-where-to-jump 'begin)
;; (setq eshell-review-quick-commands nil)
;; (setq eshell-smart-space-goes-to-end t)

;;; bash-completion for shell
(require 'bash-completion)
(bash-completion-setup)
(setq bash-completion-process-timeout 5)

;;; compilation highlighting for shell
(add-hook 'shell-mode-hook 'compilation-shell-minor-mode)

;;; jump-char
(define-key global-map (kbd "C-x M-m") 'back-to-indentation)
(require 'jump-char)
(define-key global-map (kbd "M-m") 'jump-char-forward)
(define-key global-map (kbd "M-M") 'jump-char-backward)

;;; mark-multiple
(require 'inline-string-rectangle)
(define-key global-map (kbd "C-x r t") 'inline-string-rectangle)
            
(require 'mark-more-like-this)
(define-key global-map (kbd "C-M-<") 'mark-previous-like-this)
(define-key global-map (kbd "C-M->") 'mark-next-like-this)
(define-key global-map (kbd "C-M-m") 'mark-more-like-this) ; like the other two, but takes an argument (negative is previous)

;;; sgml mode
;; (require 'sgml-mode)
;; (require 'rename-sgml-tag)
;; (define-key sgml-mode-map (kbd "C-c C-r") 'rename-sgml-tag)

;;; helm mode (anything)
(require 'helm-config)
(defalias 'anything 'helm-mini)

;;; expand-region
(require 'expand-region)
(define-key global-map (kbd "C-@") 'er/expand-region)
(define-key global-map (kbd "C-M-@") 'er/contract-region)

;;; bib management
(require 'ebib)

;;; magit for git mode
(require 'magit)
;; (define-key global-map (kbd "C-x g") 'magit-status)

;;; git-emacs
(require 'vc-git)
(require 'git-emacs)

;;; svn
(require 'psvn)

;;; mdfind
(require 'mdfind)

;;;; modes
;;; modes: dired mode
(add-hook 'dired-load-hook
          (function (lambda () (load "dired-x"))))

(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "o") 'dired-open-desktop)
            (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)))

(defun dired-open-desktop ()
  "run programs using Ubuntu's shell command : xdg-open"
  (interactive)
  (let ((file-name (dired-get-file-for-visit)))
    (if (file-exists-p file-name)
        (shell-command (concat "xdg-open '" file-name "'" nil)))))


;;; projectile mode
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

;;; xiki
(require 'inf-ruby)
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(autoload 'inf-ruby-keys "inf-ruby" "" t)
(eval-after-load 'ruby-mode
  '(add-hook 'ruby-mode-hook 'inf-ruby-keys))
(defalias 'inf-ruby-keys 'inf-ruby-setup-keybindings)
(require 'ruby-block)
(require 'el4r)
;; (el4r-boot)

;;; org mode, org-mode
(require 'org)
(require 'org-exp-blocks)
(require 'org-latex)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot        . t)
   (emacs-lisp . t)
   (haskell    . t)
   (org        . t)
   (perl       . t)
   (python     . t)
   (R          . t)
   (ruby       . t)
   (sh         . t)
   (sqlite     . t)
   (lisp       . t)
   (scheme     . t)))
;; (setq org-confirm-babel-evaluate nil)

(setf (third (assoc "hidestars" org-startup-options)) t)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-ido-switchb)
(setq org-log-done t)
(setq org-directory "~/org")
(setq org-agenda-files (list "~/org/gtd" "~/org/projects"))
(setq org-mobile-inbox-for-pull "~/org/gtd/from-mobile.org")
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-return-follows-link t)
;; (setq org-blank-before-new-entry
;;   '((heading . t) (plain-list-item . nil)))
(setq org-agenda-custom-commands
      '(("w" todo "WAITING" nil)
        ("n" todo "NEXT" nil)
        ("d" "Agenda + Next Actions" ((agenda) (todo "NEXT")))))

;; octopress
(setq org-publish-project-alist
      '(("blog" .  (:base-directory "~/blog/source/org_posts/"
                                    :base-extension "org"
                                    :publishing-directory "~/blog/source/_posts/"
                                    :sub-superscript ""
                                    :recursive t
                                    :publishing-function org-publish-org-to-html
                                    :headline-levels 4
                                    :html-extension "markdown"
                                    :body-only t))
        ("about" .  (:base-directory "~/blog/source/about/"
                                    :base-extension "org"
                                    :publishing-directory "~/blog/source/about/"
                                    :sub-superscript ""
                                    :recursive t
                                    :publishing-function org-publish-org-to-html
                                    :headline-levels 4
                                    :html-extension "markdown"
                                    :body-only t))))

;; wordpress connection
(require 'org2blog)
(setq org2blog/wp-blog-alist
      '(("my-tech-blog"
         :url "http://huangjs.net/blog/xmlrpc.php"
         :username "huangjs"
         :default-title "New Post"
         :default-categories ("Algorithms")
         :tags-as-categories nil
         :wp-latex t
         :wp-code t
         :track-posts nil
         )))
(setq org2blog/wp-sourcecode-default-params "light=\"true\" lang=\"lisp\"")

;; o-blog for authoring
(require 'o-blog)

;; export settings
(setq org-export-with-toc nil
      org-export-with-todo-keywords nil
      org-export-html-use-infojs t
      org-hide-leading-stars t
      org-export-latex-listings t
      org-export-latex-class-options "[svgnames,mathserif]"
      org-latex-to-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f")
      org-todo-keywords
      '((sequence "TODO" "|" "DONE" "DEPRECATED")))

(setq org-export-latex-packages-alist
      '(("" "amsmath" t)
        ("" "wasysym" t)
        ("" "color" t)
        ("" "xcolor" t)
        ("" "upquote" t)
        ("" "listings" t)
        ("" "tikz" t)
        ("" "fancyvrb" t)
        ("" "fontspec" t)
        ("" "xunicode" t)
        ("" "xltxtra" t)
        ))

(setq org-export-latex-default-packages-alist
      (remove-if (lambda (package)
                   (and (listp package)
                        (or (equal (second package) "wasysym")
                            (equal (second package) "inputenc"))))
                 org-export-latex-default-packages-alist))

;; gtd
(defun gtd ()
  (interactive)
  (find-file "~/Dropbox/Personal/org/gtd.org"))
(define-key global-map (kbd "C-x t") 'gtd)

;; bib citation in org-mode
(defun org-mode-article-modes ()
  (interactive)
  (load-library "reftex")
  (bib-cite-minor-mode t)
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all))
  (reftex-set-cite-format
   '((?b . "[[bib::%l]]")
     (?n . "[[note::%l]]")))
  (define-key org-mode-map "\C-c\C-g" 'reftex-citation))

(add-hook 'org-mode-hook
          (lambda ()
            ;; only for files with WRITE in todo list
            (if (member "WRITE" org-todo-keywords-1)
                (org-mode-article-modes))
            (define-key org-mode-map (kbd "<C-tab>") 'other-window)
            ;; cdlatex
            ;; (turn-on-org-cdlatex)
            ;; (setq cdlatex-simplify-sub-super-scripts nil)
            ))

;; -- Display images in org mode
;; NOTE: may want to have a look at `org-display-inline-images'
;; enable image mode first
(iimage-mode)
;; add the org file link format to the iimage mode regex
(add-to-list 'iimage-mode-image-regex-alist
             (cons (concat "\\[\\[file:\\(~?" iimage-mode-image-filename-regex "\\)\\]")  1))
;;  add a hook so we can display images on load
(add-hook 'org-mode-hook '(lambda () (org-turn-on-iimage-in-org)))
;; function to setup images for display on load
(defun org-turn-on-iimage-in-org ()
  "display images in your org file"
  (interactive)
  (turn-on-iimage-mode)
  (set-face-underline-p 'org-link nil))
;; function to toggle images in a org bugger
(defun org-toggle-iimage-in-org ()
  "display images in your org file"
  (interactive)
  (if (face-underline-p 'org-link)
      (set-face-underline-p 'org-link nil)
    (set-face-underline-p 'org-link t))
  (call-interactively 'iimage-mode))


;;; remember mode
(require 'remember)
(org-remember-insinuate)
(define-key global-map "\C-cr" 'org-remember)

(setq org-remember-templates
      '(("Todo" ?t "* TODO %^{Brief Description} %^g\n%?\nAdded: %U"
         "~/Dropbox/Personal/org/gtd.org" "Tasks")
        ("Journal"   ?j "** %^{Head Line} %U %^g\n%i%?"
         "~/Dropbox/Personal/org/journal.org")))


;;; outline mode
(require 'outline)
(add-hook 'emacs-lisp-mode-hook (lambda () (outline-minor-mode 1)))
(add-hook 'lisp-mode-hook (lambda () (outline-minor-mode 1)))
(add-hook 'slime-mode-hook (lambda () (outline-minor-mode 1)))
(add-hook 'org-mode-hook (lambda () (outline-minor-mode 1)))

;;; narrow
(put 'narrow-to-defun 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;;; savehist
(require 'savehist)
(savehist-mode 1)

;;; session
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;;; info mode
(require 'info)
(setq Info-directory-list
      (list
       (file-name-as-directory
        (expand-file-name "info" (getenv "HOME")))
       "/usr/local/share/info/"
       "/usr/local/info/"
       "/usr/share/info/emacs-snapshot/"
       "/usr/share/info/"))
(defun my-Info-index ()
  (interactive)
  (Info-index (ido-completing-read "Index topic: " (Info-index-nodes) nil t)))

;;; smex
;; (require 'smex)
;; (define-key global-map (kbd "M-x") 'smex)
;; (define-key global-map (kbd "M-X") 'smex-major-mode-commands)
;; (define-key global-map (kbd "C-c M-x") 'smex-update-and-run)
;; This is your old M-x.
;; (define-key global-map (kbd "C-c C-c M-x") 'execute-extended-command)


;;;; customize
;;; customize: appearance
;; minor mode string
(setq pending-delete-modeline-string " PD")
(setq filladapt-mode-line-string "")
(add-minor-mode 'abbrev-mode " Ab")
(add-minor-mode 'mouse-avoidance-mode "")
(add-minor-mode 'paredit-mode " Par")

;; kill ring
(load-library "browse-kill-ring")
(define-key global-map (kbd "M-y") 'browse-kill-ring)

(defadvice yank (after indent-region activate)
  (if (member major-mode '(emacs-lisp-mode scheme-mode lisp-mode
                           c-mode c++-mode objc-mode
                           LaTeX-mode TeX-mode))
      (indent-region (region-beginning) (region-end) nil)))

;;; aux functions
;; match paren
(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "[([{]") (forward-sexp 1) (backward-char))
        ((looking-at "[])}]") (forward-char) (backward-sexp 1))))


;; word count
(defun word-count ()
  "Count the words in the current buffer, show the result in the minibuffer"
  (interactive)            ; *** This is the line that you need to add
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-min))
      (let ((count 0))
        (while (forward-word 1)
          (setq count(1+ count)))
        (message "There are %d words in the buffer" count)))))

(defalias 'wc 'word-count)

;;;; Libraries
(load-library "htmlize")

;;; sams
(load-library "sams-lib")

(defun yic-next-buffer ()
  "Switch to previous buffer in current window."
  (interactive)
  (switch-to-buffer (car (reverse (buffer-list)))))

(defun yic-other-buffer ()
  "Switch to the other buffer (2nd in list-buffer) in current window."
  (interactive)
  (switch-to-buffer (other-buffer)))

(defun yic-kill-current-buffer ()
  "Kill current buffer."
  (interactive)
  (kill-buffer (current-buffer)))


;;; crontab
(require 'crontab-mode)

;;; xrdb
(require 'xrdb-mode)

;;; FIXME and TODO highlighting
(mapcar (lambda (mode)
          (font-lock-add-keywords
           mode
           '(("\\(CHECK\\|TODO\\|FIXME\\|NOTE\\|CONFIRM\\)\\(:\\|!!\\|!\\)"
              0
              font-lock-warning-face prepend))))
        '(text-mode
          latex-mode
          html-mode
          emacs-lisp-mode
          lisp-mode
          scheme-mode
          haskell-mode
          texinfo-mode
          ruby-mode
          python-mode
          c-mode
          c++-mode
          ocaml-mode
          sh-mode
          js-mode
          js2-mode
          javascript-mode
          org-mode
          coffee-mode))

;;; pbook
(require 'pbook)

;;; find file recursively
(require 'find-recursive)

;;; mwe-log-commands
(require 'mwe-log-commands)

;;; erc
;; (require 'erc)
;; (setq erc-server "irc.freenode.net"
;;       erc-port 6667
;;       erc-nick "huangjs"
;;       erc-user-full-name user-full-name
;;       ;; erc-email-userid "userid"     ; for when ident is not activated
;;       erc-prompt-for-password nil      ; OPN doesn't require passwords
;;       erc-autojoin-channels-alist '(("freenode.net"
;;                                      "#lisp"
;;                                      "#clojure"
;;                                      "#shlug"
;;                                      "#lisp-china"
;;                                      ;; "#leiningen" 
;;                                      ;; "#haskell"
;;                                      ;; "#chinalug"
;;                                      ;; "#prolog"
;;                                      ;; "##posix"
;;                                      ;; "#gcc"
;;                                      ;; "##logic"
;;                                      ;; "##mathematica"
;;                                      ;; "#math-software"
;;                                      ))
;;       erc-kill-server-buffer-on-quit t)

;; (setq erc-modules
;;       '(autojoin irccontrols button match netsplit noncommands notify
;;         completion readonly ring services smiley stamp track))
;; (erc-update-modules)

;; (defun erc-button-add-nickname-buttons (entry)
;;   "Search through the buffer for nicknames, and add buttons."
;;   (let ((form (nth 2 entry))
;;         (fun (nth 3 entry))
;;         bounds word)
;;     (when (or (eq t form)
;;               (eval form))
;;       (goto-char (point-min))
;;       (while (forward-word 1)
;;         (setq bounds (bounds-of-thing-at-point 'word))
;;         (when bounds
;;           (setq word (buffer-substring-no-properties
;;                       (car bounds) (cdr bounds)))
;;           (if (erc-get-server-user word)
;;               (erc-button-add-button (car bounds) (cdr bounds)
;;                                      fun t (list word))))))))

;; ;; Notify my when someone mentions my nick.
;; (defun my-erc-notification (matched-type nick msg)
;;   (interactive)
;;   (when (eq matched-type 'current-nick)
;;     (message "(ERC) %s said: %s" nick msg)))
;; (add-hook 'erc-text-matched-hook 'my-erc-notification)


;;; hide lines and region
(require 'hide-lines)

;;; parsing generator
(require 'parser "parse")

;;; wrap-region
(require 'wrap-region)

;;; Saaxy
(require 'saaxy)

;;; two mode
(require 'two-mode-mode)

;;;; Language Modes

;;; gtags
(require 'gtags)
(define-key gtags-mode-map (kbd "M-,") 'gtags-find-rtag)
(add-hook 'c-mode-common-hook (lambda () (gtags-mode 1)))

;; from djcb
(defun gtags-create-or-update ()
  "create or update the gnu global tag file"
  (interactive)
  (if (not (= 0 (call-process "global" nil nil nil " -p"))) ; tagfile doesn't exist?
      (let ((olddir default-directory)
            (topdir (read-directory-name
                     "gtags: top of source tree:"
                     default-directory)))
        (cd topdir)
        (shell-command "gtags && echo 'created tagfile'")
        (cd olddir))             ; restore   
    ;;  tagfile already exists; update it
    (shell-command "global -u && echo 'updated tagfile'")))

(add-hook 'c-mode-common-hook
          (lambda ()
            (ido-ubiquitous-mode -1)
            (when (not (string-match "/usr/src/linux/" (expand-file-name default-directory)))  
              (gtags-create-or-update)))
          t) 


;;; cedet related
;; (load-file "~/.emacs.d/cedet/common/cedet.el")
;; (global-ede-mode 1)
;; ;; (semantic-load-enable-minimum-features)
;; (semantic-load-enable-code-helpers)
;; ;; (semantic-load-enable-gaudy-code-helpers)
;; ;; (semantic-load-enable-excessive-code-helpers)
;; ;; (semantic-load-enable-semantic-debugging-helpers)
;; (semantic-load-enable-all-exuberent-ctags-support)

;; (require 'semantic-ia)
;; (require 'semantic-gcc)
;; (require 'semantic-decorate-include)
;; (require 'eassist)
;; (defun my-cedet-hook ()
;;   (interactive)
;;   (local-set-key (kbd "C-c , d") 'semantic-ia-show-doc)
;;   (local-set-key (kbd "C-c , s") 'semantic-ia-show-summary)
;;   (local-set-key (kbd "M-.") 'semantic-ia-fast-jump)
;;   )
;; (add-hook 'c-mode-common-hook 'my-cedet-hook)

;; (require 'semanticdb-global)
;; (semanticdb-enable-gnu-global-databases 'c-mode)
;; (semanticdb-enable-gnu-global-databases 'c++-mode)
;; ;; Create a Project.ede equivalent for ede-simple-project
;; ;; by telling Emacs to load Project.el files
;; (defun check-for-Project-el ()
;;   (if (file-exists-p "Project.el")
;;       (load-file "Project.el")))
;; (add-hook 'find-file-hook 'check-for-Project-el)

;;; auto-completion
(require 'auto-complete)
(require 'auto-complete-config)
(require 'auto-complete-extension) 
(ac-config-default)
(setq ac-use-menu-map t
      ac-use-fuzzy nil
      ac-auto-show-menu 0.5
      ac-quick-help-delay 0.5
      ac-auto-start nil)

(add-to-list 'ac-user-dictionary "jianshi.huang@gmail.com")
(add-to-list 'ac-user-dictionary "jianshi@maptia.com")
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
(ac-set-trigger-key "<tab>")
(ac-set-trigger-key "TAB")
(define-key ac-mode-map (kbd "C-c h") 'ac-last-quick-help)
(define-key ac-mode-map (kbd "C-c H") 'ac-last-help)

;; c and c++ completion
(require 'auto-complete-clang)
(setq ac-clang-flags
      (mapcar (lambda (item)(concat "-I" item))
              (split-string
               ;; generated by
               ;; echo "" | g++ -v -x c++ -E -
               "
/usr/include/c++/4.6
/usr/include/c++/4.6/i686-linux-gnu/.
/usr/include/c++/4.6/backward
/usr/lib/gcc/i686-linux-gnu/4.6/include
/usr/local/include
/usr/lib/gcc/i686-linux-gnu/4.6/include-fixed
/usr/include/i386-linux-gnu
/usr/include
")))

(add-hook 'c-mode-common-hook
          (lambda () 
            (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))) 

;; haskell auto completion
(add-hook 'haskell-mode-hook
          (lambda () 
            (setq ac-sources '(ac-source-haskell 'ac-source-yasnippet)) 
            ))

;; latex completion
(require 'ac-math)
(add-to-list 'ac-modes 'latex-mode)
(defun ac-latex-mode-setup ()
  (setq ac-sources
        (append '(ac-source-math-unicode
                  ac-source-math-latex
                  ac-source-latex-commands)
                ac-sources)))
(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)

;; org mode completion
(add-to-list 'ac-modes 'org-mode)
(defun ac-org-mode-setup ()
  (setq ac-sources
        (add-to-list 'ac-sources 'ac-source-math-unicode)))
(add-hook 'org-mode-hook 'ac-org-mode-setup)


;;; emacs-lisp
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

(defun elispcomment ()
  (interactive)
  (insert ";:*=======================\n")
  (insert ";:* " (read-string "Comment: ") "\n"))

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (paredit-mode 1)
            (define-key emacs-lisp-mode-map (kbd "C-c C-e") 'eval-and-replace)
            (define-key emacs-lisp-mode-map (kbd "M-.") 'find-function)
            ))

(add-hook 'ielm-mode-hook
          (lambda ()
            (paredit-mode 1)
            (define-key ielm-map (kbd "<M-return>") 'ielm-return)
            (define-key ielm-map (kbd "C-c C-e") 'eval-and-replace)
            (define-key ielm-map (kbd "M-.") 'find-function)
            ))


;;; python mode
(require 'python)
(require 'ac-python)
(load-file "~/.emacs.d/emacs-for-python/epy-init.el")
(epy-setup-ipython)
(setq skeleton-pair nil)

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--pylab --colors=Linux"
      python-shell-prompt-regexp "In \\[[0-9]+\\]: "
      python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
      python-shell-completion-setup-code
      "from IPython.core.completerlib import module_completion"
      python-shell-completion-module-string-code
      "';'.join(module_completion('''%s'''))\n"
      python-shell-completion-string-code
      "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(defun my-python-eldoc-at-previous-point (symbol)
  "Get help on SYMBOL using `help'.
Interactively, prompt for symbol."
  (interactive
   (let ((symbol (save-excursion
                   (backward-word)
                   (python-info-current-symbol t)))
         (enable-recursive-minibuffers t))
     (list (read-string (if symbol
                            (format "Describe symbol (default %s): " symbol)
                          "Describe symbol: ")
                        nil nil symbol))))
  (message (python-eldoc--get-doc-at-point symbol)))

(define-key python-mode-map (kbd "C-c C-f") 'my-python-eldoc-at-previous-point) 

;; (require 'pymacs)
;; (pymacs-load "ropemacs" "rope-")
;; (setq ropemacs-enable-autoimport t)
;; (ac-ropemacs-initialize)
;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (setq python-indent-offset 4)
;;             (eldoc-mode 1)
;;             (flymake-mode 1) 
;;             (add-to-list 'ac-sources 'ac-source-ropemacs))) 

;; python compilation and breakpoint
;; (require 'python)
;; (defun python--add-debug-highlight ()
;;   "Adds a highlighter for use by `python--pdb-breakpoint-string'"
;;   (highlight-lines-matching-regexp "## DEBUG ##\\s-*$" 'hi-red-b))

;; (add-hook 'python-mode-hook 'python--add-debug-highlight)

;; (defvar python--pdb-breakpoint-string "import pdb; pdb.set_trace() ## DEBUG ##"
;;   "Python breakpoint string used by `python-insert-breakpoint'")

;; (defun python-insert-breakpoint ()
;;   "Inserts a python breakpoint using `pdb'"
;;   (interactive)
;;   (back-to-indentation)
;;   ;; this preserves the correct indentation in case the line above
;;   ;; point is a nested block
;;   (split-line)
;;   (insert python--pdb-breakpoint-string))
;; (define-key python-mode-map (kbd "<f5>") 'python-insert-breakpoint)

;; (defadvice compile (before ad-compile-smart activate)
;;   "Advises `compile' so it sets the argument COMINT to t
;; if breakpoints are present in `python-mode' files"
;;   (when (derived-mode-p major-mode 'python-mode)
;;     (save-excursion
;;       (save-match-data
;;         (goto-char (point-min))
;;         (if (re-search-forward (concat "^\\s-*" python--pdb-breakpoint-string "$")
;;                                (point-max) t)
;;             ;; set COMINT argument to `t'.
;;             (ad-set-arg 1 t))))))

;;; lisp mode

;; allegro cl eli
(defun load-eli ()
  (interactive)
  (load "fi-site-init")
  (setq fi:common-lisp-image-name "/usr/local/bin/alisp")
  (setq fi:common-lisp-image-file "/usr/local/lib/acl81.64/alisp.dxl")
  )

(defun run-common-lisp ()
  (interactive)
  (load-eli)
  (fi:common-lisp fi:common-lisp-buffer-name
                  fi:common-lisp-directory
                  fi:common-lisp-image-name
                  fi:common-lisp-image-arguments
                  fi:common-lisp-host
                  fi:common-lisp-image-file))

(defun run-common-lisp-with-ide ()
  (interactive)
  (load-eli)
  (fi:common-lisp "*common-lisp*"
                  "/usr/local/lib/acl81.64/"
                  "/usr/local/bin/allegro"
                  '("")
                  "localhost"
                  "/usr/local/lib/acl81.64/allegro.dxl"))


;;; slime
;;
(require 'slime)
(slime-setup '(slime-tramp slime-repl slime-scratch slime-editing-commands
                           slime-banner slime-autodoc slime-fuzzy slime-sprof
                           slime-fancy-inspector slime-references
                           slime-xref-browser slime-presentations
                           inferior-slime slime-mrepl))

;;; lisp
(define-key global-map (kbd "<f8>") 'slime-selector) 

(defun slime-eval-next-expression ()
  (interactive)
  (forward-sexp)
  (slime-eval-last-expression)) 

;;; cl specific
(defun my-slime-setup ()

(slime-setup
 '(slime-fancy slime-sprof slime-tramp
               slime-scratch slime-editing-commands slime-banner
               slime-asdf slime-indentation slime-autodoc
               slime-c-p-c slime-fuzzy slime-fancy-inspector
               slime-references slime-xref-browser slime-repl
               inferior-slime slime-mrepl
               slime-js
               )) 
(setf slime-enable-evaluate-in-emacs t)

;;; coding style
(define-common-lisp-style "mine"
    (:inherit "modern")
  (:variables
   (lisp-loop-indent-subclauses t)))

(setq common-lisp-style-default "mine")

;;; refactoring library
(add-hook 'lisp-mode-hook 'turn-on-redshank-mode)


;;; cldoc
(require 'cldoc)
(setq cldoc-argument-case 'downcase
      cldoc-idle-delay 0.2)


;;; cl-lookup for slime
(setq cl-lookup-categories
      ;; Comment out category lines you don't want (like "cl-lookup-clisp" in
      ;; this example). Add your custom category file name as a string, which
      ;; then will be automatically loaded.
      '(:hyperspec-index           ; e.g. "", "spec" "CLHS"
        :hyperspec-chapters        ; e.g. [index], [syntax]
        :format-control-characters ; e.g. "~C: Character", "~%: Newline"
        :reader-macro-characters   ; e.g. "(", "#'", "#b", "#+"
        :loop                      ; e.g. loop:with, loop:collect
        :arguments                 ; e.g. :test, :key, :eof-error-p
        :concepts           ; e.g. "lambda lists:", "character names:"
        "cl-lookup-glossary"        ; e.g. {absolute}, {binding}
        "cl-lookup-mop"             ; e.g. add-dependent, ensure-class

        ;; implementation specific categories
        ;; "cl-lookup-clisp"       ; e.g. ext:cd

        ;; library categories
        ;; "cl-lookup-ppcre"           ; e.g. cl-ppcre:parse-tree-synonym
        "cl-lookup-chunga"
        "cl-lookup-cl-fad"
        "cl-lookup-cl-ppcre"
        "cl-lookup-cl-who"
        "cl-lookup-hunchentoot"
        "cl-lookup-url-rewrite"
        ;;
        "cl-lookup-acl-excl"
        "cl-lookup-acl-socket"
        "cl-lookup-acl-system"
        "cl-lookup-acl-compiler"
        "cl-lookup-acl-dbi"
        "cl-lookup-acl-mp"
        "cl-lookup-acl-net.aserve"
        "cl-lookup-acl-net.aserve.client"
        ))
(require 'cl-lookup)


(setq auto-mode-alist
      (cons '("\\.\\(cl\\|lsp\\|asd\\)$" . lisp-mode) auto-mode-alist))

)

(defun my-slime-reload-system (system)
  (interactive (list (slime-read-system-name nil nil t)))
  (slime-save-some-lisp-buffers)
  (slime-display-output-buffer)
  (message "Performing ASDF LOAD-OP on system %S" system)
  (slime-repl-shortcut-eval-async
   `(swank:reload-system ,system)
   (slime-asdf-operation-finished-function system)))

(add-hook 'lisp-mode-hook
          ;; run (slime-connect) after initialization.
          (lambda ()
            (slime-mode t)
            (show-paren-mode t)
            ;; defclass alignment
            (require 'mwe-defclass-formatter)
            ;; eldoc is slow...
            (eldoc-mode -1)
            ;; indentation fix
            (defindent iter loop)
            )
          t)

(add-hook 'slime-mode-hook
          (lambda ()
            ;; keys
            ;; bind r for slime-repl
            (def-slime-selector-method ?r
              "move to current slime repl"
              (concat "*slime-repl "
                      (slime-connection-name (slime-current-connection)) 
                      "*"))
            ;; switch [] and ()
            (define-key slime-mode-map (kbd "C-c s") 'slime-selector)
            (define-key slime-mode-map (kbd "<M-return>") 'slime-eval-next-expression)
            ;; selector
            (define-key slime-mode-map (kbd "M-/") 'slime-fuzzy-complete-symbol)
            (define-key slime-mode-map (kbd "C-c M-i") 'slime-inspect-definition)
            (define-key slime-mode-map (kbd "C-c M-d") 'slime-disassemble-symbol)
            (define-key slime-mode-map (kbd "<tab>") 'slime-indent-and-complete-symbol)
            (define-key slime-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol)
            ;; add to mode that needs them
            (paredit-mode 1)
            (define-key lisp-mode-map (kbd "C-c s") 'slime-selector)
            ;; (define-key lisp-mode-map (kbd "C-c C-d h") 'cl-lookup)
            (define-key slime-mode-map (kbd "C-M-q") 'slime-reindent-defun)
            (define-key slime-mode-map (kbd "C-c M-l") 'slime-load-system)
            (define-key slime-mode-map (kbd "C-c C-d h") 'cl-lookup)
            (define-key slime-mode-map (kbd "C-c ;") 'slime-insert-balanced-comments)
            (define-key slime-mode-map (kbd "C-c C-;") 'slime-insert-balanced-comments)
            (define-key slime-mode-map (kbd "C-c M-;") 'slime-remove-balanced-comments)
            ;; reload system-
            (define-key slime-mode-map (kbd "<f5>") 'my-slime-reload-system)
            ;; indentation fix
            (defindent iter loop)
            ))

(add-hook 'slime-repl-mode-hook
          (lambda ()
            (paredit-mode 1)
            (slime-autodoc-mode -1)
            ;; bind r for slime-repl
            (def-slime-selector-method ?r
              "move to current slime repl"
              (concat "*slime-repl "
                      (slime-connection-name (slime-current-connection)) 
                      "*"))
            ;;
            (define-key slime-repl-mode-map (kbd "C-c s") 'slime-selector)
            (define-key slime-repl-mode-map (kbd "<M-return>") 'slime-repl-closing-return)
            (define-key slime-repl-mode-map (kbd "M-/") 'slime-fuzzy-complete-symbol)
            (define-key slime-repl-mode-map (kbd "C-c M-i") 'slime-inspect-definition)
            (define-key slime-repl-mode-map (kbd "C-c M-d") 'slime-disassemble-symbol)
            (define-key slime-repl-mode-map (kbd "<tab>") 'slime-indent-and-complete-symbol)
            (define-key slime-repl-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol) 
            (define-key slime-repl-mode-map (kbd "M-r") 'slime-repl-previous-matching-input)
            (define-key slime-repl-mode-map [(backspace)] 'paredit-backward-delete)
            (define-key slime-repl-mode-map (kbd "C-c C-d h") 'cl-lookup)
            (define-key slime-repl-mode-map (kbd "C-c M-l") 'slime-load-system)
            (define-key slime-repl-mode-map (kbd "C-c ;") 'slime-insert-balanced-comments)
            (define-key slime-repl-mode-map (kbd "C-c C-;") 'slime-insert-balanced-comments)
            (define-key slime-repl-mode-map (kbd "C-c M-;") 'slime-remove-balanced-comments)
            ;; redirects all output to REPL
            (slime-redirect-inferior-output t)
            ;; reload system
            (define-key slime-repl-mode-map (kbd "<f5>") 'my-slime-reload-system) 
            )
          t)


(add-hook 'inferior-lisp-mode-hook
          (lambda ()
            (inferior-slime-mode t)
            (paredit-mode 1)
            ;; bind r for slime-repl
            (def-slime-selector-method ?r
              "move to current slime repl"
              (concat "*slime-repl "
                      (slime-connection-name (slime-current-connection)) 
                      "*"))
            (define-key inferior-lisp-mode-map (kbd "C-c s") 'slime-selector)
            ;; (define-key inferior-lisp-mode-map (kbd "C-c C-d h") 'cl-lookup)
            ))

;; Adding keyword highlighting for Lisp and Lush
(defvar additional-lisp-font-lock-keywords
  '((("for"
      "selectq"
      "let-filter"
      "reading"
      "writing"
      "do-while"
      "iterate"
      "iter"
      "repeat"
      "idx-eloop"
      "idx-bloop"
      "idx-gloop"
      "ifdef"
      "ifcompiled"
      "flambda"
      "mlambda"
      "every"
      "some"
      "funcall"
      "apply"
      "named-lambda"
      )  (1 font-lock-keyword-face))
    (("not") . font-lock-negation-char-face) ;symbol = (1 symbol)
    (("eval") . font-lock-warning-face)
    ))

(defun make-lisp-font-lock-keywords-string (keywords-definition)
  (mapcar
   (lambda (category)
     (let ((keyword-list (car category))
           (face (cdr category)))
       (cons (concat "("
                     (regexp-opt keyword-list t)
                     "\\>")
             (if (symbolp face)
                 (list (list 1 face))
                 face))))
   keywords-definition))

(defvar additional-lisp-font-lock-keywords-string
  '(("(\\(with.*?\\|map.*?\\|def.*?\\)\\>"
     (1 font-lock-keyword-face))
    ("\\<\\(t\\)\\>" . font-lock-negation-char-face)))

(defun define-lisp-font-lock-keywords (mode keywords-definition)
  (font-lock-add-keywords
   mode
   (make-lisp-font-lock-keywords-string keywords-definition)))

(define-lisp-font-lock-keywords 'lisp-mode additional-lisp-font-lock-keywords)
(font-lock-add-keywords 'lisp-mode additional-lisp-font-lock-keywords-string)

(defun cl-indent (sym indent)
  (put sym 'common-lisp-indent-function
       (if (symbolp indent)
           (get indent 'common-lisp-indent-function)
         indent)))

(defmacro defindent (symbol indent)
  `(cl-indent ',symbol ',indent))

(defindent iterate loop)
(defindent iter loop)
(defindent collect progn)
(defindent flet-prepared flet)

(setq inferior-lisp-program "/usr/local/bin/sbcl"
      ;; lisp-indent-function 'common-lisp-indent-function
      ;; slime-complete-symbol-function 'slime-complete-symbol* ; 'slime-fuzzy-complete-symbol
      ;; slime-complete-symbol*-fancy nil
      slime-startup-animation nil
      slime-outline-mode-in-events-buffer t
      slime-net-coding-system 'utf-8-unix
      slime-multiprocessing t
      slime-autodoc-use-multiline-p t
      common-lisp-hyperspec-root "file://home/hjs/info/clhs/HyperSpec/"
      slime-compile-file-options '(:fasl-directory "/tmp/slime-fasls/")
      )

(make-directory "/tmp/slime-fasls/" t)

(setq slime-default-lisp 'sbcl
      slime-lisp-implementations
      '((sbcl ("sbcl" "--dynamic-space-size" "8gb")
         ;; ("sbcl" "--core"
         ;;       "/home/hjs/.sbcl/my-sbcl.core"
         ;;       "--no-userinit")
         ;; :init (lambda (port-file _)
         ;;         (format
         ;;          "(swank:start-server %S :coding-system \"utf-8-unix\")\n"
         ;;          port-file))
         :coding-system utf-8-unix)
        (cmucl ("lisp") :coding-system utf-8-unix)
        (allegro ("alisp") :coding-system utf-8-unix)
        (allegro32 ("alisp32") :coding-system utf-8-unix)
        (acl90 ("acl90") :coding-system utf-8-unix)
        (clisp ("clisp" "-K" "full") :coding-system utf-8-unix)
        (lispworks ("lispworks") :coding-system iso-latin-1-unix)
        (lispworks32 ("lispworks32") :coding-system iso-latin-1-unix)
        (ccl ("ccl" "-K" "utf-8") :coding-system utf-8-unix)
        (ccl32 ("ccl32" "-K" "utf-8") :coding-system utf-8-unix)
        (abcl ("java" "-jar" "/home/hjs/abcl/abcl.jar") :coding-system utf-8-unix)
        (ecl ("ecl") :coding-system utf-8-unix)))

(defun start-sbcl ()
  (interactive)
  (my-slime-setup)
  (slime 'sbcl))

(defun start-ccl ()
  (interactive)
  (my-slime-setup)
  (slime 'ccl))

(defun start-allegro ()
  (interactive)
  (my-slime-setup)
  (slime 'allegro))

(defvar slime-filename-translations nil)
(setf my-slime-filename-translations
      (list (slime-create-filename-translator
             :machine-instance "maptia1"
             :remote-host "maptia1"
             :username "hjs")))

(defun slime-hack-remotely ()
  (interactive)
  (setf slime-filename-translations
        my-slime-filename-translations))

(defun slime-hack-locally ()
  (interactive)
  (setf slime-filename-translations nil))

(defun slime-set-filename-translation (from to)
  (interactive "sFrom directory:\nsTo directory:")
  (setq slime-translate-to-lisp-filename-function
        `(lambda (file-name)
           (if (string-match ,from file-name)
               (concat ,to (subseq file-name (length ,from)))
               file-name))
        slime-translate-from-lisp-filename-function
        `(lambda (file-name)
           (if (string-match ,to file-name)
               (concat ,from (subseq file-name (length ,to)))
               file-name)))
  ;;; FIXME: this is a hack. will break remote file editing.
  (setq slime-filename-translations
        (list (list "^.*$"
                    slime-translate-to-lisp-filename-function
                    slime-translate-from-lisp-filename-function))))

(defun slime-new-repl (&optional new-port)
  "Create additional REPL for the current Lisp connection."
  (interactive)
  (if (slime-current-connection)
      (let ((port (or new-port (slime-connection-port (slime-connection)))))
        (slime-eval `(swank::create-server :port ,port))
        (slime-connect slime-lisp-host port))
      (error "Not connected")))

;;; wrap the current defun in (eval-when (:compile-toplevel :load-toplevel :execute) ...)
(defun asf-eval-whenify (&optional n)
  (interactive "*p")
  (save-excursion
    (if (and (boundp 'slime-repl-input-start-mark)
             slime-repl-input-start-mark)
        (slime-repl-beginning-of-defun)
        (beginning-of-defun))
    (paredit-wrap-sexp n)
    (insert "eval-when (:compile-toplevel :load-toplevel :execute)\n")
    (slime-reindent-defun)))
(define-key lisp-mode-map (kbd "C-c e") 'asf-eval-whenify)
;;

(defconst public-domain-string "
;;; This code is written by Huang, Jianshi and placed in the Public
;;; Domain.  All warranties are disclaimed.
")

(defconst copyright-format (cons "
;;; Copyright (C) " ", Huang, Jianshi
;;; All rights reserved.
;;; See the LICENCE file for details.
"))

(setq browse-url-generic-program "google-chrome")
(setq browse-url-browser-function '(("(h|H)yperspec" . w3m-browse-url-other-window)
                                    ("HyperSpec" . w3m-browse-url-other-window)
                                    ("weitz" . w3m-browse-url-other-window)
                                    ("mop" . w3m-browse-url-other-window)
                                    ("." . browse-url-generic)
                                    ))

(defun lispdoc ()
  "searches lispdoc.com for SYMBOL, which is by default the symbol
currently under the curser"
  (interactive)
  (let* ((word-at-point (word-at-point))
         (symbol-at-point (symbol-at-point))
         (default (symbol-name symbol-at-point))
         (inp (read-from-minibuffer
               (if (or word-at-point symbol-at-point)
                   (concat "Symbol (default " default "): ")
                   "Symbol (no default): "))))
    (if (and (string= inp "")
             (not word-at-point)
             (not symbol-at-point))
        (message "you didn't enter a symbol!")
        (let ((search-type
               (read-from-minibuffer
                "full-text (f) or basic (b) search (default b)? ")))
          (browse-url (concat "http://lispdoc.com?q="
                              (if (string= inp "")
                                  default
                                  inp)
                              "&search="
                              (if (string-equal search-type "f")
                                  "full+text+search"
                                  "basic+search")))))))

(define-key slime-mode-map (kbd "C-c C-d l") 'lispdoc)
(define-key slime-mode-map (kbd "C-c C-d C-l") 'lispdoc)
(define-key slime-repl-mode-map (kbd "C-c C-d l") 'lispdoc)
(define-key slime-repl-mode-map (kbd "C-c C-d C-l") 'lispdoc)

;; lisp unicode
(defun lisp-unicode ()
  (interactive)
  (substitute-patterns-with-unicode
   (list (cons "\\<\\(lambda\\)\\>" 'lambda)
         )))

(add-hook 'lisp-mode-hook 'lisp-unicode)
(add-hook 'slime-mode-hook 'lisp-unicode)

;; give sldb a special frame
;; (setq special-display-regexps
;;   (quote (("slime-repl" (height . 40) (width . 80)
;;              (top . 85) (left . 50))
;;        ("sldb" (height . 30) (width . 50)
;;            (left . 10) (top . 25)))))



;;; clojure mode
(require 'clojure-mode)
(add-hook 'clojure-mode-hook
          (lambda ()
            (show-paren-mode t)
            (paredit-mode 1)
            ;; (setf slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
            ;;
            ;; (define-key clojure-mode-map (kbd "<M-return>") 'slime-eval-next-expression)
            ;; (define-key clojure-mode-map (kbd "M-/") 'slime-fuzzy-complete-symbol)
            ;; (define-key clojure-mode-map (kbd "C-c M-i") 'slime-inspect-definition)
            ;; (define-key clojure-mode-map (kbd "C-c M-d") 'slime-disassemble-symbol)
            ;; (define-key clojure-mode-map (kbd "<tab>") 'slime-indent-and-complete-symbol)
            ;; (define-key clojure-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol)
            ;; (define-key clojure-mode-map (kbd "C-M-q") 'slime-reindent-defun)
            ;; (define-key clojure-mode-map (kbd "C-c M-l") 'slime-load-system)
            ;; (define-key clojure-mode-map (kbd "C-c ;") 'slime-insert-balanced-comments)
            ;; (define-key clojure-mode-map (kbd "C-c C-;") 'slime-insert-balanced-comments)
            ;; (define-key clojure-mode-map (kbd "C-c M-;") 'slime-remove-balanced-comments)
            ))

(font-lock-add-keywords 'clojure-mode additional-lisp-font-lock-keywords-string)

(setq clojure-swank-command
      (if (or (locate-file "lein" exec-path) (locate-file "lein.bat" exec-path))
          "lein ritz-in %s"
        "echo \"lein ritz-in %s\" | $SHELL -l"))

;; cleanup slime mode pollution
(setf slime-connected-hook '(slime-repl-connected-hook-function))
(setf slime-indentation-update-hooks nil)

;;; Forth
(autoload 'forth-mode "gforth")
(setq auto-mode-alist (cons '("\\.fs\\'" . forth-mode) auto-mode-alist))
(autoload 'forth-block-mode "gforth")
(setq auto-mode-alist (cons '("\\.fb\\'" . forth-block-mode) auto-mode-alist))

(add-hook 'forth-mode-hook
          (function (lambda ()
            (setq forth-indent-level 4)
            (setq forth-minor-indent-level 2)
            (setq forth-hilight-level 3))))

(defalias 'start-forth 'run-forth)



;;; Scala
(autoload 'scala-mode "scala-mode-auto" "Scala Mode" t)


;;; OCaml
;;; see http://www-rocq.inria.fr/~acohen/tuareg/mode/
(setq auto-mode-alist
      (cons '("\\.ml[iylp]?$" . caml-mode) auto-mode-alist))
(add-hook 'caml-mode-hook
          (lambda ()
            (if window-system (require 'caml-font)) ; for highlighting
            (flymake-mode 1)))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)

(defun caml-comment ()
  (interactive)
  (insert "(* " (read-string "Comment: ") " *)\n"))

(defalias 'caml-eval
    (read-kbd-macro "C-b C-b C-c C-e"))

(add-hook 'caml-mode-hook
          (lambda ()
            (define-key caml-mode-map (kbd "C-x C-e") 'my-caml-eval)
            (define-key caml-mode-map [(backspace)] 'paredit-backward-delete)
            (define-key caml-mode-map [(meta backspace)] 'paredit-backward-kill-word)
            ))

(defun ocaml-unicode ()
  (interactive)
  (substitute-patterns-with-unicode
   (list (cons "\\(<-\\)" 'left-arrow)
         (cons "\\(->\\)" 'right-arrow)
         (cons "\\[^=\\]\\(=\\)\\[^=\\]" 'equal)
         (cons "\\(==\\)" 'identical)
         (cons "\\(\\!=\\)" 'not-identical)
         (cons "\\(<>\\)" 'not-equal)
         (cons "\\(()\\)" 'nil)
         (cons "\\<\\(sqrt\\)\\>" 'square-root)
         (cons "\\(&&\\)" 'logical-and)
         (cons "\\(||\\)" 'logical-or)
         (cons "\\<\\(not\\)\\>" 'logical-neg)
         (cons "\\(>\\)\\[^=\\]" 'greater-than)
         (cons "\\(<\\)\\[^=\\]" 'less-than)
         (cons "\\(>=\\)" 'greater-than-or-equal-to)
         (cons "\\(<=\\)" 'less-than-or-equal-to)
         (cons "\\<\\(lambda\\)\\>" 'lambda)
         (cons "\\<\\(alpha\\)\\>" 'alpha)
         (cons "\\<\\(beta\\)\\>" 'beta)
         (cons "\\<\\(gamma\\)\\>" 'gamma)
         (cons "\\<\\(delta\\)\\>" 'delta)
         (cons "\\(''\\)" 'double-prime)
         (cons "\\('\\)" 'prime)
         (cons "\\<\\(List.for_all\\)\\>" 'for-all)
         (cons "\\<\\(List.exists\\)\\>" 'there-exists)
         (cons "\\<\\(List.mem\\)\\>" 'element-of)
         (cons "^ +\\(|\\)" 'double-vertical-bar))))

;; (add-hook 'caml-mode-hook 'ocaml-unicode)
;; (add-hook 'tuareg-mode-hook 'ocaml-unicode)



;;; Haskell Mode
(require 'haskell-mode)
(require 'inf-haskell)
(setq auto-mode-alist
      (cons '("\\.[l]?hs$" . haskell-mode) auto-mode-alist))
(add-to-list 'completion-ignored-extensions ".hi")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
;; (add-hook 'haskell-mode-hook 'flymake-mode)
(setq haskell-font-lock-symbols t)

(define-key haskell-mode-map (kbd "<f3>") 'rgr/hayoo)
(define-key haskell-mode-map (kbd "<f4>") 'haskell-hoogle)

(require 'thingatpt+)
(defun rgr/hayoo()
  (interactive)
  (let* ((default (region-or-word-at-point))
         (term (read-string (format "Hayoo for the following phrase (%s): " default))))
    (let ((term (if (zerop (length term)) default term)))
      (browse-url (format "http://holumbus.fh-wedel.de/hayoo/hayoo.html?query=%s" term)))))

;;; smalltalk mode
(add-hook 'smalltalk-mode-hook
          (lambda ()
            (substitute-patterns-with-unicode
             (list (cons "\\(:=\\)" 'left-arrow)
                   (cons "\\(\\^\\)" 'up-arrow)))))


;;; lush mode
(autoload 'lush "lush" "Lush interactive mode" t)
(defun run-lush ()
  (interactive)
  (load-library "lush")
  (lush))

;;; MAXIMA mode
(autoload 'imaxima "imaxima" "Image support for Maxima." t)
(autoload 'imath-mode "imath" "Interactive Math minor mode." t)

;;; ESS mode
(require 'ess)
(setq ess-use-auto-complete t)

;;; prolog mode
(setq prolog-program-name "swill")

;;; scheme mode
(require 'quack)

;; racket
(load-file "~/.emacs.d/geiser/elisp/geiser-load.el")
(setq scheme-program-name "mzscheme"
      geiser-active-implementations '(racket guile))

;; gambit
;; (autoload 'gambit-inferior-mode "gambit" "Hook Gambit mode into cmuscheme.")
;; (autoload 'gambit-mode "gambit" "Hook Gambit mode into SCHEME.")
;; (add-hook 'inferior-scheme-mode-hook (function gambit-inferior-mode))
;; (add-hook 'scheme-mode-hook (function gambit-mode))

;; Gauche
;; (setq scheme-program-name "gosh -i")
;; (require 'gauche-mode)

;; bigloo
;; (require 'bmacs nil t)

(add-hook 'scheme-mode-hook
          (lambda ()
            (paredit-mode 1)
            ))

(add-hook 'inferior-scheme-mode-hook
          (lambda ()
            (paredit-mode 1)
            ))


;;; nxhtml mode(including javascript mode)
;; (load-file "~/.emacs.d/nxhtml/autostart.el")
;; (define-key nxhtml-mode-map (kbd "M-SPC") 'nxml-complete)
(add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))

;;; javascript
(require 'js2-mode)
(require 'js2-refactor)
(require 'coffee-mode)
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; slime-js
(setq slime-js-target-url "http://localhost:3000")
(setq slime-js-connect-url "http://localhost:8009")
(setq slime-js-starting-url "/swank-js/test.html")
(setq slime-js-swank-command "/usr/bin/swank-js")
(setq slime-js-swank-args '())
(setq slime-js-browser-command "google-chrome")
(setq slime-js-browser-jacked-in-p nil)
(setq slime-protocol-version 'ignore)

(defun slime-js-run-swank ()
  "Runs the swank side of the equation."
  (interactive)
  (apply #'make-comint "swank-js"  slime-js-swank-command nil slime-js-swank-args))

(defun slime-js-jack-in-node ()
  "Start a swank-js server and connect to it, opening a repl."
  (interactive)
  (slime-js-run-swank)
  (sleep-for 2)
  (setq slime-protocol-version 'ignore)
  (slime-connect "localhost" 4005))

(defun slime-js-jack-in-browser ()
  "Start a swank-js server, connect to it, open a repl, open a browser, connect to that."
  (interactive)
  (slime-js-jack-in-node)
  ;; (sleep-for 2)
  (slime-js-set-target-url slime-js-target-url)
  (shell-command (concat slime-js-browser-command " " slime-js-connect-url slime-js-starting-url))
  (sleep-for 3)
  (setq sli1me-remote-history nil)
  (slime-js-sticky-select-remote (caadr (slime-eval '(js:list-remotes))))
  (setq slime-js-browser-jacked-in-p t)
  (global-set-key [f5] 'slime-js-reload))

(defadvice save-buffer (after save-css-buffer activate)
  (when (and slime-js-browser-jacked-in-p (eq major-mode 'css-mode))
    (slime-js-refresh-css)))

(defun js2-eval-friendly-node-p (n)
  (or (and (js2-stmt-node-p n) (not (js2-block-node-p n)))
      (and (js2-function-node-p n) (js2-function-node-name n))))

(defun slime-js--echo-result (result &rest _)
  (message result))

(defun slime-js--replace-with-result (replacement beg end)
  (save-excursion
    (goto-char beg)
    (delete-char (- end beg))
    (insert replacement)))

(defun slime-js-eval-region (beg end &optional func)
  (interactive)
  (lexical-let ((func (or func 'slime-js--echo-result))
                (beg beg)
                (end end))
    (slime-flash-region beg end)
    (slime-js-eval
     (buffer-substring-no-properties beg end)
     #'(lambda (s) (funcall func (cadr s) beg end)))))

(defun slime-js-eval-statement (&optional func)
  (interactive)
  (let ((node (js2r--closest 'js2-eval-friendly-node-p)))
    (slime-js-eval-region (js2-node-abs-pos node)
                          (js2-node-abs-end node)
                          func)))

(defun slime-js-eval-current ()
  (interactive)
  (if (use-region-p)
      (slime-js-eval-region (point) (mark))
    (slime-js-eval-statement)))

(defun slime-js-eval-and-replace-current ()
  (interactive)
  (if (use-region-p)
      (slime-js-eval-region (point) (mark) 'slime-js--replace-with-result)
    (slime-js-eval-statement 'slime-js--replace-with-result)))

(defun slime-js-eval-buffer ()
  (interactive)
  (slime-js-eval-region (point-min) (point-max)))

(defun slime-js-coffee-eval-current ()
  (interactive)
  (coffee-compile-region (point) (mark))
  (switch-to-buffer coffee-compiled-buffer-name) ;; defined in coffee-mode
  (slime-js-eval-buffer)
  (kill-buffer coffee-compiled-buffer-name))

(defun slime-js-coffee-eval-buffer ()
  (interactive)
  (coffee-compile-buffer)
  (switch-to-buffer coffee-compiled-buffer-name) ;; defined in coffee-mode
  (slime-js-eval-buffer)
  (kill-buffer coffee-compiled-buffer-name))

(define-key global-map (kbd "<f6>") 'slime-js-reload)
;; (define-key global-map (kbd "<f7>") 'slime-coffee-reload)
(add-hook 'js2-mode-hook
          (lambda ()
            (slime-js-minor-mode 1)
            (local-set-key (kbd "C-x C-e") 'slime-js-eval-current)
            (local-set-key (kbd "C-c C-e") 'slime-js-eval-and-replace-current)
            (local-set-key (kbd "C-c C-k") 'slime-js-eval-buffer))) 
(add-hook 'coffee-mode-hook
          (lambda ()
            (slime-js-minor-mode 1)
            (local-set-key (kbd "C-x C-e") 'slime-js-coffee-eval-current)
            (local-set-key (kbd "C-c C-k") 'slime-js-coffee-eval-buffer)))
(add-hook 'css-mode-hook
          (lambda ()
            (local-set-key (kbd "C-M-x") 'slime-js-refresh-css)
            (local-set-key (kbd "C-c C-r") 'slime-js-embed-css)))

;; Remove slime-minor-mode from mode line if diminish.el is installed
(when (boundp 'diminish)
  (diminish 'slime-js-minor-mode))

;;; qi-mode
(require 'qi-mode)
(add-hook 'qi-mode-hook
          (lambda ()
            (paredit-mode 1)
            ))

;;; mathematica mode
(autoload 'math "math" "mathematica mode" t)

;;; llvm mode
(require 'llvm-mode)
(require 'tablegen-mode)

;;; clean mode
(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.icl$" . clean-mode)
                ("\\.dcl$" . clean-mode))))
(autoload 'clean-mode "clean-mode"
  "Major mode for editing Clean scripts." t)


;;; go mode
(require 'go-mode-load)

;;; coffee script mode
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.iced$" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.Cakefile$" . coffee-mode))
(setf coffee-command "iced")

(defvar coffee-indent-offset 2)

(defun coffee-custom ()
  "coffee-mode hook"
  (set (make-local-variable 'tab-width) coffee-indent-offset))
(add-hook 'coffee-mode-hook 'coffee-custom)

(defun coffee-indent-shift-left (start end &optional count)
  (interactive
   (if mark-active
       (list (region-beginning) (region-end) current-prefix-arg)
     (list (line-beginning-position) (line-end-position) current-prefix-arg)))
  (if count
      (setq count (prefix-numeric-value count))
    (setq count coffee-indent-offset))
  (when (> count 0)
    (let ((deactivate-mark nil))
      (save-excursion
        (goto-char start)
        (while (< (point) end)
          (if (and (< (current-indentation) count)
                   (not (looking-at "[ \t]*$")))
              (error "Can't shift all lines enough"))
          (forward-line))
        (indent-rigidly start end (- count))))))

(defun coffee-indent-shift-right (start end &optional count) 
  (interactive
   (if mark-active
       (list (region-beginning) (region-end) current-prefix-arg)
     (list (line-beginning-position) (line-end-position) current-prefix-arg)))
  (let ((deactivate-mark nil))
    (if count
        (setq count (prefix-numeric-value count))
      (setq count coffee-indent-offset))
    (indent-rigidly start end count)))

(define-key coffee-mode-map (kbd "C->") 'coffee-indent-shift-right)
(define-key coffee-mode-map (kbd "C-<") 'coffee-indent-shift-left)

;;; latex mode
(require 'reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

;;; c mode
(require 'cc-mode)
(require 'c-eldoc)
(require 'xcscope)
(require 'c-toggle-dot-pointer)
;; (require 'zjl-hl)
;; (zjl-hl-enable-global-all-modes)

(setq c-eldoc-includes "`pkg-config gtk+-2.0 --cflags` -I./ -I../ ")
;; (setq c-eldoc-includes "-I./ -I../ ")
(define-key c-mode-map (kbd "C-M-h") 'mark-sexp) 
(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-style "gnu")
            (c-turn-on-eldoc-mode)))

;;; mythryl mode
(load "mythryl-mode")
;; for .pkg and .api files
(setq auto-mode-alist
      (append '(("\\.pkg$" . mythryl-mode)
                ("\\.api$" . mythryl-mode)
                ("\\.mythryl$" . mythryl-mode))
              auto-mode-alist))

;; for scripts starting with #!/.../mythryl
(setq interpreter-mode-alist
      (append '(("mythryl" . mythryl-mode))
              interpreter-mode-alist))

;;; opa mode
(autoload 'opa-js-mode "opa-js-mode" "OPA JS editing mode." t)
(autoload 'opa-classic-mode "opa-mode" "OPA CLASSIC editing mode." t)
(add-to-list 'auto-mode-alist '("\\.opa$" . opa-js-mode))
(add-to-list 'auto-mode-alist '("\\.js\\.opa$" . opa-js-mode))
(add-to-list 'auto-mode-alist '("\\.classic\\.opa$" . opa-classic-mode))

;;; sqlplus and plsql mode
;; (require 'sqlplus)
;; (add-to-list 'auto-mode-alist '("\\.sqp\\'" . sqlplus-mode))
;; (require 'plsql)
;; (setq auto-mode-alist
;;       (append
;;        '(("\\.\\(p\\(?:k[bg]\\|ls\\)\\|sql\\)\\'" . plsql-mode))
;;        auto-mode-alist))
;; (speedbar-add-supported-extension "pls")
;; (speedbar-add-supported-extension "pkg")
;; (speedbar-add-supported-extension "pkb")
;; (speedbar-add-supported-extension "sql")

;; sqlplus + plsql
;;  (setq auto-mode-alist
;;    (append '(("\\.pls\\'" . plsql-mode) ("\\.pkg\\'" . plsql-mode)
;; 		("\\.pks\\'" . plsql-mode) ("\\.pkb\\'" . plsql-mode)
;; 		("\\.sql\\'" . plsql-mode) ("\\.PLS\\'" . plsql-mode) 
;; 		("\\.PKG\\'" . plsql-mode) ("\\.PKS\\'" . plsql-mode)
;; 		("\\.PKB\\'" . plsql-mode) ("\\.SQL\\'" . plsql-mode)
;; 		("\\.prc\\'" . plsql-mode) ("\\.fnc\\'" . plsql-mode)
;; 		("\\.trg\\'" . plsql-mode) ("\\.vw\\'" . plsql-mode)
;; 		("\\.PRC\\'" . plsql-mode) ("\\.FNC\\'" . plsql-mode)
;; 		("\\.TRG\\'" . plsql-mode) ("\\.VW\\'" . plsql-mode))
;; 	      auto-mode-alist ))

;;; hive mode
(require 'hive)
(add-to-list 'auto-mode-alist '("\\.hql$" . sql-mode))

;;; pig mode
(require 'pig-mode)

;;; ide-skel
;; (require 'tabbar)
;; (require 'ide-skel)

;; (ide-skel-toggle-left-view-window)
;; (ide-skel-toggle-right-view-window)
;; (ide-skel-toggle-bottom-view-window)

;; icomplete + icircle
(eval-after-load "icomplete" '(progn (require 'icomplete+)))
(icomplete-mode 99)

;;;; finishing
;;; no zone
(require 'zone)
(zone-leave-me-alone)

;;; fullscreen
(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
                         (if (equal 'fullboth current-value)
                             (if (boundp 'old-fullscreen) old-fullscreen nil)
                           (progn (setq old-fullscreen current-value)
                                  'fullboth)))))

(define-key global-map (kbd "<f11>") 'toggle-fullscreen)


;;; reinitialized environments
(load-utf8)
(set-language-environment "English")
(create-fontset-from-fontset-spec
 "-*-liberation mono-normal-normal-normal-*-13-*-*-*-m-0-fontset-mymono,
chinese-gb2312:-*-wenquanyi micro hei-medium-*-normal--14-*-*-*-*-*-iso10646-1,
chinese-gbk:-*-wenquanyi micro hei-medium-*-normal--14-*-*-*-*-*-iso10646-1,
chinese-gb18030:-*-wenquanyi micro hei-medium-*-normal--14-*-*-*-*-*-iso10646-1,
")
(setq default-frame-alist (append '((font . "fontset-mymono")) default-frame-alist))
(set-default-font "fontset-mymono")
;; (set-default-font "Liberation Mono-10")
;; (set-default-font "Ubuntu Mono-10")
;; (set-default-font "DejaVu Sans Mono-10")
;; (set-default-font "WenQuanYi Zen Hei Mono-10")
;; (set-default-font "WenQuanYi Micro Hei Mono-10")
;; (set-default-font "VL Gothic-10")
;; (set-default-font "Averia-10")
;; (set-default-font "Freemono-10")
;; (set-default-font "IPAX0208Gothic-10")
;; (set-default-font "TakaoGothic-10")
;; (smex-initialize)

;; hack for emacs daemon
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(menu-bar-mode 1)

;;; edit with emacs -- chrome extension
(require 'edit-server)
(edit-server-start)

(my-color-theme)
;; (start-sbcl)

;;; numen for parenscript
;; (require 'pneumen)

;; (define-key slime-repl-mode-map (kbd "C-x C-z") 'numen-switch-to-repl)
;; (define-key numen-mode-map (kbd "C-c C-z") 'pneumen-switch-to-slime-repl)

;; (defun bind-keys-for-numen (mode-map)
;;   (define-key mode-map (kbd "<f9>") 'numen-toggle-breakpoint)
;;   (define-key mode-map (kbd "<f5>") 'numen-debugger-continue)
;;   (define-key mode-map (kbd "<f11>") 'numen-debugger-step-in)
;;   (define-key mode-map (kbd "<f10>") 'numen-debugger-step-next)
;;   (define-key mode-map (kbd "<S-f11>") 'numen-debugger-step-out)
;;   (define-key mode-map (kbd "C-.") 'numen-cycle-window))

;; (add-hook 'numen-mode-hook (lambda () (bind-keys-for-numen numen-mode-map)))
;; (add-hook 'numen-minor-mode-hook (lambda () (bind-keys-for-numen numen-minor-mode-map)))
;; (add-hook 'lisp-mode-hook 'pneumen-minor-mode)
;; (add-hook 'javascript-mode-hook 'numen-minor-mode)

;;; ede projects
;; (ede-cpp-root-project "libev"
;;                       :file "/home/hjs/workspace/others/libev/ev.c"
;;                       :include-path '("/usr/include" "/usr/include/sys")
;;                       :system-include-path '("/usr/include/c++/4.6/")
;;                       :spp-table '(("CONST" . "const")))


;;; TODO: list
;; notebook-2.0 not installed

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

