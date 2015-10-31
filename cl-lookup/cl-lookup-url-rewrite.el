(require 'cl-lookup)
(defvar cl-lookup-url-rewrite-root "http://weitz.de/url-rewrite/")

(mapc #'(lambda (entry)
	  (destructuring-bind (name path) entry
	    (let ((symbol (intern (downcase name) cl-lookup-obarray)))
	      (if (boundp symbol)
		  (pushnew path (symbol-value symbol) :test #'equal)
		  (set symbol `(,path))))))
      '(("url-rewrite" (cl-lookup-url-rewrite-root ""))
        ("url-rewrite:*url-rewrite-fill-tags*" (cl-lookup-url-rewrite-root "#*url-rewrite-fill-tags*"))
        ("url-rewrite:*url-rewrite-tags*" (cl-lookup-url-rewrite-root "#*url-rewrite-tags*"))
        ("url-rewrite:add-get-param-to-url" (cl-lookup-url-rewrite-root "#add-get-param-to-url"))
        ("url-rewrite:rewrite-urls" (cl-lookup-url-rewrite-root "#rewrite-urls"))
        ("url-rewrite:starts-with-scheme-p" (cl-lookup-url-rewrite-root "#starts-with-scheme-p"))
        ("url-rewrite:url-encode" (cl-lookup-url-rewrite-root "#url-encode"))
        ))

(provide 'cl-lookup-url-rewrite)