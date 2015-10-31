;;; projectile-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (projectile-mode projectile-global-mode) "projectile"
;;;;;;  "projectile.el" (20447 28853))
;;; Generated autoloads from projectile.el

(defvar projectile-global-mode nil "\
Non-nil if Projectile-Global mode is enabled.
See the command `projectile-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `projectile-global-mode'.")

(custom-autoload 'projectile-global-mode "projectile" nil)

(autoload 'projectile-global-mode "projectile" "\
Toggle Projectile mode in every possible buffer.
With prefix ARG, turn Projectile-Global mode on if and only if
ARG is positive.
Projectile mode is enabled in all buffers where
`projectile-on' would do it.
See `projectile-mode' for more information on Projectile mode.

\(fn &optional ARG)" t nil)

(autoload 'projectile-mode "projectile" "\
Minor mode to assist project management and navigation.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("projectile-pkg.el") (20447 28853 822433))

;;;***

(provide 'projectile-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; projectile-autoloads.el ends here
