# Configuration zsh de Thibault Suzanne
TERM=rxvt-unicode-256color
export HOME=/mathworks/home/tsuzanne
#TERM=rxvt-unicode
PATH=${HOME}/bin:${HOME}/.cabal/bin:$PATH
XDG_CONFIG_HOME=${HOME}/.config

# Historique
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_space
setopt appendhistory

export LESS=-XRS
export WORDCHARS='' # Do not treat /a/path/with/slashes as a single word
export GDK_USE_XFT=0
export EDITOR='emacsclient.sh'
export BROWSER='firefox'

# Raccourcis clavier
bindkey -e

# Completion
autoload -Uz compinit
compinit
zstyle :compinstall filename '/home/thibault/.zshrc'
zstyle ':completion::complete:*' use-cache 1

# Schema de completion :
# 1ere tabulation : complete jusqu'au bout de la partie commune et
#                   propose une liste de choix
# 2eme tabulation : complete avec le 1er item de la liste
# 3eme tabulation : complete avec le 2eme item de la liste, etc...
unsetopt list_ambiguous
# Quand le dernier caractere d'une completion est '/' et que l'on
# tape 'espace' apres, le '/' est efface
setopt auto_remove_slash
# Fait la completion sur les fichiers et repertoires caches
setopt glob_dots
# Traite les liens symboliques comme il faut
setopt chase_links
# Quand l'utilisateur commence sa commande par '!' pour faire de la
# completion historique, il n'execute pas la commande immediatement
# mais il ecrit la commande dans le prompt
# setopt hist_verify
# Ignorer les doublons dans l'historique
setopt hist_ignore_all_dups
# Si la commande est invalide mais correspond au nom d'un sous-répertoire
# exécuter 'cd sous-répertoire'
setopt auto_cd
# L'exécution de "cd" met le répertoire d'où l'on vient sur la pile
setopt auto_pushd
# Correction des fautes de frappe dans les commandes ^^
# setopt correctall

# Options diverses
# N'envoie pas de "HUP" aux jobs qui tournent quand le shell se ferme
unsetopt hup
# Expressions régulières dans les globs à la bash...
# setopt extendedglob

# If a * glob fails, remove it from the command. If all fail, the command fails.
setopt cshnullglob

# Prompt
autoload -U promptinit
promptinit
autoload -U colors
colors
# Prompt rigolo : user@host \_o<
PS1="%(!.%{$fg[red]%}.%{$fg[green]%})%n%{$fg[yellow]%}@%{$fg[default]%}%m %{$fg[blue]%}\%{$fg[red]%}_%{$fg[green]%}o%{$fg[yellow]%}<%{$reset_color%} "

RPS1="%(?..%B%{$fg[red]%}%?%b%{$fg[default]%} / )%{$fg[cyan]%}%28<...<%~%<<%{$fg[default]%} / %B%{$fg[cyan]%}%*%b"

# Utilisation des titres de xterm
case $TERM in
    xterm*|rxvt*|Eterm|screen)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac

# Alias

alias diff='diff --color=auto'
alias dup='urxvtc &' # To spawn urxvt in the same dir

alias ls='ls --classify -Lh --literal'
alias l='/bin/ls'
alias l1='ls -1'
alias la='ls -A'
alias ll='ls -l'
alias lla='ls -la'

alias rm='rm --preserve-root'
alias cd..='cd ..'
alias df='df -h'
alias du='du -h'
alias s='sudo -E'
alias ss='sudo -sE'

alias halt='systemctl poweroff'
alias reboot='systemctl reboot'

alias caml='rlwrap ocaml -init /dev/null' # bare toplevel
alias sml='rlwrap sml'
alias emacs='emacsclient.sh'
alias emacsudo='EDITOR=emacsclient.sh visudo'
alias ocaml='rlwrap ocaml'
alias vba='VisualBoyAdvance'
alias yoplait='yaourt -Syyua --noconfirm'

alias ssht='ssh maxibolt@tonbnc.fr -D 8081'
alias sshm='ssh premieremetz@tonbnc.fr'

