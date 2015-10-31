;;; prelude-perl-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "prelude-perl" "prelude-perl.el" (20378 2964))
;;; Generated autoloads from prelude-perl.el

(defalias 'perl-mode 'cperl-mode)

(defun prelude-cperl-mode-defaults nil (setq cperl-indent-level 4) (setq cperl-continued-statement-offset 8) (setq cperl-font-lock t) (setq cperl-electric-lbrace-space t) (setq cperl-electric-parens nil) (setq cperl-electric-linefeed nil) (setq cperl-electric-keywords nil) (setq cperl-info-on-command-no-prompt t) (setq cperl-clobber-lisp-bindings t) (setq cperl-lazy-help-time 3) (set-face-background 'cperl-array-face nil) (set-face-background 'cperl-hash-face nil) (setq cperl-invalid-face nil))

(setq prelude-cperl-mode-hook 'prelude-cperl-mode-defaults)

(add-hook 'cperl-mode-hook (lambda nil (run-hooks 'prelude-cperl-mode-hook)) t)

;;;***

;;;### (autoloads nil nil ("prelude-perl-pkg.el") (20378 2964 982740))

;;;***

(provide 'prelude-perl-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; prelude-perl-autoloads.el ends here
