#!/usr/bin/env bash
if [ $1 == "intuit" ] || [ $1 == "work" ] ;
then
  echo "Setup 'intuit'"
  EMAIL='andrew_mcintosh@intuit.com'
  SIGNINGKEY='3C02F195081B7DC9'
else
  echo "Defaulting to 'personal'"
  EMAIL='nacho.vonkickbutt@gmail.com'
  SIGNINGKEY='267C9BAA36799D36'
fi

DOTFILES_DIR="$HOME/.dotfiles"

OS_NAME=$(uname -s)
SYSTEM_NAME=$(uname -n)

if [[ $OS_NAME == "Linux" ]] && [[ $SYSTEM_NAME == codespaces-* ]] ;
then
    echo "Setting up for github codespaces"
    cp bashrc.codespaces $HOME/.bashrc
    cp bash_aliases $HOME/.bash_aliases
    cp app_config/vimrc $HOME/.vimrc
    cp -r app_config/vim $HOME/.vim

    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

    source ~/.bashrc;
    exit 0
fi

echo "Setting up for local machine"

##
# Setup old bash things
##

! [ -f $HOME/.bash_profile.bak ] && \
    cp $HOME/.bash_profile $HOME/.bash_profile.bak && \
    echo 'Backed up bash_profile to bash_profile.bak'

if [[ $OS_NAME == "Darwin" ]] ;
then
    cp bash_profile.mac $HOME/.bash_profile
    cp bash_aliases $HOME/.bash_aliases
fi

if [[ $OS_NAME == "Linux" ]] ;
then
    cp bashrc.ubuntu $HOME/.bashrc
    cp bash_aliases $HOME/.bash_aliases
fi

##
# Setup zsh
##

rm $HOME/.zshrc
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc

# Git config
cp $DOTFILES_DIR/config/gitconfig.tmpl $DOTFILES_DIR/config/gitconfig
if [[ $OS_NAME == "Darwin" ]] ;
then
    sed -i '' "s/EMAIL/$EMAIL/g" "$DOTFILES_DIR/config/gitconfig"
    sed -i '' "s/SIGNINGKEY/$SIGNINGKEY/g" "$DOTFILES_DIR/config/gitconfig"
else
    sed -i "s/EMAIL/$EMAIL/g" "$DOTFILES_DIR/config/gitconfig"
    sed -i "s/SIGNINGKEY/$SIGNINGKEY/g" "$DOTFILES_DIR/config/gitconfig"
fi
mkdir -p git_completion
curl -o git_completion/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o git_completion/_git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh


for file in $HOME/.dotfiles/config/*
do
    basefile=`basename $file`
    if [ -f "$HOME/.$basefile" ];
    then
        ! [ -f "$HOME/.$basefile.bak" ] && \
            cp "$HOME/.$basefile" "$HOME/.$basefile.bak" && \
            echo "Backed up existing .$basefile to .$basefile.bak"
    fi
    if ! [ "$file" == '.' ] && ! [ "$file" == '..' ] && ! [[ "$file" == *.tmpl ]]; then
        rm "$HOME/.$basefile"
        ln -s $file "$HOME/.$basefile"
        echo " - Linked $basefile"
    fi
done

# Create ~/.config as a few things will end up there.
mkdir -p $HOME/.config

# Clone zsh autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions $HOME/.config/zsh-autosuggestions


##
# Install other config files that don't just live in ~/
##

# vim
ln -s "$DOTFILES_DIR/app_config/vimrc" "$HOME/.vimrc"
ln -s "$DOTFILES_DIR/app_config/vim" "$HOME/.vim"

# ssh config
if [ -f "$HOME/.ssh/config" ];
then
    cp "$HOME/.ssh/config" "$HOME/.ssh/config.bak"
    echo "Backed up existing ssh/config file."
fi
rm "$HOME/ssh/config"
ln -s "$DOTFILES_DIR/app_config/ssh" "$HOME/.ssh/config"
echo " - Linked ~/.ssh/config"

# starship
ln -s "$DOTFILES_DIR/app_config/starship.toml" "$HOME/.config/starship.toml"
echo " - Linked ~/.config/starship.toml"
