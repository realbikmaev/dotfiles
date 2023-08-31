platform=$(uname)

if [[ "$platform" == "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    source ~/.orbstack/shell/init.zsh 2>/dev/null || :
fi

if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi
