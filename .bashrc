# quality of life improvements
bind -s 'set completion-ignore-case on'
HISTCONTROL=ignoreboth # ignore duplicates and commands starting with space
HISTSIZE=2000          # number of lines to keep in memory
HISTFILESIZE=4000      # number of lines to keep on disk
shopt -s histappend
export HOMEBREW_NO_AUTO_UPDATE=1
alias prod="ENVIRONMENT=prod env=prod $1"
alias dev="ENVIRONMENT=dev env=dev $1"
alias cp='cp -Rv'
alias ll="ls -lahtrF"
alias zz="code ~/.bashrc"
alias hi="history | grep $1"

function b {
    bash "$1.sh"
}

function cd() {
    builtin cd "$1" || return
    ll
}

function repo() {
    mkdir "$1"
    cd "$1" || return
    git init --initial-branch=master # chaotic evil
    code .
}

# aliases and functions
dotfiles="$HOME/dotfiles"
utils="$dotfiles/utils"

source "$utils/python.sh"
source "$utils/devops.sh"
source "$utils/rust.sh"
source "$utils/git.sh"
source "$utils/js.sh"
