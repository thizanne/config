;; term-keys
(require 'term-keys)
(term-keys-mode t)

;; anzu

(require 'anzu)
(global-anzu-mode t)

(set-face-attribute
 'anzu-mode-line nil
 :foreground "yellow"
 :weight 'bold
 )

;; magit

(global-set-key (kbd "C-x g") 'magit-status)

;; opam

;; ;; To automatically add opam emacs directory to the load-path
(setq opam-share
      (substring
       (shell-command-to-string "opam config var share 2> /dev/null")
       0 -1))
;; (setq opam-share "~/.opam/4.04.2/share")
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))

;; ocp-indent

(require 'ocp-indent)
(add-hook 'typerex-mode-hook 'ocp-setup-indent t)

;; merlin

(require 'merlin)

(add-hook 'tuareg-mode-hook 'merlin-mode t)
(add-hook 'caml-mode-hook 'merlin-mode t)
(add-hook 'typerex-mode-hook 'merlin-mode t)

;;; Auto-completion
(add-to-list 'company-backends 'merlin-company-backend)
(setq merlin-completion-with-doc t)

(setq merlin-command 'opam)

;; tuareg/typerex

(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)

(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
(add-to-list 'auto-mode-alist '("\\.eliom[iylp]?" . tuareg-mode))
(add-to-list 'interpreter-mode-alist '("ocamlrun" . tuareg-mode))
(add-to-list 'interpreter-mode-alist '("ocaml" . tuareg-mode))

(setq ocp-server-command "/usr/bin/ocp-wizard")
(setq ocp-theme "tuareg-like")

;; utop

(autoload 'utop "utop" "Toplevel for OCaml" t)
(autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
(add-hook 'tuareg-mode-hook 'utop-minor-mode)

(setq utop-command "utop -emacs -I _build")

(add-hook
 'tuareg-mode-hook
 (lambda ()
   (local-set-key (kbd "C-c C-e") 'utop-eval-phrase))
 )

;; auctex

(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)

(add-to-list 'auto-mode-alist '("\\.hva" . tex-mode))

(setq TeX-engine 'xetex)
(setq TeX-PDF-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
;; If you often use \include or \input, you should make AUCTeX aware
;; of the multi-file document structure. You can do this with :
(setq-default TeX-master nil)

;; erlang

;; (require 'erlang-start)
;; (require 'erlang-flymake)

(add-to-list 'auto-mode-alist '("\\.erl" . erlang-mode))

(setq erlang-root-dir "/usr/lib/erlang")
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))

;; graphviz

(autoload 'graphviz-dot-mode "graphviz-dot-mode.el" "graphviz dot mode." t)
(add-to-list 'auto-mode-alist '("\\.dot" . graphviz-dot-mode))

;; haskell

(add-to-list 'auto-mode-alist '("\\.xmobarrc" . haskell-mode))
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)

;; python

(autoload 'python-mode "python-mode.el" "Python mode." t)
(add-to-list 'auto-mode-alist '("\\.py" . python-mode))
(setq py-shell-name "python3")

;; ProofGeneral

(load-file "/usr/share/emacs/site-lisp/ProofGeneral/generic/proof-site.el")

;; cc-mode

(setq c-default-style "k&r" c-basic-offset 4)

;; markdown

(autoload
  'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

;; zlc

;; (require 'zlc)
;; (zlc-mode t)
;; (let ((map minibuffer-local-map))
;;   ;;; like menu select
;;   (define-key map (kbd "<down>")  'zlc-select-next-vertical)
;;   (define-key map (kbd "<up>")    'zlc-select-previous-vertical)
;;   (define-key map (kbd "<right>") 'zlc-select-next)
;;   (define-key map (kbd "<left>")  'zlc-select-previous)

;;   ;;; reset selection
;;   (define-key map (kbd "C-c") 'zlc-reset)
;;   )

;; pkgbuild

(require 'pkgbuild-mode)
(add-to-list 'auto-mode-alist '("PKGBUILD$" . pkgbuild-mode))

;; lua

;; (add-to-list 'auto-mode-alist '("\\.lua" . lua-mode))
;; (autoload 'lua-mode "lua-mode" "Lua editing mode" t)

;; nxhtml

;;(load "/usr/share/emacs/site-lisp/nxhtml/autostart.el")
;;(add-to-list 'auto-mode-alist '("\\.html$" nxhtml-mode))
;;(add-to-list 'auto-mode-alist '("\\.x(ht)?ml$" nxhtml-mode))

;; php

;;(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
;;(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

;; POV-ray

;;(autoload 'pov-mode "pov-mode" "POV-Ray mode." t)
;;(add-to-list 'auto-mode-alist '("\\.pov\\'" . pov-mode))
;;(add-to-list 'auto-mode-alist '("\\.inc\\'" . pov-mode))

;; mediawiki

(require 'mediawiki)

(add-hook
 'mediawiki-mode-hook
 '(lambda ()
    (global-set-key (kbd "M-RET") 'mediawiki-open-page-at-point)
    ))

(setq
 mediawiki-site-alist
 (quote
  (
   ("wiki.rez" "http://wiki.rezometz.org/" "Suze" "" "Accueil")
   ("wpfr" "http://fr.wikipedia.org/w/" "thizanne" "" "Main Page")
   )))


;; color-theme

(require 'color-theme)
(color-theme-initialize)

(add-to-list 'custom-theme-load-path "~/config/emacs-color-theme-solarized")
(load-theme 'solarized t)

;; (defface tuareg-font-lock-governing-face
;;   '((((background light))
;;      (:foreground "#b58900" :bold t))
;;     (t (:foreground "#b58900" :bold t)))
;;   "Face description for governing/leading keywords."
;;   :group 'tuareg-faces)

;; (defvar tuareg-font-lock-governing-face
;;   'tuareg-font-lock-governing-face)

;; (defface tuareg-font-lock-operator-face
;;   '((((background light)) (:foreground "brown"))
;;     (t (:foreground "#2f85f5")))
;;   "Face description for all operators."
;;   :group 'tuareg-faces)

;; (defvar tuareg-font-lock-operator-face
;;  'tuareg-font-lock-operator-face)

;; (defun color-theme-thizanne ()
;;   (interactive)
;;   (color-theme-install
;;    '(color-theme-thizanne
;;      ((background-mode . light)
;;       (border-color . "#000000")
;;       (cursor-color . "#5cf4ff")
;;       (foreground-color . "#ffffff")
;;       (mouse-color . "black"))
;;      (fringe ((t (:background "#000000"))))
;;      (mode-line ((t (:foreground "#f50000" :background "#ffea0a"))))
;;      (region ((t (:background "#091158"))))
;;      (font-lock-builtin-face ((t (:foreground "#008000"))))
;;      (font-lock-comment-face ((t (:foreground "#fade00"))))
;;      (font-lock-function-name-face ((t (:foreground "#2f85f5"))))
;;      (font-lock-keyword-face ((t (:foreground "#0066eb"))))
;;      (font-lock-string-face ((t (:foreground "#ff8000"))))
;;      (font-lock-type-face ((t (:foreground "#00ffac"))))
;;      (font-lock-variable-name-face ((t (:foreground "#00d4eb"))))
;;      (minibuffer-prompt ((t (:foreground "#ffbd05" :bold t))))
;;      (font-lock-warning-face ((t (:foreground "Red" :bold t))))
;;      )))

;; (provide 'color-theme-thizanne)
