#!/usr/bin/env bash
secrets="$HOME/dotfiles/secrets.sh"

if [ ! -f "$secrets" ]; then
    cp "$HOME/dotfiles/secrets.example.sh" "$HOME/dotfiles/secrets.sh"
fi

source "$secrets"
source "$HOME/dotfiles/utils/config.sh"
init_vars "${vars[@]}"
