;;; prelude-ruby.el --- Emacs Prelude: A nice setup for Ruby (and Rails) devs.
;;
;; Copyright (c) 2011-2012 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: http://batsov.com/emacs-prelude
;; Version: 1.0.0
;; Keywords: convenience
;; Package-Requires: ((prelude-programming "1.0.0") (inf-ruby "2.2.3") (yari "0.5") (ruby-end "0.0.1") (ruby-block "0.0.11"))

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Some basic configuration for Ruby and Rails development.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

;;;###autoload
(progn
  ;; Rake files are ruby, too, as are gemspecs, rackup files, and gemfiles.
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Guardfile\\'" . ruby-mode))

  ;; We never want to edit Rubinius bytecode
  (add-to-list 'completion-ignored-extensions ".rbc")

  (eval-after-load 'ruby-mode
    '(progn
       (require 'ruby-end)
       
       (defun prelude-ruby-mode-defaults ()
         (inf-ruby-setup-keybindings)
         ;; turn off the annoying input echo in irb
         (setq comint-process-echoes t)
         (ruby-block-mode t)
         ;; bind yari in the local keymap
         (local-set-key (kbd "C-h r") 'yari))

       (setq prelude-ruby-mode-hook 'prelude-ruby-mode-defaults)

       (add-hook 'ruby-mode-hook (lambda ()
                                   (run-hooks 'prelude-ruby-mode-hook))))))

(provide 'prelude-ruby)
;;; prelude-ruby.el ends here
