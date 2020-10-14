# File: bash_setup.bash
# Abstract:
#   Source from your ~/.bashrc:
#     . /mathworks/hub/share/sbtools/bash_setup.bash
#
#   See sbsetupunix help.
#
#   Tested on
#     glnx86  Debian 4, Debian 5
#     glnxa64 Debian 4, Debian 5
#   Other platforms may need special handling
#
#   Note, this DOES NOT create a setmwe alias. To save waste, you
#   avoid setmwe and use:
#      sb            (to run matlab under the setmwe environment)
#      sbm           (to run a command under the right setmwe environment)
#      sbmake        (to run gmake under the right setmwe environment)
#      sbbuildit     (to run gmake on a once/mex-stage makefile)
#      sbshell       (to create a shell with setmwe configured in it)
#
#   If you find that your ~/.bashrc isn't sourced, i.e.
#     rsh -l username machine
#   fails to source ~/.bashrc, then you need to create a ~/.bash_profile which
#   contains:
#     . ~/.bashrc
#   On Debian, .bashrc is only sourced for interactive non-login shells and
#   .bash_profile is sourced for login shells (both interactive and
#   non-interactive).  If you were to add a local user to your debian machine
#   with bash as the shell, then you would get a copy of .bash_profile in the
#   new home directory from /etc/skel/.bash_profile. However,
#   /etc/skel/.bash_profile duplicates the ~/bin handling in this file, thus you
#   only need the single line ~/.bashrc file.
#
# Implementation and testing notes
#   - this needs to work on minimal shells, e.g.
#       /bin/sh Debian 6 dash shell,
#   - SunOS 5.8 (arnold - try jaadm account):
#      * export needs to be done on two lines
#          VAR=value
#          export VAR
#      * awk -F : '{...}' should be awk -F: '{...}'
#  In MATLAB:
#   - The path is not altered, i.e.
#     export PATH=${PATH}:/tmp
#     >> ! echo $PATH
#     should display /tmp at the end of the path.
#
# References
#   * See dash at https://wiki.ubuntu.com/DashAsBinSh
#   * GNU bash manual (6.2 - Bash Startup Files):
#     http://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html

sbtoolsRootBashSetup=/mathworks/hub/share/sbtools

####################################
# Define setmwe/unsetmwe functions #
####################################
# We are explicitly not supporting setmwe in non-interactive subshells
# (e.g. !/system in MATLAB or user shell script).  This used to be supported by
# setting BASH_ENV to a script that defines the setmwe and unsetmwe functions.
# However in the interest of simplifying the bash configuration, we have dropped
# support for setmwe in these scenarios.
setmwe () {
    echo "${BASH_SOURCE:-sbtools/bash_setup.bash}: NOTICE: setmwe is deprecated.  Please use mw, sbm or sbshell." >&2
    /mathworks/hub/bat/common/bin/setmwe.pl sh /tmp/setmwetmp.sh.$$ $* && . /tmp/setmwetmp.sh.$$
    /bin/rm -f /tmp/setmwetmp.sh.$$
}

unsetmwe () {
    setmwe none
}


# Don't source bash_setup_env.bash if we've already sourced it.  This clobbers a
# few environment variables, so if we have already sourced it in a parent shell,
# don't re-source it.
# Note if this is a login shell, the shell will have sourced /etc/profile, which
# overrides PATH, so we much re-source this file in that case.
shopt -q login_shell 1>/dev/null 2>&1
loginShell=$? # exit status - dash shell doesn't have shopt, exit status 127
if [ "$SBARCH" = "" -o $loginShell -eq 0 ] ; then
    . $sbtoolsRootBashSetup/bash_setup_env.bash
fi
unset loginShell


################################
# Restore setmwe (see sbshell) #
################################
if [ "$SBSHELL_SAVE_MWE_VERSION" != "" ] ; then
    export MWE_VERSION=$SBSHELL_SAVE_MWE_VERSION
    export -n SBSHELL_SAVE_MWE_VERSION
fi

