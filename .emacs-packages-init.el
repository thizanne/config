;; color-theme

(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-initialize)
(color-theme-solarized-dark)

;; opam

;; ;; To automatically add opam emacs directory to the load-path
;; (setq opam-share
;;       (substring
;;        (shell-command-to-string "opam config var share 2> /dev/null")
;;        0 -1))
(setq opam-share "~/.opam/4.02.3/share")

(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))

;; utop

(autoload 'utop "utop" "Toplevel for OCaml" t)

;; ocp-indent

(require 'ocp-indent)
(add-hook 'typerex-mode-hook 'ocp-setup-indent t)
(add-hook 'tuareg-mode-hook 'ocp-setup-indent t)

;; merlin

(require 'merlin)

(add-hook 'tuareg-mode-hook 'merlin-mode t)
(add-hook 'caml-mode-hook 'merlin-mode t)
(add-hook 'typerex-mode-hook 'merlin-mode t)

; Make company aware of merlin
(add-to-list 'company-backends 'merlin-company-backend)

(setq merlin-command 'opam)

;; tuareg

(autoload
  'tuareg-mode "tuareg"
  "Major mode for editing Caml code" t)

(autoload 'camldebug "camldebug"
  "Run the Caml debugger" t)

(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))

;; auctex

(load "auctex.el" nil t t)
(load "preview.el" nil t t)

(add-to-list 'auto-mode-alist '("\\.hva" . tex-mode))

(setq TeX-engine 'xetex)
(setq TeX-PDF-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
;; If you often use \include or \input, you should make AUCTeX aware
;; of the multi-file document structure. You can do this with :
(setq-default TeX-master nil)

;; erlang

(require 'erlang-start)
(require 'erlang-flymake)

(add-to-list 'auto-mode-alist '("\\.erl" . erlang-mode))

(setq erlang-root-dir "/usr/lib/erlang")
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))

;; graphviz

(autoload
  'graphviz-dot-mode "graphviz-dot-mode.el"
  "graphviz dot mode." t)

(add-to-list 'auto-mode-alist '("\\.dot" . graphviz-dot-mode))

;; haskell

(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)


;; python

(autoload
  'python-mode "python-mode.el"
  "Python mode." t)

(add-to-list 'auto-mode-alist '("\\.py" . python-mode))

(setq py-shell-name "python3")

;; ProofGeneral

;; (load-file "/usr/share/emacs/site-lisp/ProofGeneral/generic/proof-site.el")

;; cc-mode

;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/cc-mode/")
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

;; auto-complete

;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/auto-complete")
;; (require 'auto-complete-config)

;; (add-to-list
;;  'ac-dictionary-directories
;;  "/usr/share/emacs/site-lisp/auto-complete/ac-dict")

;; (ac-config-default)
;; (setq ac-auto-start nil)
;; (ac-set-trigger-key "TAB")

;; pkgbuild

;; (require 'pkgbuild-mode)
;; (add-to-list 'auto-mode-alist '("PKGBUILD$" . pkgbuild-mode))

;; lua

;; (autoload
;;   'lua-mode "lua-mode"
;;   "Lua editing mode" t)

;; (add-to-list 'auto-mode-alist '("\\.lua" . lua-mode))

;; nxhtml

;; (load "/usr/share/emacs/site-lisp/nxhtml/autostart.el")
;; (add-to-list 'auto-mode-alist '("\\.html$" nxhtml-mode))
;; (add-to-list 'auto-mode-alist '("\\.x(ht)?ml$" nxhtml-mode))

;; php

;; (autoload
;;   'php-mode "php-mode"
;;   "Major mode for editing php code." t)
;; (add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

;; POV-ray

;; (autoload
;;   'pov-mode "pov-mode"
;;   "POV-Ray mode." t)

;; (add-to-list 'auto-mode-alist '("\\.pov\\'" . pov-mode))
;; (add-to-list 'auto-mode-alist '("\\.inc\\'" . pov-mode))

;; mediawiki

;; (require 'mediawiki)
;; (add-hook
;;  'mediawiki-mode-hook
;;  '(lambda ()
;;     (local-set-key (kbd "M-RET") 'mediawiki-open-page-at-point)
;;     ))

;; (setq
;;  mediawiki-site-alist
;;  '(
;;    ("wiki.rez" "http://wiki.rezometz.org/" "Suze" "" "Accueil")
;;    ("wpfr" "http://fr.wikipedia.org/w/" "thizanne" "" "Main Page")
;;    ))
