# bashrc based on the Gentoo default from.... 2005?
#
# Authors: AWC - Andy W. Cummings <cydonian.monk@gmail.com>
# Revision History:
#      2012/04/12 - Copied root default prompt.
#      2005/??/?? - Initial creation.

#if [[ $ != *i* ]]; then
#    return
#fi

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
