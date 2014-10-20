(setq custom-file "~/.emacs-custom.el")
(load custom-file)

(setq font-lock-maximum-decoration t)
(setq whitespace-line-column 79)
(setq require-final-newline t)
(setq standard-indent 4)
(setq set-mark-command-repeat-pop t)
(setq vc-follow-symlinks t)

(set-language-environment "UTF-8")
(setq locale-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq-default indent-tabs-mode nil)

(defun my-tabs-makefile-hook ()
  (setq indent-tabs-mode t))
(add-hook 'makefile-mode-hook 'my-tabs-makefile-hook)

(add-hook 'before-save-hook 'whitespace-cleanup)

(global-set-key (kbd "C-v") 'scroll-up-line)
(global-set-key (kbd "M-v") 'scroll-down-line)
(global-set-key (kbd "C-c ;") 'comment-region)
(global-set-key (kbd "C-c ,") 'uncomment-region)

;; Numéros de lignes alignés à droite, avec un espace entre le numéro et le texte
(global-linum-mode 1)
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

(setq fill-nobreak-predicate '(fill-french-nobreak-p))

(add-to-list 'load-path "/usr/share/emacs/site-lisp/auto-complete")
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "/usr/share/emacs/site-lisp/auto-complete/ac-dict")
;; (ac-config-default)
;; (setq ac-auto-start nil)
;; (ac-set-trigger-key "TAB")

(menu-bar-mode -1)
(column-number-mode 1)
(global-set-key (kbd "M-o") 'next-multiframe-window)
(global-set-key (kbd "M-i") 'previous-multiframe-window)

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

(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))


(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-log-done t)

(setq org-src-fontify-natively t)
(setq org-latex-listings 'minted)
(setq org-latex-minted-options
      '(("frame" "none")
        ("fontsize" "\\small")
        ("linenos" "true")
        ("mathescape" "true")
        ))

;; (require 'ox-latex)

(setq org-latex-pdf-process
      '("latexmk -gg -pdflatex='xelatex --shell-escape' -pdf -bibtex %f")
      )
;; (add-to-list 'org-latex-classes
;;              '("article"
;;                "\\documentclass\{article\}
;;                \\input\{/home/thibault/latex/tpl.tex\}
;;                [NO-DEFAULT-PACKAGES]
;;                [NO-PACKAGES]"
;;                ("\\section\{%s\}" . "\\section*\{%s\}")
;;                ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
;;                ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")
;;                ("\\paragraph\{%s\}" . "\\paragraph*\{%s\}")
;;                ("\\subparagraph\{%s\}" . "\\subparagraph*\{%s\}")
;;                ))

;; (add-to-list 'org-latex-classes
;;              '("koma-article"
;;                "\\documentclass\{scrartcl\}
;;                 \\input\{/home/thibault/latex/tpl.tex\}
;;                 \[NO-DEFAULT-PACKAGES\]
;;                 \[NO-PACKAGES\]"
;;                ("\\section\{%s\}" . "\\section*\{%s\}")
;;                ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
;;                ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")
;;                ("\\paragraph\{%s\}" . "\\paragraph*\{%s\}")
;;                ("\\subparagraph\{%s\}" . "\\subparagraph*\{%s\}")
;;                ))

;; (add-to-list 'org-latex-classes
;;              '("beamer"
;;                "\\documentclass\[presentation,svgnames\]\{beamer\}
;;                 \\input\{/home/thibault/latex/tpl_beamer.tex\}
;;                 [NO-DEFAULT-PACKAGES]
;;                 [NO-PACKAGES]"
;;                ("\\section\{%s\}" . "\\section*\{%s\}")
;;                ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
;;                ))
(setq org-beamer-frame-level 3)
(setq org-beamer-theme "Darmstadt")

(add-hook 'org-mode-hook 'turn-on-auto-fill)

(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all))
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
  )
(add-hook 'org-mode-hook 'org-mode-reftex-setup)


(autoload 'python-mode "python-mode.el" "Python mode." t)
(add-to-list 'auto-mode-alist '("\\.py" . python-mode))
(setq py-shell-name "python3")

;; (load-file "/usr/share/emacs/site-lisp/ProofGeneral/generic/proof-site.el")

(add-to-list 'load-path "/usr/share/emacs/site-lisp/cc-mode/")
(setq c-default-style "k&r" c-basic-offset 4)

;; (require 'pkgbuild-mode)
;; (add-to-list 'auto-mode-alist '("PKGBUILD$" . pkgbuild-mode))

(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)

;; (require 'mediawiki)
;; (add-hook 'mediawiki-mode-hook
;;           '(lambda ()
;;              (global-set-key (kbd "M-RET") 'mediawiki-open-page-at-point)
;;              ))

;; (setq mediawiki-site-alist
;;       (quote
;;        (
;;         ("wiki.rez" "http://wiki.rezometz.org/" "Suze" "" "Accueil")
;;         ("wpfr" "http://fr.wikipedia.org/w/" "thizanne" "" "Main Page")
;;         )))


(autoload 'graphviz-dot-mode "graphviz-dot-mode.el" "graphviz dot mode." t)
(add-to-list 'auto-mode-alist '("\\.dot" . graphviz-dot-mode))

(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
;; (add-hook 'tuareg-mode-hook
;;           '(lambda ()
;;              (setq tuareg-sym-lock-keywords nil)
;;              (setq standard-indent 2)
;;              )
;;           )


(add-to-list 'load-path "~/.opam/4.02.1/share/emacs/site-lisp")
(require 'ocp-indent)
(add-hook 'typerex-mode-hook 'ocp-setup-indent t)

;; Add opam emacs directory to the load-path
(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
;; Load merlin-mode
(require 'merlin)
;; Start merlin on ocaml files
(add-hook 'tuareg-mode-hook 'merlin-mode t)
(add-hook 'caml-mode-hook 'merlin-mode t)
(add-hook 'typerex-mode-hook 'merlin-mode t)
;; Enable auto-complete
(setq merlin-use-auto-complete-mode 'easy)
;; Use opam switch to lookup ocamlmerlin binary
(setq merlin-command 'opam)

;; Loading TypeRex mode for OCaml files
(add-to-list 'load-path "/usr/share/emacs/site-lisp")
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . typerex-mode))
(add-to-list 'interpreter-mode-alist '("ocamlrun" . typerex-mode))
(add-to-list 'interpreter-mode-alist '("ocaml" . typerex-mode))
(autoload 'typerex-mode "typerex" "Major mode for editing Caml code" t)

;; TypeRex mode configuration
(setq ocp-server-command "/usr/bin/ocp-wizard")
(setq typerex-in-indent 0)
(setq-default indent-tabs-mode nil)

(setq ocp-theme "tuareg_like")

;; Auto completion (experimental)
;; Don't use M-x invert-face default with auto-complete! (emacs -r is OK)
(add-to-list 'load-path "/usr/share/emacs/site-lisp/auto-complete-mode")
(setq ocp-auto-complete t)

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(add-to-list 'auto-mode-alist '("\\.hva" . tex-mode))
(setq TeX-engine 'xetex)
(setq TeX-PDF-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
;;Finally, if you often use \include or \input, you should make AUCTeX aware of the multi-file document structure. You can do this by inserting :
(setq-default TeX-master nil)

(add-to-list 'auto-mode-alist '("\\.erl" . erlang-mode))
(setq erlang-root-dir "/usr/lib/erlang")
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
(require 'erlang-start)
(require 'erlang-flymake)


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

;; (defface tuareg-font-lock-governing-face
;;   '((((background light))
;;      (:foreground "#0066eb" :bold nil))
;;     (t (:foreground "#0066eb" :bold nil)))
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
;;   'tuareg-font-lock-operator-face)

;; (provide 'color-theme-thizanne)
;; (require 'color-theme)
;; (color-theme-initialize)
;; (color-theme-thizanne)


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
