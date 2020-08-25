#!/bin/bash

# Install useful libraries
apt install -y git tmux

# Set up terminal
apt install -y zsh
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
