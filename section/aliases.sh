# My usual 'ls' alias
if [[ "$OS_NAME" = "Darwin" ]]; then
    alias ls='ls -G'
    alias lsl='ls -lGho'
else
    alias ls='ls --color=auto'
    alias lsl='ls --color=auto -lho'
fi

alias df='df -h'

#Some helpful stuff
alias more='less'
alias ping='ping -c 5'

if [[ "$OS_NAME" =  "Darwin" ]]; then
    # OSX quicklook
    alias look="qlmanage -p"
fi
