;; custom file


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq custom-file "~/.emacs-custom.el")
(load custom-file)

;; sandboxes

(load-file "//mathworks/hub/share/sbtools/emacs_setup.el")

;; package initialisation file

(add-hook
 'after-init-hook
 (lambda () (load "~/.emacs-packages-init.el")))

;; Company-mode

(add-hook
 'after-init-hook
 'global-company-mode
 )

;; org-mode special file

(add-hook
 'after-init-hook
 (lambda () (load "~/.emacs-org-init.el")))

;; packages

(require 'package)

(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/")
 t)

(add-to-list
 'package-archives
 '("org" . "http://orgmode.org/elpa/")
 t)

;; For term-keys
(add-to-list
 'package-archives
 '("cselpa" . "https://elpa.thecybershadow.net/packages/")
 t)

;; global key bindings

(global-set-key (kbd "C-v") 'scroll-up-line)
(global-set-key (kbd "M-v") 'scroll-down-line)
(global-set-key (kbd "C-c ;") 'comment-region)
(global-set-key (kbd "C-c ,") 'uncomment-region)
(global-set-key (kbd "M-o") 'next-multiframe-window)
(global-set-key (kbd "M-i") 'previous-multiframe-window)
(global-set-key (kbd "C-c g") 'magit-status)

;; window look

(menu-bar-mode -1)

;; line and column

(column-number-mode 1)
(global-nlinum-mode 1)

(setq nlinum-format "%d ")

;; Use UTF-8

(set-language-environment "UTF-8")
(setq locale-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; various global configuration

(setq font-lock-maximum-decoration t)
(setq require-final-newline t)
(setq standard-indent 4)
(setq set-mark-command-repeat-pop t)
(setq vc-follow-symlinks t)
(setq fill-column 85) ;; Makes lines < 90 chars even with fill prefix

(fset 'yes-or-no-p 'y-or-n-p)

;; whitespace

(add-hook 'before-save-hook 'whitespace-cleanup)

;; tabs are evil

(setq-default indent-tabs-mode nil)

(defun my-tabs-makefile-hook ()
  (setq indent-tabs-mode t))
(add-hook 'makefile-mode-hook 'my-tabs-makefile-hook)

;; auto fill

(setq-default fill-column 80)
(setq fill-nobreak-predicate '(fill-french-nobreak-p))
(put 'downcase-region 'disabled nil)
