;;; oauth2-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (oauth2-url-retrieve-synchronously oauth2-auth-and-store
;;;;;;  oauth2-auth oauth2-refresh-access) "oauth2" "oauth2.el" (20378
;;;;;;  2730))
;;; Generated autoloads from oauth2.el

(autoload 'oauth2-refresh-access "oauth2" "\
Refresh OAuth access TOKEN.
TOKEN should be obtained with `oauth2-request-access'.

\(fn TOKEN)" nil nil)

(autoload 'oauth2-auth "oauth2" "\
Authenticate application via OAuth2.

\(fn AUTH-URL TOKEN-URL CLIENT-ID CLIENT-SECRET &optional SCOPE STATE)" nil nil)

(autoload 'oauth2-auth-and-store "oauth2" "\
Request access to a resource and store it using `plstore'.

\(fn AUTH-URL TOKEN-URL RESOURCE-URL CLIENT-ID CLIENT-SECRET)" nil nil)

(autoload 'oauth2-url-retrieve-synchronously "oauth2" "\
Retrieve an URL synchronously using TOKENS to access it.
TOKENS can be obtained with `oauth2-auth'.

\(fn TOKEN URL &optional REQUEST-METHOD REQUEST-DATA REQUEST-EXTRA-HEADERS)" nil nil)

;;;***

;;;### (autoloads nil nil ("oauth2-pkg.el") (20378 2730 605254))

;;;***

(provide 'oauth2-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; oauth2-autoloads.el ends here
