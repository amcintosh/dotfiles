#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

BGreen='\e[1;32m'
BWhite='\e[1;37m'
BCyan='\e[1;36m'
BBlue='\e[1;34m'

PS1="\[$BWhite\][\[$BGreen\]\u\[$BWhite\]@\[$BGreen\]\h \[$BBlue\]\w\[$BWhite\]]\$ \[$BCyan\]"


if [ -f /etc/bash_completion ]; then
   . /etc/bash_completion
fi

export PATH=$PATH:~/bin

alias ls='ls --color=auto'
alias grep='grep --color=auto'

if [ -f ~/.bash_aliases ]; then
   . ~/.bash_aliases
fi
