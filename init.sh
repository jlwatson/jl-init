#!/bin/bash

# Anything that needs sudo goes in here
if [ $UID -eq 0 ]; then

    # Useful installs
    apt install -y git tmux zsh

    exec su "$SUDO_USER" "$0" -- "$@"
fi

# Set up zsh
cp .zshrc $HOME
chsh -s $(which zsh)

# Set up vim
cp .vimrc $HOME
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

# Set up SSH key and git
mkdir -p $HOME/.ssh
ssh-keygen -t rsa -b 4096 -C "notmyemail@fake.com" -f $HOME/.ssh/id_rsa
eval "$(ssh-agent -s)"
ssh-add $HOME/.ssh/id_rsa
curl -u "jlwatson" --data "{\"title\":\"VM_`date +%Y%m%d%H%M%S`\",\"key\":\"`cat $HOME/.ssh/id_rsa.pub`\"}" https://api.github.com/user/keys

git config --global core.editor "vim"
