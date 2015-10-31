;;; mwe-defclass-formatter.el --- formats defclass forms

;; Copyright (C) 2006  Michael Weber

;; Author: Michael Weber <michaelw@foldr.org>
;; Keywords: lisp
;; $Id: mwe-defclass-formatter.el,v 1.3 2006/06/26 13:13:12 michaelw Exp $

;;; Commentary:

;; Test:
;;   Move cursor to beginning of a Common Lisp DEFCLASS form
;;   and type M-x mwe:align-defclass-slots

;; Issues:
;;   * Does not work if slots sexps contain newlines
;;   * Does not work well with #+ and #- reader conditionals
;;   * Long slot options cause large columns (:documentation ...)

;;; Code:

(provide 'mwe-defclass-formatter)

(require 'cl)

(defun ensure-spaces (num)
  "Helper function when you don't have a recent `just-one-space'."
  (just-one-space)
  (if (= num 0)
    (backward-delete-char)
    (loop repeat num
          do
          (insert " "))))

(defun mwe:end-of-sexp-column ()
  "Move point to end of current form, neglecting trailing whitespace."
  (forward-sexp)
  (while (forward-comment +1))
  (skip-chars-backward "[:space:]"))

(defun mwe:sexp-column-widths ()
  "Return list of column widths for s-expression at point."
  (down-list)
  (loop do (while (forward-comment 1))
        until (or (looking-at ")") (eobp))
        collect (- (- (point)
                      (progn
                        (mwe:end-of-sexp-column)
                        (point))))
        finally (up-list)))

(defun mwe:align-sexp-columns (column-widths)
  "Align forms in s-expression according to COLUMN-WIDTH."
  (down-list)
  (loop initially (while (forward-comment +1))
        for width in column-widths
        until (looking-at ")")
        do (let ((beg (point)))
             (mwe:end-of-sexp-column)
             (let ((used (- (point) beg)))
               (ensure-spaces (if (looking-at "[[:space:]]*)") 0
                                 (1+ (- width used))))))
        finally (up-list)))

(defun mwe:max* (&rest args)
  (reduce #'max args :key (lambda (arg) (or arg 0))))

(defun mwe:align-forms-as-columns (beg end)
  "Align s-expressions in region in columns.
Example:
  (define-symbol-macro MEM (mem-of *cpu*))
  (define-symbol-macro IP (ip-of *cpu*))
  (define-symbol-macro STACK (stack-of *cpu*))

is formatted to:

  (define-symbol-macro MEM   (mem-of *cpu*))
  (define-symbol-macro IP    (ip-of *cpu*))
  (define-symbol-macro STACK (stack-of *cpu*))" 
 (interactive "*r")
  (save-restriction
    (narrow-to-region beg end)
    (goto-char beg)
    (let* ((columns (loop do (while (forward-comment +1))
                          until (or (looking-at ")") (eobp))
                          collect (mwe:sexp-column-widths)))
           (max-column-widths (loop for cols = columns then (mapcar #'cdr cols)
                                    while (some #'consp cols)
                                    collect (apply #'mwe:max* (mapcar #'car cols)))))
      (goto-char beg)
      (loop do (while (forward-comment +1))
            until (or (looking-at ")") (eobp))
            do (mwe:align-sexp-columns max-column-widths)))))

(defun mwe:align-defclass-slots ()
  "Aligns slots of the Common Lisp DEFCLASS form after point.
Example (| denotes cursor position):
|(defclass identifier ()
   ((name :reader name-of :initarg :name)
    (location :reader location-of :initarg :location)
    (scope :accessor scope-of :initarg :scope)
    (definition :accessor definition-of :initform nil))
   (:default-initargs :scope *current-scope*))

is formatted to:

|(defclass identifier ()
   ((name       :reader   name-of       :initarg  :name)
    (location   :reader   location-of   :initarg  :location)
    (scope      :accessor scope-of      :initarg  :scope)
    (definition :accessor definition-of :initform nil))
   (:default-initargs :scope *current-scope*))"
  (interactive "*")
  (save-excursion
    (down-list)
    (cond ((looking-at "defclass")
           (forward-sexp +3)
           (let ((end (save-excursion (forward-sexp) (point))))
             (mwe:align-forms-as-columns (progn (down-list) (point)) end))))))

(provide 'mwe:defclass-formatter)
;;; mwe:defclass-formatter.el ends here

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public Licens e as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.
