;;; prelude-ruby-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "prelude-ruby" "prelude-ruby.el" (20378 2933))
;;; Generated autoloads from prelude-ruby.el

(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))

(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))

(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))

(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))

(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))

(add-to-list 'auto-mode-alist '("Guardfile\\'" . ruby-mode))

(add-to-list 'completion-ignored-extensions ".rbc")

(eval-after-load 'ruby-mode '(progn (require 'ruby-end) (defun prelude-ruby-mode-defaults nil (inf-ruby-setup-keybindings) (setq comint-process-echoes t) (ruby-block-mode t) (local-set-key (kbd "C-h r") 'yari)) (setq prelude-ruby-mode-hook 'prelude-ruby-mode-defaults) (add-hook 'ruby-mode-hook (lambda nil (run-hooks 'prelude-ruby-mode-hook)))))

;;;***

;;;### (autoloads nil nil ("prelude-ruby-pkg.el") (20378 2933 807534))

;;;***

(provide 'prelude-ruby-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; prelude-ruby-autoloads.el ends here
