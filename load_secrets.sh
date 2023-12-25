#!/usr/bin/env bash
secrets="$HOME/dotfiles/secrets.sh"

if [ ! -f "$secrets" ]; then
    cp "$HOME/dotfiles/secrets.example.sh" "$HOME/dotfiles/secrets.sh"
    python3 "$HOME/dotfiles/config.py"
fi

source "$secrets"
