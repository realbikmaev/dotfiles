#!/usr/bin/env bash
secrets="$HOME/dotfiles/secrets.sh"
source "$secrets"
source "$HOME/dotfiles/utils/config.sh"
init_vars "${vars[@]}"
