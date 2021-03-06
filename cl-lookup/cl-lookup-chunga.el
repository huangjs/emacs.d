(require 'cl-lookup)
(defvar cl-lookup-chunga-root "http://weitz.de/chunga/")

(mapc #'(lambda (entry)
	  (destructuring-bind (name path) entry
	    (let ((symbol (intern (downcase name) cl-lookup-obarray)))
	      (if (boundp symbol)
		  (pushnew path (symbol-value symbol) :test #'equal)
		  (set symbol `(,path))))))
      '(("chunga" (cl-lookup-chunga-root ""))
        ("chunga:*accept-bogus-eols*" (cl-lookup-chunga-root "#*accept-bogus-eols*"))
        ("chunga:*current-error-message*" (cl-lookup-chunga-root "#*current-error-message*"))
        ("chunga:*treat-semicolon-as-continuation*" (cl-lookup-chunga-root "#*treat-semicolon-as-continuation*"))
        ("chunga:as-capitalized-string" (cl-lookup-chunga-root "#as-capitalized-string"))
        ("chunga:as-keyword" (cl-lookup-chunga-root "#as-keyword"))
        ("chunga:assert-char" (cl-lookup-chunga-root "#assert-char"))
        ("chunga:chunga-error" (cl-lookup-chunga-root "#chunga-error"))
        ("chunga:chunga-warning" (cl-lookup-chunga-root "#chunga-warning"))
        ("chunga:chunked-input-stream" (cl-lookup-chunga-root "#chunked-input-stream"))
        ("chunga:chunked-input-stream-extensions" (cl-lookup-chunga-root "#chunked-input-stream-extensions"))
        ("chunga:chunked-input-stream-trailers" (cl-lookup-chunga-root "#chunked-input-stream-trailers"))
        ("chunga:chunked-io-stream" (cl-lookup-chunga-root "#chunked-io-stream"))
        ("chunga:chunked-output-stream" (cl-lookup-chunga-root "#chunked-output-stream"))
        ("chunga:chunked-stream" (cl-lookup-chunga-root "#chunked-stream"))
        ("chunga:chunked-stream-input-chunking-p" (cl-lookup-chunga-root "#chunked-stream-input-chunking-p"))
        ("chunga:chunked-stream-output-chunking-p" (cl-lookup-chunga-root "#chunked-stream-output-chunking-p"))
        ("chunga:chunked-stream-stream" (cl-lookup-chunga-root "#chunked-stream-stream"))
        ("chunga:input-chunking-body-corrupted" (cl-lookup-chunga-root "#input-chunking-body-corrupted"))
        ("chunga:input-chunking-unexpected-end-of-file" (cl-lookup-chunga-root "#input-chunking-unexpected-end-of-file"))
        ("chunga:make-chunked-stream" (cl-lookup-chunga-root "#make-chunked-stream"))
        ("chunga:peek-char*" (cl-lookup-chunga-root "#peek-char*"))
        ("chunga:read-char*" (cl-lookup-chunga-root "#read-char*"))
        ("chunga:read-http-headers" (cl-lookup-chunga-root "#read-http-headers"))
        ("chunga:read-line*" (cl-lookup-chunga-root "#read-line*"))
        ("chunga:read-name-value-pair" (cl-lookup-chunga-root "#read-name-value-pair"))
        ("chunga:read-name-value-pairs" (cl-lookup-chunga-root "#read-name-value-pairs"))
        ("chunga:read-token" (cl-lookup-chunga-root "#read-token"))
        ("chunga:skip-whitespace" (cl-lookup-chunga-root "#skip-whitespace"))
        ("chunga:syntax-error" (cl-lookup-chunga-root "#syntax-error"))
        ("chunga:token-char-p" (cl-lookup-chunga-root "#token-char-p"))
        ("chunga:trim-whitespace" (cl-lookup-chunga-root "#trim-whitespace"))
        ("chunga:with-character-stream-semantics" (cl-lookup-chunga-root "#with-character-stream-semantics"))
        ))

(provide 'cl-lookup-chunga)