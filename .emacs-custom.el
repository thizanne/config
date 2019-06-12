(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(bibtex-align-at-equal-sign t)
 '(custom-enabled-themes (quote (solarized)))
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(inhibit-startup-screen t)
 '(org-beamer-environments-extra
   (quote
    (("onlyenv" "O" "\\begin{onlyenv}%a" "\\end{onlyenv}"))))
 '(org-beamer-outline-frame-title "Plan")
 '(org-emphasis-regexp-components (quote ("     ('\"{" "-       .,:!?;'\")}\\" "," "." 3)) t)
 '(org-latex-listings (quote minted))
 '(org-latex-minted-langs
   (quote
    ((emacs-lisp "common-lisp")
     (cc "c++")
     (cperl "perl")
     (shell-script "bash")
     (typerex "ocaml"))))
 '(org-latex-pdf-process
   (quote
    ("latexmk -pdflatex='xelatex --shell-escape' -pdf -bibtex %f")))
 '(package-selected-packages
   (quote
    (term-keys iedit php-mode nlinum anzu rainbow-delimiters rainbow-mode zlc sass-mode python-mode pkgbuild-mode org-plus-contrib org mediawiki markdown-mode magit haskell-mode company-quickhelp company-coq company-auctex color-theme)))
 '(proof-assistant-home-page "http://coq.inria.fr/")
 '(proof-context-command "Print All. ")
 '(proof-electric-terminator-enable t)
 '(proof-find-and-forget-fn (quote coq-find-and-forget))
 '(proof-find-theorems-command "Search %s. ")
 '(proof-goal-command "Goal %s. ")
 '(proof-goal-command-p (quote coq-goal-command-p))
 '(proof-guess-command-line (quote coq-guess-command-line))
 '(proof-nested-undo-regexp
   "\\(?:\\_<Axiom\\_>\\)\\|\\(?:\\_<Global\\s-+Variable\\_>\\)\\|\\(?:\\_<Global\\s-+Variables\\_>\\)\\|\\(?:\\_<Hint\\s-+Constructors\\_>\\)\\|\\(?:\\_<Hint\\s-+Extern\\_>\\)\\|\\(?:\\_<Hint\\s-+Immediate\\_>\\)\\|\\(?:\\_<Hint\\s-+Resolve\\_>\\)\\|\\(?:\\_<Hint\\s-+Rewrite\\_>\\)\\|\\(?:\\_<Hint\\s-+Unfold\\_>\\)\\|\\(?:\\_<Existing\\s-+Instance\\_>\\)\\|\\(?:\\_<Hypothesis\\_>\\)\\|\\(?:\\_<Hypotheses\\_>\\)\\|\\(?:\\_<Parameter\\_>\\)\\|\\(?:\\_<Parameters\\_>\\)\\|\\(?:\\_<Conjecture\\_>\\)\\|\\(?:\\_<Variable\\_>\\)\\|\\(?:\\_<Variables\\_>\\)\\|\\(?:\\_<Coercion\\_>\\)\\|\\(?:\\_<CoFixpoint\\_>\\)\\|\\(?:\\_<CoInductive\\_>\\)\\|\\(?:\\_<Class\\_>\\)\\|\\(?:\\_<Declare\\s-+Module\\_>\\)\\|\\(?:\\_<Definition\\_>\\)\\|\\(?:\\_<Program\\s-+Definition\\_>\\)\\|\\(?:\\_<Derive\\s-+Inversion\\_>\\)\\|\\(?:\\_<Derive\\s-+Dependent\\s-+Inversion\\_>\\)\\|\\(?:\\_<Example\\_>\\)\\|\\(?:\\_<Equations\\_>\\)\\|\\(?:\\_<Fixpoint\\_>\\)\\|\\(?:\\_<Program\\s-+Fixpoint\\_>\\)\\|\\(?:\\_<Function\\_>\\)\\|\\(?:\\_<Functional\\s-+Scheme\\_>\\)\\|\\(?:\\_<Inductive\\_>\\)\\|\\(?:\\_<Instance\\_>\\)\\|\\(?:\\_<Program\\s-+Instance\\_>\\)\\|\\(?:\\_<Let\\_>\\)\\|\\(?:\\_<Ltac\\_>\\)\\|\\(?:\\_<Record\\_>\\)\\|\\(?:\\_<Scheme\\_>\\)\\|\\(?:\\_<Structure\\_>\\)\\|\\(?:\\_<Add\\s-+Morphism\\_>\\)\\|\\(?:\\_<Add\\s-+Parametric\\s-+Morphism\\_>\\)\\|\\(?:\\_<Chapter\\_>\\)\\|\\(?:\\_<Corollary\\_>\\)\\|\\(?:\\_<Fact\\_>\\)\\|\\(?:\\_<Goal\\_>\\)\\|\\(?:\\_<Lemma\\_>\\)\\|\\(?:\\_<Program\\s-+Lemma\\_>\\)\\|\\(?:\\_<Module\\s-+Type\\_>\\)\\|\\(?:\\_<Module\\_>\\)\\|\\(?:\\_<Remark\\_>\\)\\|\\(?:\\_<Section\\_>\\)\\|\\(?:\\_<Theorem\\_>\\)\\|\\(?:\\_<Program\\s-+Theorem\\_>\\)\\|\\(?:\\_<Obligation\\_>\\)\\|\\(?:\\_<Next Obligation\\_>\\)\\|\\(?:\\_<Add\\s-+Parametric\\s-+Relation\\_>\\)\\|\\(?:\\_<BeginSubproof\\_>\\)\\|\\(?:\\_<EndSubproof\\_>\\)\\|\\(?:\\_<Add\\s-+Abstract\\s-+Ring\\_>\\)\\|\\(?:\\_<Add\\s-+Abstract\\s-+Semi\\s-+Ring\\_>\\)\\|\\(?:\\_<Add\\s-+Field\\_>\\)\\|\\(?:\\_<Add\\s-+Printing\\_>\\)\\|\\(?:\\_<Add\\s-+Printing\\s-+If\\_>\\)\\|\\(?:\\_<Add\\s-+Printing\\s-+Let\\_>\\)\\|\\(?:\\_<Add\\s-+Ring\\_>\\)\\|\\(?:\\_<Add\\s-+Semi\\s-+Ring\\_>\\)\\|\\(?:\\_<Add\\s-+Setoid\\_>\\)\\|\\(?:\\_<Arguments\\s-+Scope\\_>\\)\\|\\(?:\\_<Bind\\s-+Scope\\_>\\)\\|\\(?:\\_<Canonical\\s-+Structure\\_>\\)\\|\\(?:\\_<Local\\s-+Close\\s-+Scope\\_>\\)\\|\\(?:\\_<Close\\s-+Scope\\_>\\)\\|\\(?:\\_<Delimit\\s-+Scope\\_>\\)\\|\\(?:\\_<Export\\_>\\)\\|\\(?:\\_<Extraction\\s-+Inline\\_>\\)\\|\\(?:\\_<Extraction\\s-+NoInline\\_>\\)\\|\\(?:\\_<Extraction\\s-+Language\\_>\\)\\|\\(?:\\_<Generalizable\\s-+Variables\\_>\\)\\|\\(?:\\_<Generalizable\\s-+All\\s-+Variables\\_>\\)\\|\\(?:\\_<Identity\\s-+Coercion\\_>\\)\\|\\(?:\\_<Implicit\\s-+Arguments\\s-+Off\\_>\\)\\|\\(?:\\_<Implicit\\s-+Arguments\\s-+On\\_>\\)\\|\\(?:\\_<Implicit\\s-+Arguments\\_>\\)\\|\\(?:\\_<Implicit\\s-+Types\\_>\\)\\|\\(?:\\_<Import\\_>\\)\\|\\(?:\\_<Infix\\_>\\)\\|\\(?:\\_<Local\\s-+Notation\\_>\\)\\|\\(?:\\_<Notation\\_>\\)\\|\\(?:\\_<Obligation\\s-+Tactic\\_>\\)\\|\\(?:\\_<Local\\s-+Open\\s-+Scope\\_>\\)\\|\\(?:\\_<Open\\s-+Local\\s-+Scope\\_>\\)\\|\\(?:\\_<Open\\s-+Scope\\_>\\)\\|\\(?:\\_<Remove\\s-+Printing\\s-+If\\_>\\)\\|\\(?:\\_<Remove\\s-+Printing\\s-+Let\\_>\\)\\|\\(?:\\_<Require\\s-+Export\\_>\\)\\|\\(?:\\_<Require\\s-+Import\\_>\\)\\|\\(?:\\_<Require\\_>\\)\\|\\(?:\\_<Reset\\s-+Extraction\\s-+Inline\\_>\\)\\|\\(?:\\_<Save\\_>\\)\\|\\(?:\\_<Set\\s-+Extraction\\s-+AutoInline\\_>\\)\\|\\(?:\\_<Set\\s-+Extraction\\s-+Optimize\\_>\\)\\|\\(?:\\_<Set\\s-+Implicit\\s-+Arguments\\_>\\)\\|\\(?:\\_<Set\\s-+Strict\\s-+Implicit\\_>\\)\\|\\(?:\\_<Set\\s-+Printing\\s-+Synth\\_>\\)\\|\\(?:\\_<Set\\s-+Printing\\s-+Wildcard\\_>\\)\\|\\(?:\\_<Set\\s-+Printing\\s-+All\\_>\\)\\|\\(?:\\_<Set\\s-+Printing\\s-+Coercions\\_>\\)\\|\\(?:\\_<Set\\s-+Printing\\s-+Notations\\_>\\)\\|\\(?:\\_<Solve\\s-+Obligations\\_>\\)\\|\\(?:\\_<Tactic\\s-+Notation\\_>\\)\\|\\(?:\\_<Unset\\s-+Extraction\\s-+AutoInline\\_>\\)\\|\\(?:\\_<Unset\\s-+Extraction\\s-+Optimize\\_>\\)\\|\\(?:\\_<Unset\\s-+Implicit\\s-+Arguments\\_>\\)\\|\\(?:\\_<Unset\\s-+Strict\\s-+Implicit\\_>\\)\\|\\(?:\\_<Unset\\s-+Printing\\s-+Synth\\_>\\)\\|\\(?:\\_<Unset\\s-+Printing\\s-+Wildcard\\_>\\)\\|\\(?:\\_<Unset\\s-+Printing\\s-+Coercion\\_>\\)\\|\\(?:\\_<Axiom\\_>\\)\\|\\(?:\\_<Global\\s-+Variable\\_>\\)\\|\\(?:\\_<Global\\s-+Variables\\_>\\)\\|\\(?:\\_<Hint\\s-+Constructors\\_>\\)\\|\\(?:\\_<Hint\\s-+Extern\\_>\\)\\|\\(?:\\_<Hint\\s-+Immediate\\_>\\)\\|\\(?:\\_<Hint\\s-+Resolve\\_>\\)\\|\\(?:\\_<Hint\\s-+Rewrite\\_>\\)\\|\\(?:\\_<Hint\\s-+Unfold\\_>\\)\\|\\(?:\\_<Existing\\s-+Instance\\_>\\)\\|\\(?:\\_<Hypothesis\\_>\\)\\|\\(?:\\_<Hypotheses\\_>\\)\\|\\(?:\\_<Parameter\\_>\\)\\|\\(?:\\_<Parameters\\_>\\)\\|\\(?:\\_<Conjecture\\_>\\)\\|\\(?:\\_<Variable\\_>\\)\\|\\(?:\\_<Variables\\_>\\)\\|\\(?:\\_<Coercion\\_>\\)\\|\\(?:\\_<CoFixpoint\\_>\\)\\|\\(?:\\_<CoInductive\\_>\\)\\|\\(?:\\_<Class\\_>\\)\\|\\(?:\\_<Declare\\s-+Module\\_>\\)\\|\\(?:\\_<Definition\\_>\\)\\|\\(?:\\_<Program\\s-+Definition\\_>\\)\\|\\(?:\\_<Derive\\s-+Inversion\\_>\\)\\|\\(?:\\_<Derive\\s-+Dependent\\s-+Inversion\\_>\\)\\|\\(?:\\_<Example\\_>\\)\\|\\(?:\\_<Equations\\_>\\)\\|\\(?:\\_<Fixpoint\\_>\\)\\|\\(?:\\_<Program\\s-+Fixpoint\\_>\\)\\|\\(?:\\_<Function\\_>\\)\\|\\(?:\\_<Functional\\s-+Scheme\\_>\\)\\|\\(?:\\_<Inductive\\_>\\)\\|\\(?:\\_<Instance\\_>\\)\\|\\(?:\\_<Program\\s-+Instance\\_>\\)\\|\\(?:\\_<Let\\_>\\)\\|\\(?:\\_<Ltac\\_>\\)\\|\\(?:\\_<Record\\_>\\)\\|\\(?:\\_<Scheme\\_>\\)\\|\\(?:\\_<Structure\\_>\\)\\|\\(?:\\_<Add\\s-+Morphism\\_>\\)\\|\\(?:\\_<Add\\s-+Parametric\\s-+Morphism\\_>\\)\\|\\(?:\\_<Chapter\\_>\\)\\|\\(?:\\_<Corollary\\_>\\)\\|\\(?:\\_<Fact\\_>\\)\\|\\(?:\\_<Goal\\_>\\)\\|\\(?:\\_<Lemma\\_>\\)\\|\\(?:\\_<Program\\s-+Lemma\\_>\\)\\|\\(?:\\_<Module\\s-+Type\\_>\\)\\|\\(?:\\_<Module\\_>\\)\\|\\(?:\\_<Remark\\_>\\)\\|\\(?:\\_<Section\\_>\\)\\|\\(?:\\_<Theorem\\_>\\)\\|\\(?:\\_<Program\\s-+Theorem\\_>\\)\\|\\(?:\\_<Obligation\\_>\\)\\|\\(?:\\_<Obligations\\_>\\)\\|\\(?:\\_<Next Obligation\\_>\\)")
 '(proof-no-fully-processed-buffer t)
 '(proof-output-tooltips nil)
 '(proof-prog-name "/usr/bin/coqtop")
 '(proof-prog-name-guess t)
 '(proof-query-file-save-when-activating-scripting nil)
 '(proof-really-save-command-p (quote coq-save-command-p))
 '(proof-save-command "Save %s. ")
 '(proof-script-comment-end "*)")
 '(proof-script-comment-end-regexp "\\*)")
 '(proof-script-comment-start "(*")
 '(proof-script-comment-start-regexp "(\\*")
 '(proof-script-parse-function (quote coq-script-parse-function))
 '(proof-script-span-context-menu-extensions (quote coq-create-span-menu))
 '(proof-shell-assumption-regexp "\\(\\w\\(\\w\\|\\s_\\)*\\)")
 '(proof-shell-clear-goals-regexp
   "No\\s-+more\\s-+subgoals\\.\\|Subtree\\s-proved!\\|Proof\\s-completed")
 '(proof-shell-eager-annotation-end "\377\\|done\\]\\|</infomsg>\\|\\*\\*\\*\\*\\*\\*\\|) >")
 '(proof-shell-eager-annotation-start "\376\\|\\[Reinterning\\|Warning:\\|TcDebug \\|<infomsg>")
 '(proof-shell-eager-annotation-start-length 32)
 '(proof-shell-end-goals-regexp "
