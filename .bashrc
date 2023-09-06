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
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export platform=$(uname)
dotfiles="$HOME/dotfiles"
utils="$dotfiles/utils"
source "$dotfiles/load_secrets.sh"

alias prod="ENVIRONMENT=prod env=prod $1"
alias dev="ENVIRONMENT=dev env=dev $1"
alias cp='cp -Rv'
alias ll="ls -lahtrFG"
alias ls="ls -lahFG"
alias zz="code ~/.bashrc"
alias ss="code ~/dotfiles/secrets.sh"
alias ec="echo $?"
alias kh="code $HOME/.ssh/known_hosts"
alias hi="history | grep $1"
alias h="history | less"
alias v="vim"

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
    local session_name="$(tmux list-sessions -F "#{session_name}" | sort | tail -n 1)"
    t attach-session -t "$session_name"
}
alias tl="t list-sessions"
alias ts="t attach-session -t $1"
alias tk="t kill-session -t $1"
alias z="zellij"
alias zls="zellij list-sessions"

export PS1='\[\e[38;5;211m\]\u\[\e[38;5;220m\]@\[\e[38;5;79m\]\H \[\e[38;5;177m\]\w \[\e[0m\]\$ '

function b {
    bash "$1.sh"
}

function cd() {
    if [ $# -eq 0 ]; then
        builtin cd ~ || return
    else
        builtin cd "$1" || return
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
    code .
}

function secrets() {
    cp "$dotfiles/secrets.example.sh" "$dotfiles/secrets.sh"
}

source "$utils/python.sh"
source "$utils/devops.sh"
source "$utils/rust.sh"
source "$utils/git.sh"
source "$utils/js.sh"
# echo "loaded in $(time::clock) seconds"
