#!/usr/bin/env bash

# `./install.sh` to ask for secrets
# `./install.sh server` to skip asking for secrets

if [ "$1" = "server" ]; then
    cp ~/dotfiles/secrets.example.sh ~/dotfiles/secrets.sh
fi

rm -rf ~/.bashrc
rm -rf ~/.gitconfig
rm -rf ~/.bash_profile
rm -rf ~/.tmux.conf
rm -rf ~/.vimrc

platform=$(uname)
if [[ "$platform" == "Linux" ]]; then
    ln -s ~/dotfiles/.gitconfig.linux ~/.gitconfig
elif [[ "$platform" == "Darwin" ]]; then
    ln -s ~/dotfiles/.gitconfig.macos ~/.gitconfig
fi
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc ~/.vimrc
