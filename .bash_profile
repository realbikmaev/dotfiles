platform=$(uname)

if [[ "$platform" == "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi
