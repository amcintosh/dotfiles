# Set path for homebrew binaries
if [[ -n "$BREW_PREFIX" ]]; then
    PATH="$BREW_PREFIX/sbin:$BREW_PREFIX/bin:$PATH"
fi

# Python in homebrew
if [[ -d "$BREW_PREFIX/opt/python/libexec/bin" ]]; then
    PATH="$BREW_PREFIX/opt/python/libexec/bin:$PATH"
fi

# Binaries in home directory
if [[ -d "$HOME/bin" ]]; then
    PATH="$HOME/bin:$PATH"
fi

# Custom CLI tools
PATH="$PATH:$HOME/.dotfiles/bin"

export PATH
