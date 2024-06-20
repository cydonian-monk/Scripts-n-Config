# /etc/skel/.bashrc
#
# bashrc based on the Gentoo default from.... 2005?
#
# Contributor(s): AWC - Andy W. Cummings <cydonian.monk@gmail.com>
# Revision History:
#        2005/??/?? - Initial creation.
#        2012/04/12 - Copied root default prompt.
#        2012/06/05 awc Merged with Gentoo in .skel.	 
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

alias ls="ls -a --color=auto"
alias l="ls -la --color=no"
export PS1='\[\033[01;32m\]\u \[\033[01;34m\]\W: \[\033[00m\]'
#export PS1='\[\033[01;31m\]\h \[\033[01;34m\]\W # \[\033[00m\]'

case $TERM in
    xterm*|rxvt*|Eterm)
	PROMPT_COMMAND='echo -ne "\033]0;${USER}:${PWD/$HOME/~}\007"'
	;;
    screen)
	PROMPT_COMMAND='echo -ne "\033_${USER}:${PWD/$HOME/~}\033\\"'
	;;
esac
[ -f /etc/profile.d/bash-completion ] && source /etc/profile.d/bash-completion
