;;; prelude-c-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "prelude-c" "prelude-c.el" (20378 2981))
;;; Generated autoloads from prelude-c.el

(defun prelude-c-mode-common-defaults nil (setq indent-tabs-mode t) (setq c-basic-offset 4))

(setq prelude-c-mode-common-hook 'prelude-c-mode-common-defaults)

(add-hook 'c-mode-common-hook (lambda nil (run-hooks 'prelude-c-mode-common-hook)))

(defun prelude-makefile-mode-defaults nil (setq indent-tabs-mode t))

(setq prelude-makefile-mode-hook 'prelude-makefile-mode-defaults)

(add-hook 'makefile-mode-hook (lambda nil (run-hooks 'prelude-makefile-mode-hook)))

;;;***

;;;### (autoloads nil nil ("prelude-c-pkg.el") (20378 2981 911288))

;;;***

(provide 'prelude-c-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; prelude-c-autoloads.el ends here
