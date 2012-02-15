(setq custom-file "~/.emacs-custom.el")
(load custom-file)

(setq font-lock-maximum-decoration t)
(setq whitespace-line-column 79)
(setq require-final-newline 'query)
(setq standard-indent 4)
(setq set-mark-command-repeat-pop t)

(set-language-environment "UTF-8")
(setq locale-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(global-set-key (kbd "C-c C-c RET") (kbd "C-RET"))
;; Numéros de lignes alignés à droite, avec un espace entre le numéro et le texte
(add-hook 'find-file-hook (lambda () (linum-mode 1)))
(setq linum-format
      (lambda (line)
	(propertize (format
		     (let ((w (length (number-to-string
				       (count-lines (point-min) (point-max))))))
		       (concat "%" (number-to-string w) "d "))
		     line)
		    'face 'linum)))


(menu-bar-mode -1)
(column-number-mode 1)
(global-set-key (kbd "M-o") 'next-multiframe-window)
(global-set-key (kbd "M-i") 'previous-multiframe-window)

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/org/divers.org"
			     "~/org/scouts.org"
			     ))

(require 'pkgbuild-mode)
(setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode)) auto-mode-alist))

(load "/usr/share/emacs/site-lisp/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'font-lock-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)

(require 'mediawiki)
(add-hook 'mediawiki-mode-hook
	  '(lambda ()
	     (global-set-key (kbd "M-RET") 'mediawiki-open-page-at-point)
	     ))

(setq mediawiki-site-alist 
      (quote 
       (
	("wiki.rez" "http://wiki.rez/" "Suze" "" "Accueil") 
	("wpfr" "http://fr.wikipedia.org/w/" "thizanne" "" "Main Page")
	)))


(add-to-list 'auto-mode-alist '("\\.ml[iylp]?$" . tuareg-mode))
(add-to-list 'auto-mode-alist '("\\.ocamlinit$" . tuareg-mode))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(add-hook 'tuareg-mode-hook 
	  '(lambda ()
	     (setq tuareg-sym-lock-keywords nil)
	     (setq standard-indent 2)
	     )
	  )

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-PDF-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
;;Finally, if you often use \include or \input, you should make AUCTeX aware of the multi-file document structure. You can do this by inserting :
;;(setq-default TeX-master nil)

(add-to-list 'auto-mode-alist '("\\.erl" . erlang-mode))
(setq erlang-root-dir "/usr/lib/erlang")
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
(require 'erlang-start)
(require 'erlang-flymake)


(defun color-theme-thizanne ()
  (interactive)
  (color-theme-install
   '(color-theme-thizanne
     ((background-mode . light)
      (border-color . "#000000")
      (cursor-color . "#5cf4ff")
      (foreground-color . "#ffffff")
      (mouse-color . "black"))
     (fringe ((t (:background "#000000"))))
     (mode-line ((t (:foreground "#f50000" :background "#ffea0a"))))
     (region ((t (:background "#091158"))))
     (font-lock-builtin-face ((t (:foreground "#9F009F"))))
     (font-lock-comment-face ((t (:foreground "#fade00"))))
     (font-lock-function-name-face ((t (:foreground "#2f85f5"))))
     (font-lock-keyword-face ((t (:foreground "#0066eb"))))
     (font-lock-string-face ((t (:foreground "#006400"))))
     (font-lock-type-face ((t (:foreground"#00ffac"))))
     (font-lock-variable-name-face ((t (:foreground "#00d4eb"))))
     (minibuffer-prompt ((t (:foreground "#ffbd05" :bold t))))
     (font-lock-warning-face ((t (:foreground "Red" :bold t))))
     )))

(defface tuareg-font-lock-governing-face
  '((((background light)) 
     (:foreground "#0066eb" :bold nil))
    (t (:foreground "#0066eb" :bold nil)))
  "Face description for governing/leading keywords."
  :group 'tuareg-faces)

(defvar tuareg-font-lock-governing-face
  'tuareg-font-lock-governing-face)

(defface tuareg-font-lock-operator-face
  '((((background light)) (:foreground "brown"))
    (t (:foreground "#2f85f5")))
  "Face description for all operators."
  :group 'tuareg-faces)

(defvar tuareg-font-lock-operator-face
  'tuareg-font-lock-operator-face)

(provide 'color-theme-thizanne)
(require 'color-theme)
(color-theme-initialize)
(color-theme-thizanne)

;;(add-to-list 'auto-mode-alist '("\\.lua" . lua-mode))
;;(autoload 'lua-mode "lua-mode" "Lua editing mode" t)

;;(load "/usr/share/emacs/site-lisp/nxhtml/autostart.el")
;;(add-to-list 'auto-mode-alist '("\\.html$" nxhtml-mode))
;;(add-to-list 'auto-mode-alist '("\\.x(ht)?ml$" nxhtml-mode))

;;(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
;;(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

;;(autoload 'pov-mode "pov-mode" "POV-Ray mode." t)
;;(add-to-list 'auto-mode-alist '("\\.pov\\'" . pov-mode))
;;(add-to-list 'auto-mode-alist '("\\.inc\\'" . pov-mode))

