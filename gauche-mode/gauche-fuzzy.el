;;;
;;; Copyright (c) 2009 OOHASHI Daichi <leque@katch.ne.jp>,
;;; All rights reserved.
;;;
;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions
;;; are met:
;;;
;;; 1. Redistributions of source code must retain the above copyright
;;;    notice, this list of conditions and the following disclaimer.
;;;
;;; 2. Redistributions in binary form must reproduce the above copyright
;;;    notice, this list of conditions and the following disclaimer in the
;;;    documentation and/or other materials provided with the distribution.
;;;
;;; 3. Neither the name of the authors nor the names of its contributors
;;;    may be used to endorse or promote products derived from this
;;;    software without specific prior written permission.
;;;
;;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
;;; "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
;;; LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
;;; A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
;;; OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
;;; SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
;;; TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
;;; PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
;;; LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
;;; NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
;;; SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
;;;

;;; * Requirement
;;; - completion-ui: http://www.emacswiki.org/emacs/CompletionUI
;;;
;;; * How to Use
;;; Call interactively `complete-gauche-fuzzy',
;;; or bind it to keys, such as:
;;; (define-key gauche-mode-map "\M-\C-i" #'complete-gauche-fuzzy)

(require 'cl)
(require 'info-look)
(require 'qs)
(require 'completion-ui)

(defvar gauche-mode-separator-chars "-+/>&:")

(defun gauche-mode-penalty-function (str n)
  (and (> n 0)
       (find (aref str (- n 1)) gauche-mode-separator-chars)
       (let ((nwords (count-if
                      #'(lambda (ch)
                          (find ch gauche-mode-separator-chars))
                      (substring str 0 n))))
         (+ nwords (* (- n nwords) 0.15)))))
  
(defun gauche-list-completion (pat &optional maxnum)
  (funcall #'qs-filter-candidates
           pat (info-lookup->completions 'symbol 'gauche-mode)
           #'gauche-mode-penalty-function
           maxnum))

(completion-ui-register-source
 'gauche-list-completion
 :name 'gauche-fuzzy
 :word-thing 'symbol
 :completion-args 2)

(provide 'gauche-fuzzy)
