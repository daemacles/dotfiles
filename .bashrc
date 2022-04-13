# /etc/skel/.bashrc:
# $Header: /var/cvsroot/gentoo-x86/app-shells/bash/files/dot-bashrc,v 1.3 2005/07/06 22:10:22 vapier Exp $
# 
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]; then
	# Shell is non-interactive.  Be done now
	return
fi

# Shell is interactive.  It is okay to produce output at this point,
# though this example doesn't produce any.  Do setup for
# command-line interactivity.

# Change the window title of X terminals 
case $TERM in
	xterm*|rxvt*|Eterm)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
		;;
	screen)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
		;;
esac

# uncomment the following to activate bash-completion:
#[ -f /etc/profile.d/bash-completion ] && source /etc/profile.d/bash-completion

alias ls="ls -F --color"

[[ $- == *i* ]] && . ~/git-prompt.sh
source ~/git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=1

function prompt
{
local BLUE="\[\033[1;32m\]"
local GRAY="\[\033[1;30m\]"
local GREEN="\[\033[1;34m\]"
local WHITE="\[\033[1;37m\]"
local LGRAY="\[\033[0;37m\]"
local RED="\[\033[1;31m\]"
local RESET="\[\033[0m\]"
PRE_PS1="${GRAY}[${BLUE}${USER}${GRAY}@${GREEN}${HOSTNAME}${GRAY}]${RESET}"
PROMPT_COMMAND='__git_ps1 "$PRE_PS1\[\033[1;37m\] ${PWD/$HOME/~}/\n" "\$ \[\033[0m\]"'
#PS1="$GRAY[$BLUE\u$GRAY@$GREEN\h$GRAY] $WHITE\w/\n${WHITE}>$LGRAY "
# if [[ -n "$SSH_CLIENT" ]]
# then
# PROMPT_COMMAND='$GRAY[$BLUE\u$GRAY@$GREEN\h$GRAY] $WHITE\w/\n${WHITE}>$LGRAY'
# #	PS1="SSH $PS1"
# fi
}
prompt

function cless () {
    pygmentize -f terminal "$1" | less -R
}

PATH=/usr/local/bin:/usr/local/opt/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH

keychain -q id_rsa
. ~/.keychain/$HOSTNAME-sh

alias newcpp="git clone git@github.com:daemacles/cpp-project-template.git"

export EDITOR='nvim'

# Set 4:3 aspect ratio for Wacom to left edge of screen
#xsetwacom --set 8 MapToOutput "1920x1440+0+0"
#xsetwacom --set 12 MapToOutput "1920x1440+0+0"
#xsetwacom --set 13 MapToOutput "1920x1440+0+0"

# Kernel improvements
#if [ "$PS1" ] ; then
#	mkdir -p -m 0700 /dev/cgroup/cpu/user/$$ > /dev/null 2>&1
#	echo $$ > /dev/cgroup/cpu/user/$$/tasks
#	echo "1" > /dev/cgroup/cpu/user/$$/notify_on_release
#fi

export GTAGSFORCECPP=1

## Source host specific config
HOSTCONFIG=$HOME/.bashrc.`hostname`
if [ -f $HOSTCONFIG ]
then
    echo "Sourcing local config $HOSTCONFIG"
    source $HOSTCONFIG
fi

export FZF_DEFAULT_COMMAND='ag -g ""'

. "$HOME/.cargo/env"
export DOCKER_HOST=unix:///run/user/1000/docker.sock
