#!/bin/bash
time::clock() {
    [ -z "$ts" ] && {
        ts=$(date +%s%N)
        return
    } || te=$(date +%s%N)
    printf "%6.4f" "$(echo $((te - ts))/1000000000 | bc -l)"
    unset ts te
}
# time::clock
bind -s 'set completion-ignore-case on'
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=10000
export BASH_SILENCE_DEPRECATION_WARNING=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1
platform=$(uname)
export platform
dotfiles="$HOME/dotfiles"
utils="$dotfiles/utils"
source "$dotfiles/load_secrets.sh"
export EDITOR=hx

alias prod="ENVIRONMENT=prod env=prod $1"
alias dev="ENVIRONMENT=dev env=dev $1"
alias cp='cp -Rv'
alias ll="ls -lahtrFG"
alias ls="ls -lahFG"
alias zz="code ~/.bashrc"
alias zzz="code ~/dotfiles"
alias ss="code ~/dotfiles/secrets.sh"
alias ec="echo $?"
alias kh="code $HOME/.ssh/known_hosts"
function hi() {
    if [[ -z "$1" ]]; then
        history 20
    elif [[ "$1" =~ ^[0-9]+$ ]]; then
        history "$1"
    else
        history | grep "$1"
    fi
}
alias h="history | less"
alias v="vim"
alias n="nvim"
alias vsc="code ~/Library/Application\ Support/Code/User/settings.json"

if [[ "$TMUX_AS_SUDO" == "true" ]]; then
    alias t="sudo -u khaidar tmux"
else
    alias t="tmux"
fi

function tn() {
    local session_name="$1"
    t new-session -n "$session_name" -s "$session_name"
}
function ta() {
    if [ -n "$1" ]; then
        tmux attach-session -t "$1"
    else
        local session_name="$(tmux list-sessions -F "#{session_name}" | sort | tail -n 1)"
        tmux attach-session -t "$session_name"
    fi
}
alias tl="t list-sessions"
alias ts="t attach-session -t $1"
alias tk="t kill-session -t $1"
alias tc="t source-file ~/.tmux.conf"
export PS1='\[\e[38;5;211m\]\u\[\e[38;5;220m\]@\[\e[38;5;79m\]\H \[\e[38;5;177m\]\w \[\e[0m\]\$ '

alias s="source ~/.bashrc"

function b {
    bash "$1.sh"
}

function work {
    cd "$HOME/Work" || return
}

function venv {
    activate_script=$(python3 "$dotfiles/activate.py")
    echo "$activate_script"
    source "$activate_script"
}

function cd() {
    if [ $# -eq 0 ]; then
        builtin cd ~ || return
    else
        builtin cd "$1" || return
    fi

    if [ -e ".python-version" ]; then
        venv
    fi

    ls
}

function u {
    local count=$1
    if [ -z "${count}" ]; then
        count=1
    fi
    local path=""
    for i in $(seq 1 "${count}"); do
        path="${path}../"
    done
    cd $path || return
}

function repo() {
    mkdir "$1"
    cd "$1" || return
    git init --initial-branch=master # chaotic evil
    touch README.md
    code .
}

function del {
    rm -rf "$1"
}

function dot-remote() {
    user="$1"
    host="$2"
    port="$3"

    if [ -z "$port" ]; then
        port=22
    fi

    rsync -av \
        --exclude='.git/' \
        --exclude='secrets.sh' \
        -e "ssh -p $port -2" \
        "$dotfiles/" \
        "$user@$host:/home/$user/dotfiles"
}

function dot-scp {
    user="$1"
    host="$2"
    port="$3"

    if [ -z "$port" ]; then
        port=22
    fi

    # redirect its stdout into this script's stdout
    python3 "$dotfiles/scp.py" "$user" "$host" "$port"
}

function exe() {
    touch "$1"
    chmod +x "$1"
    code "$1"
}

function r() {
    if [[ "$1" == *.py ]]; then
        python3.10 "$1"
    elif [[ "$1" == *.ts ]]; then
        bun run "$1"
    elif [[ "$1" == *.js ]]; then
        bun run "$1"
    elif [[ "$1" == *.sh ]]; then
        bash "$1"
    elif [[ "$1" == *.cpp ]]; then
        # ./example.cpp to ./example
        clang++ -std=c++11 -stdlib=libc++ -o "${1%.*}" "$1" && ./"${1%.*}"
    elif [[ "$1" == *.c ]]; then
        clang -std=c99 -o "${1%.*}" "$1" && ./"${1%.*}"
    elif [[ "$1" == *.rs ]]; then
        rustc "$1" && ./"${1%.*}"
    else
        echo "unknown file type"
    fi
}

function kill_port {
    lsof -ti ":$1" | xargs kill -9
}

source "$utils/python.sh"
source "$utils/devops.sh"
source "$utils/rust.sh"
source "$utils/git.sh"
source "$utils/js.sh"
# echo "loaded in $(time::clock) seconds"
eval "$(/Users/bikmaev/.local/bin/mise activate bash)"
