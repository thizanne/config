(require 'org-install)

;; Global conf

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq org-log-done t)
(setq org-src-fontify-natively t)
(add-hook 'org-mode-hook 'turn-on-auto-fill)

;; Use minted

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

;; latex classes
(setq org-latex-classes '())

(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass\{article\}
               \\input\{$HOME/latex/tpl.tex\}
               [NO-DEFAULT-PACKAGES]
               [NO-PACKAGES]"
               ("\\section\{%s\}" . "\\section*\{%s\}")
               ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
               ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")
               ("\\paragraph\{%s\}" . "\\paragraph*\{%s\}")
               ("\\subparagraph\{%s\}" . "\\subparagraph*\{%s\}")
               ))

(add-to-list 'org-latex-classes
             '("koma-article"
               "\\documentclass\{scrartcl\}
                \\input\{$HOME/latex/tpl.tex\}
                \[NO-DEFAULT-PACKAGES\]
                \[NO-PACKAGES\]"
               ("\\section\{%s\}" . "\\section*\{%s\}")
               ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
               ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")
               ("\\paragraph\{%s\}" . "\\paragraph*\{%s\}")
               ("\\subparagraph\{%s\}" . "\\subparagraph*\{%s\}")
               ))

(add-to-list 'org-latex-classes
             '("llncs"
               "\\documentclass\{llncs\}
                \\input\{$HOME/latex/tpl_llncs.tex\}
                \[NO-DEFAULT-PACKAGES\]
                \[NO-PACKAGES\]"
               ("\\section\{%s\}" . "\\section*\{%s\}")
               ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
               ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")
               ("\\paragraph\{%s\}" . "\\paragraph*\{%s\}")
               ("\\subparagraph\{%s\}" . "\\subparagraph*\{%s\}")
               ))

(add-to-list 'org-latex-classes
             '("beamer"
               "\\documentclass\[presentation,svgnames\]\{beamer\}
                \\input\{$HOME/latex/tpl_beamer.tex\}
                [NO-DEFAULT-PACKAGES]
                [NO-PACKAGES]"
               ("\\section\{%s\}" . "\\section*\{%s\}")
               ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
               ))

;; beamer

(setq org-beamer-frame-level 3)
(setq org-beamer-theme "Darmstadt")

;; reftex

(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all))
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
  )

(add-hook 'org-mode-hook 'org-mode-reftex-setup)
