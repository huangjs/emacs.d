;;; prelude-latex-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "prelude-latex" "prelude-latex.el" (20378 2967))
;;; Generated autoloads from prelude-latex.el

(setq TeX-auto-save t)

(setq TeX-parse-self t)

(setq-default TeX-master nil)

(setq TeX-PDF-mode t)

(setq TeX-view-program-selection '((output-dvi "DVI Viewer") (output-pdf "PDF Viewer") (output-html "HTML Viewer")))

(setq TeX-view-program-list '(("DVI Viewer" "open %o") ("PDF Viewer" "open %o") ("HTML Viewer" "open %o")))

(defun prelude-latex-mode-defaults nil (turn-on-auto-fill) (abbrev-mode 1))

(setq prelude-latex-mode-hook 'prelude-latex-mode-defaults)

(add-hook 'LaTeX-mode-hook (lambda nil (run-hooks 'prelude-latex-mode-hook)))

;;;***

;;;### (autoloads nil nil ("prelude-latex-pkg.el") (20378 2968 111090))

;;;***

(provide 'prelude-latex-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; prelude-latex-autoloads.el ends here
