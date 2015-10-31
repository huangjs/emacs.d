(require 'cl-lookup)
(defvar cl-lookup-cl-fad-root "http://weitz.de/cl-fad/")

(mapc #'(lambda (entry)
	  (destructuring-bind (name path) entry
	    (let ((symbol (intern (downcase name) cl-lookup-obarray)))
	      (if (boundp symbol)
		  (pushnew path (symbol-value symbol) :test #'equal)
		  (set symbol `(,path))))))
      '(("cl-fad" (cl-lookup-cl-fad-root ""))
        ("cl-fad:copy-file" (cl-lookup-cl-fad-root "#copy-file"))
        ("cl-fad:copy-stream" (cl-lookup-cl-fad-root "#copy-stream"))
        ("cl-fad:delete-directory-and-files" (cl-lookup-cl-fad-root "#delete-directory-and-files"))
        ("cl-fad:directory-exists-p" (cl-lookup-cl-fad-root "#directory-exists-p"))
        ("cl-fad:directory-pathname-p" (cl-lookup-cl-fad-root "#directory-pathname-p"))
        ("cl-fad:file-exists-p" (cl-lookup-cl-fad-root "#file-exists-p"))
        ("cl-fad:list-directory" (cl-lookup-cl-fad-root "#list-directory"))
        ("cl-fad:pathname-as-directory" (cl-lookup-cl-fad-root "#pathname-as-directory"))
        ("cl-fad:pathname-as-file" (cl-lookup-cl-fad-root "#pathname-as-file"))
        ("cl-fad:walk-directory" (cl-lookup-cl-fad-root "#walk-directory"))
        ))

(provide 'cl-lookup-cl-fad)