# See appearance.sh for styling
# Completion confiugration
zstyle ':completion:*:*:git:*' script $DOTFILES_DIR/git_completion/git-completion.bash
fpath=($DOTFILES_DIR/git_completion $fpath)

autoload -Uz compinit && compinit

# partial completion suggestions
zstyle ':completion:*' list-suffixeszstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
