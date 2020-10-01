# Configuration zsh de Thibault Suzanne
TERM=rxvt-unicode-256color
#TERM=rxvt-unicode
PATH=${HOME}/bin:${HOME}/.cabal/bin:$PATH

XDG_CONFIG_HOME=${HOME}/.config

# Historique
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_space
setopt appendhistory

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

alias ls='ls -FLh --literal'
alias l='/bin/ls'
alias l1='ls -F1'
alias la='ls -FhA'
alias ll='ls -Fhl'
alias lla='ls -Fhla'

alias rm='rm --preserve-root'
alias cd..='cd ..'
alias df='df -h'
alias du='du -h'
alias s='sudo -E'
alias ss='sudo -sE'

alias halt='systemctl poweroff'
alias reboot='systemctl reboot'

alias caml='rlwrap ocaml -init /dev/null' # bare toplevel
alias emacs='emacsclient.sh'
alias emacsudo='EDITOR=emacsclient.sh visudo'
alias ocaml='rlwrap ocaml'
alias vba='VisualBoyAdvance'

alias ssht='ssh maxibolt@tonbnc.fr -D 8081'
alias sshm='ssh premieremetz@tonbnc.fr'
alias sshg='ssh tsuzanne@gnb-tsuzanne-deb9-64.mathworks.com -t zsh'

# OPAM configuration
. ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
eval `opam config env`

# Gem configuration
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# Start X on login in TTY 1
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

# autojump
source /etc/profile.d/autojump.sh

# Antialiasing for swing applications
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"

# Polyspace
path+=/usr/local/Polyspace/R2019a/polyspace/bin
