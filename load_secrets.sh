#!/usr/bin/env bash
secrets="$HOME/dotfiles/secrets.sh"

if [ -f "$secrets" ]; then
    source "$secrets"
fi
