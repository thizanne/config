(require 'ox-latex)
(require 'ox-beamer)
(require 'ox-bibtex)
(require 'ox-extra)

;; Global conf

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq org-log-done t)
(setq org-src-fontify-natively t)
(add-hook 'org-mode-hook 'turn-on-auto-fill)

;; Allow :ignore: tag to ignore a heading at export but not its
;; contents
(ox-extras-activate '(ignore-headlines))

;; Babel

;;;; active Babel languages

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (ocaml . t)
   (python . t)
   (shell . t)
   (latex . t)
   ))

;;;; Don't ask before evaluating
(setq org-confirm-babel-evaluate nil)

;; Use minted

(setq org-latex-listings 'minted)
(setq org-latex-minted-options
      '(("frame" "none")
        ("fontsize" "\\small")
;;        ("linenos" "true")
        ("mathescape" "true")
        ("escapeinside" "||")
        ))

;; latex conf

(setq
 org-latex-pdf-process
 '("latexmk -gg -pdflatex='xelatex --shell-escape' -pdf -bibtex %f")
 )

(setq org-export-headline-levels 5)

;; latex classes

(add-to-list
 'org-latex-classes
 '("article"
   "\\documentclass\{article\}
    \\input\{/home/thibault/latex/tpl.tex\}
    [NO-DEFAULT-PACKAGES]
    [NO-PACKAGES]"
   ("\\section\{%s\}" . "\\section*\{%s\}")
   ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
   ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")
   ("\\paragraph\{%s\}" . "\\paragraph*\{%s\}")
   ("\\subparagraph\{%s\}" . "\\subparagraph*\{%s\}")
   ))

(add-to-list
 'org-latex-classes
 '("koma-article"
   "\\documentclass\{scrartcl\}
    \\input\{/home/thibault/latex/tpl.tex\}
    \[NO-DEFAULT-PACKAGES\]
    \[NO-PACKAGES\]"
   ("\\section\{%s\}" . "\\section*\{%s\}")
   ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
   ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")
   ("\\paragraph\{%s\}" . "\\paragraph*\{%s\}")
   ("\\subparagraph\{%s\}" . "\\subparagraph*\{%s\}")
   ))

(add-to-list
 'org-latex-classes
 '("llncs"
   "\\documentclass\{llncs\}
\[NO-DEFAULT-PACKAGES\]
\[NO-PACKAGES\]"
   ("\\section\{%s\}" . "\\section*\{%s\}")
   ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
   ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")
   ("\\paragraph\{%s\}" . "\\paragraph*\{%s\}")
   ("\\subparagraph\{%s\}" . "\\subparagraph*\{%s\}")
   ))

(add-to-list
 'org-latex-classes
 '("book"
   "\\documentclass\{book\}
    \\input\{tpl.tex\}
    \[NO-DEFAULT-PACKAGES\]
    \[NO-PACKAGES\]"
   ("\\part\{%s\}" . "\\part*\{%s\}")
   ("\\chapter\{%s\}" . "\\chapter*\{%s\}")
   ("\\section\{%s\}" . "\\section*\{%s\}")
   ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
   ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")
   ("\\paragraph\{%s\}" . "\\paragraph*\{%s\}")
   ("\\subparagraph\{%s\}" . "\\subparagraph*\{%s\}")
   ))

(add-to-list
 'org-latex-classes
 '("koma-book"
   "\\documentclass\{scrbook\}
    \\input\{tpl.tex\}
    \[NO-DEFAULT-PACKAGES\]
    \[NO-PACKAGES\]"
   ("\\part\{%s\}" . "\\part*\{%s\}")
   ("\\chapter\{%s\}" . "\\chapter*\{%s\}")
   ("\\section\{%s\}" . "\\section*\{%s\}")
   ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
   ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")
   ("\\paragraph\{%s\}" . "\\paragraph*\{%s\}")
   ("\\subparagraph\{%s\}" . "\\subparagraph*\{%s\}")
   ))

;; (add-to-list
;;  'org-latex-classes
;;  '("beamer"
;;    "\\documentclass\[presentation,svgnames\]\{beamer\}
;;     \\input\{/home/thibault/latex/tpl_beamer.tex\}
;;     [NO-DEFAULT-PACKAGES]
;;     [NO-PACKAGES]"
;;    ("\\section\{%s\}" . "\\section*\{%s\}")
;;    ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
;;    ))

;; beamer specific conf

(setq org-beamer-frame-level 3)
(setq org-beamer-theme "metropolis")

;; reftex

(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (progn
         (setq TeX-master t)
         (turn-on-reftex)
         (global-auto-revert-mode t)
         (reftex-parse-all)
         (reftex-set-cite-format "[[cite:%l]]")
         )
       )
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
  )

(add-hook 'org-mode-hook 'org-mode-reftex-setup)