# OPAM configuration
export OPAMROOT=/opamroot
. $OPAMROOT/opam-init/init.zsh > /dev/null 2> /dev/null || true
eval `opam env`

# Gem configuration
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# Start X on login in TTY 1
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

export PATH

# autojump
source /usr/share/autojump/autojump.sh

# Antialiasing for swing applications
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"

# MathWorks setup

export P4MERGE=p4merge

path+=/mathworks/GNB/devel/pst/utils/bin
export SBTOOLS_VNC_WINDOW_MGR=xmonad
. ~/mw_zsh_setup.zsh
. /mathworks/GNB/devel/pst/utils/core/config.bash

compdef sbmake=make
# Polyspace variables
export pst=/mathworks/GNB/devel/pst
export latest_job_archive=/mathworks/GNB/devel/jobarchive/Bpolyspace_core/latest_pass
export latest_product=/mathworks/GNB/devel/jobarchive/BR2018bd/latest_pass
export latest_pass=/mathworks/GNB/devel/jobarchive/Bpolyspace_core/latest_pass/
export latest_polyspace=$latest_job_archive/matlab/polyspace/bin
export latest_polyspace_btv=$latest_job_archive/matlab/test/tools/polyspace/btv
export latest_bslvnv=/mathworks/GNB/devel/jobarchive/Bslvnv/latest_pass/matlab/polyspace/bin
export latest_bslvnv_btv=/mathworks/GNB/devel/jobarchive/Bslvnv/latest_pass/matlab/test/tools/polyspace/btv
export sandbox=/mathworks/GNB/devel/sandbox
export sbs=/mathworks/devel/sbs/11/
export devsb=/local/mw

# MathWorks path
# tools to print intermediate files
PATH=/mathworks/GNB/devel/pst/utils/bin/:$PATH
# ps* tools
PATH=/mathworks/GNB/hub/pst/PSBaT-CURRENT/bin:$PATH
# latest polyspace
PATH=$latest_polyspace:$PATH
# btv
PATH=$latest_job_archive/matlab/test/tools/polyspace/btv/:$PATH
# Mathworks Perl
# PATH=/mathworks/GNB/hub/Linux/glibc-2.11.3/x86_64/apps/bat/latest/bin:$PATH
# perforce
PATH=/usr/local/netbin:$PATH
## Add MW Perl to the PATH
PATH=/mathworks/GNB/hub/Linux/glibc-2.13/x86_64/apps/bat/perl/perl-5.20.2-mw-020/bin:$PATH

alias mwocaml='rlwrap /local/mw/matlab/derived/glnxa64/mwocaml/bin/ocaml -I /local/mw/matlab/derived/glnxa64/mwocaml/lib/ocaml/std-lib/'
alias psnw='polyspace -open-new-window'
alias psbf='polyspace-bug-finder-server -sources'
alias pscp='polyspace-code-prover-server -sources'
alias set_latest_bpscore='export PATH=$latest_polyspace:$PATH'
alias set_latest_bpscore_btv='export PATH=$latest_polyspace_btv:$PATH'
alias set_latest_product='export PATH=$latest_product/matlab/polyspace/bin:$PATH'
alias set_latest_bslvnv='export PATH=$latest_bslvnv:$PATH'
alias set_latest_bslvnv_btv='export PATH=$latest_bslvnv_btv:$PATH'
alias set_current_sb='export PATH=`sbroot`/matlab/polyspace/bin:`sbroot`/matlab/bin/glnxa64:$PATH'
alias set_current_sb_btv='export PATH=`sbroot`/matlab/test/tools/polyspace/btv/:$PATH'
alias set_dev_sb='export PATH=$devsb/matlab/polyspace/bin:$PATH'
alias set_dev_sb_btv='export PATH=$devsb/matlab/test/tools/polyspace/btv:$PATH'
alias set_dev='set_dev_sb;set_dev_sb_btv'
alias core-sbs='/mathworks/GNB/devel/pst/utils/core/core-sbs'
alias cdroot='cd `sbroot`'
alias elog='emacs $(core-log)'
