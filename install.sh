#!/usr/bin/env bash

# `./install.sh` to skip secrets setup
# `./install.sh --secrets` to set up secrets

if [ "$1" = "--secrets" ]; then
    cp ~/dotfiles/secrets.example.sh ~/dotfiles/secrets.sh
    python3 ~/dotfiles/config.py
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
    rm -rf ~/Library/Application\ Support/Claude/claude_desktop_config.json
    ln -s ~/dotfiles/claude_desktop_config.json ~/Library/Application\ Support/Claude/claude_desktop_config.json
fi
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc ~/.vimrc
