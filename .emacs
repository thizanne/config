;; custom file

(setq custom-file "~/.emacs-custom.el")
(load custom-file)

;; package initialisation file

(add-hook
 'after-init-hook
 (lambda () (load "~/.emacs-packages-init.el")))

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

;; global key bindings

(global-set-key (kbd "C-v") 'scroll-up-line)
(global-set-key (kbd "M-v") 'scroll-down-line)
(global-set-key (kbd "C-c ;") 'comment-region)
(global-set-key (kbd "C-c ,") 'uncomment-region)
(global-set-key (kbd "M-o") 'next-multiframe-window)
(global-set-key (kbd "M-i") 'previous-multiframe-window)

;; window look

(menu-bar-mode -1)

;; line and column

(column-number-mode 1)
(global-linum-mode 1)

;; Don't display line numbers on a few major modes
(setq
 linum-disabled-modes-list
 '(
   eshell-mode
   wl-summary-mode
   compilation-mode
   org-mode
   ))

(defun linum-on ()
  (unless
      (or
       (minibufferp)
       (member major-mode linum-disabled-modes-list)) (linum-mode 1)))

;; Numéros de lignes alignés à droite, avec un espace entre le numéro
;; et le texte
(setq linum-format
      (lambda (line)
        (propertize
         (format
          (let ((w (length
                    (number-to-string
                     (count-lines (point-min) (point-max))))))
            (concat "%" (number-to-string w) "d "))
          line)
         'face 'linum)))

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

;; whitespace

(add-hook 'before-save-hook 'whitespace-cleanup)

;; tabs are evil

(setq-default indent-tabs-mode nil)

(defun my-tabs-makefile-hook ()
  (setq indent-tabs-mode t))
(add-hook 'makefile-mode-hook 'my-tabs-makefile-hook)

;; auto fill

(setq fill-nobreak-predicate '(fill-french-nobreak-p))
