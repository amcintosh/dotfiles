#!/bin/zsh

# General ZSH options.
# enable case insensitive globbing
setopt NO_CASE_GLOB

OS_NAME=$(uname -s)
OS_ARCH=$(uname -m)

BREW_PREFIX=''
if [[ "$OS_NAME" = "Darwin" && "$OS_ARCH" = "arm64" ]]; then
    BREW_PREFIX=`/opt/homebrew/bin/brew --prefix`
fi
if [[ "$OS_NAME" = "Darwin" && "$OS_ARCH" = "x86_64" ]]; then
    BREW_PREFIX=`/usr/local/bin/brew --prefix`
fi

export DOTFILES_DIR="$HOME/.dotfiles"

# Load relevant section files
for f in $DOTFILES_DIR/section/*
do
    source $f
done

# Include autosuggestsion
source $HOME/.config/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"
eval "$(thefuck --alias)"