(dependent evars:")
 '(proof-shell-error-regexp
   "^\\(Error:\\|Discarding pattern\\|Syntax error:\\|System Error:\\|User Error:\\|User error:\\|Anomaly[:.]\\|Toplevel input[,]\\)")
 '(proof-shell-font-lock-keywords (quote coq-font-lock-keywords-1))
 '(proof-shell-init-cmd "Set Undo 500 . ")
 '(proof-shell-interactive-prompt-regexp "TcDebug ")
 '(proof-shell-interrupt-regexp "User Interrupt.")
 '(proof-shell-proof-completed-regexp
   "No\\s-+more\\s-+subgoals\\.\\|Subtree\\s-proved!\\|Proof\\s-completed")
 '(proof-shell-restart-cmd "Reset Initial.
 ")
 '(proof-shell-result-end "\372 End Pbp result \373")
 '(proof-shell-result-start "\372 Pbp result \373")
 '(proof-shell-start-goals-regexp "[0-9]+\\(?: focused\\)? subgoals?")
 '(proof-shell-start-silent-cmd "Set Silent. ")
 '(proof-shell-stop-silent-cmd "Unset Silent. ")
 '(proof-showproof-command "Show. ")
 '(proof-splash-time 0)
 '(proof-state-preserving-p (quote coq-state-preserving-p))
 '(proof-terminal-string ".")
 '(proof-tree-additional-subgoal-ID-regexp "^subgoal [0-9]+ (ID \\([0-9]+\\)) is:")
 '(proof-tree-cheating-regexp "admit")
 '(proof-tree-configured t)
 '(proof-tree-existential-regexp "\\(\\?[0-9]+\\)")
 '(proof-tree-existentials-state-end-regexp ")
