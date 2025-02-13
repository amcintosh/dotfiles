# Set path for homebrew binaries
if [[ -n "$BREW_PREFIX" ]]; then
    PATH="$BREW_PREFIX/sbin:$BREW_PREFIX/bin:$PATH"
fi

# Python in homebrew
if [[ -d "$BREW_PREFIX/opt/python/libexec/bin" ]]; then
    PATH="$BREW_PREFIX/opt/python/libexec/bin:$PATH"
fi

# nvm in homebrew
if [[ -d "$BREW_PREFIX/opt/nvm" ]]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$BREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$BREW_PREFIX/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "$BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

# Ruby in homebrew
if [[ -d "$BREW_PREFIX/opt/ruby/bin" ]]; then
    PATH="$BREW_PREFIX/opt/ruby/bin:$PATH"
    GEM_DIR=`gem environment gemdir`
    PATH="$GEM_DIR/bin:$PATH"
fi

# Rancher Desktop
if [[ -d "$HOME/.rd/bin" ]]; then
    PATH="$HOME/.rd/bin:$PATH"
fi

# Binaries in home directory
if [[ -d "$HOME/bin" ]]; then
    PATH="$HOME/bin:$PATH"
fi

# Custom CLI tools
PATH="$PATH:$HOME/.dotfiles/bin"

export PATH
