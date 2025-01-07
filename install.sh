#!/usr/bin/env bash

OS_NAME=$(uname -s)
OS_ARCH=$(uname -m)
SYSTEM_NAME=$(uname -n)

if [[ $OS_NAME == "Linux" ]] && [[ $SYSTEM_NAME == codespaces-* ]] ;
then
    echo "Setting up for github codespaces"
    cp .bashrc.codespaces ~/.bashrc
    cp .bash_aliases ~/.bash_aliases
    cp .vimrc ~/.vimrc
    cp -r .vim ~/.vim

    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

    source ~/.bashrc;
    exit 0
fi

echo "Setting up for local machine"