if [ "$SBSHELL_SAVE_MWE_PATH_VERSION" != "" ] ; then
    export MWE_PATH_VERSION=$SBSHELL_SAVE_MWE_PATH_VERSION
    export -n SBSHELL_SAVE_MWE_PATH_VERSION
fi

if [ "$SBSHELL_SAVE_PATH" != "" ] ; then
    export PATH=$SBSHELL_SAVE_PATH
    export -n SBSHELL_SAVE_PATH
fi

if [ "$SBSHELL_SAVE_MANPATH" != "" ] ; then
    MANPATH=$SBSHELL_SAVE_MANPATH
    export MANPATH
    export -n SBSHELL_SAVE_MANPATH
fi

#-------#
# Emacs #
#-------#
if [ "$SBARCH" = "glnxa64" ]; then
   alias e="echo e alias has been removed, please use sbe command. See SBTools NEWS."
fi

#####################################################################
# Determine if are in a normal xterm that supports escape sequences #
#####################################################################

inXterm=0
tty -s
if [ $? -eq 0 ] ; then
    if [ "$TERM" != "" ] ; then
        # Linux virtual consoles set $TERM to 'linux'
        if [ "$TERM" != "dumb" -a "$TERM" != "linux" ] ; then
            if [ "$EMACS" != "t" ] ; then
                inXterm=1
            fi
        fi
    fi
fi

##########################################################
# Make ls produce colors if in a normal xterm or similar #
##########################################################
if [ $inXterm -ne 0 ] && [ "$SBARCH" = "glnx86" -o "$SBARCH" = "glnxa64" ] ; then
    alias ls="ls -F --color=auto"
else
    alias ls="ls -F"
fi


##########################
# xterm prompt and title #
##########################

if [ "$SBSHELL_SHORT_ROOT" != "" ] ; then
    _mwi="(mwe:$SBSHELL_SHORT_ROOT)"
else
    _mwi=""
fi

# bash shells support escapes, etc. (bash shells set BASH variable)
# In Debian 6, /bin/sh is a inferior shell, called dash that doesn't
# support escapes, etc.
#
if [ "$BASH" != "" ] ; then
    case "$inXterm","$TERM" in
        # Emacs's built-in terminal emulator sets the TERM environment variable
        # to either 'eterm' or 'eterm-color'.
        # It can handle the escape sequences for colored text
        # (so colorized output from 'ls' works),
        # but it cannot handle the escape sequences which set window title.
        0,*|1,eterm*)
            PROMPT_COMMAND=
            ;;
        1,*)
            PROMPT_COMMAND='echo -ne "\033]0;'${_mwi}'${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
            ;;
    esac

    # PS1='[\u@\h:\w] ...\n'$_mwi'\$ '
elif [ "$USER" = "root" ] ; then
    # PS1="[$USER@$HOST] # "
else
    # PS1="[$USER@$HOST] $ "
fi
# Actually don't, I like my zsh prompt
# export PS1

#########
# umask #
#########
umask 022

##################################################
# Directory tab completion, e.g. enable $d/<TAB> #
##################################################
# See http://askubuntu.com/questions/41891/bash-auto-complete-for-environment-variables
# Pipe error message to /dev/null when running bash older than 4.2
# shopt -s direxpand 1>/dev/null 2>&1

#################
# other aliases #
#################
# We no longer put /mathworks/hub/share/bin on the path, so we will alias 'ext'
# to 'sbext' to replace that functionality.
alias ext=sbext

#---------#
# cleanup #
#---------#
unset inXterm
unset _mwi

unset sbtoolsRootBashSetup

# LocalWords:  bashrc sbsetupunix glnx sb sbm sbmake gmake sbbuildit sbshell
# LocalWords:  gentoo debian skel arnold jaadm awk sbsrc MWE SBARCH sbarch usr
# LocalWords:  sbin tmwlocation LOGNAME rsh'ing whoami jobarchive ssd MANPATH
# LocalWords:  manpath unsetenv el emacsclient emacswiki
# LocalWords:  mmerge DISTCC maci tmp tty mwi mwe elif umask VNC vncserver
# LocalWords:  alwaysshared unsetmwe shopt dev subshell ENV subshell's