")
 '(proof-tree-existentials-state-start-regexp "^(dependent evars:")
 '(proof-tree-extract-instantiated-existentials (quote coq-extract-instantiated-existentials))
 '(proof-tree-find-begin-of-unfinished-proof (quote coq-find-begin-of-unfinished-proof))
 '(proof-tree-get-proof-info (quote coq-proof-tree-get-proof-info))
 '(proof-tree-ignored-commands-regexp
   "^\\(\\(Show\\)\\|\\(Locate\\)\\|\\(Theorem\\)\\|\\(Lemma\\)\\|\\(Remark\\)\\|\\(Fact\\)\\|\\(Corollary\\)\\|\\(Proposition\\)\\|\\(Definition\\)\\|\\(Let\\)\\|\\(Fixpoint\\)\\|\\(CoFixpoint\\)\\)")
 '(proof-tree-navigation-command-regexp "^\\(Focus\\)\\|\\(Unfocus\\)")
 '(proof-tree-show-sequent-command (quote coq-show-sequent-command))
 '(safe-local-variable-values
   (quote
    ((org-latex-minted-options
      ("frame" "none")
      ("fontsize" "\\small"))
     (org-latex-minted-options quote
                               (("frame" "none")
                                ("fontsize" "\\small")
                                ("mathescape" "true")))
     (org-latex-prefer-user-labels . t)
     (org-latex-pdf-process "latexmk -gg -pdf -bibtex %f")
     (org-latex-pdf-process . "latexmk -gg -pdf -bibtex")
     (org-latex-listings . listings)
     (org-latex-pdf-process . latexmk)
     (org-latex-pdf-process . "latexmk -gg -pdf -bibtex %f"))))
 '(typerex-font-lock-symbols t)
 '(typerex-library-path "/usr/lib/ocaml"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(proof-locked-face ((t (:background "#000001")))))
