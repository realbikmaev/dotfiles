bind -s 'set completion-ignore-case on'
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=10000
shopt -s histappend
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
alias tmux='tmux source-file ~/.tmux.conf && tmux'
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
alias u="cd .."
alias t="sudo tmux"
alias tt="tmux"
alias uu="su - khaidar"

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

function repo() {
    mkdir "$1"
    cd "$1" || return
    git init --initial-branch=master # chaotic evil
    code .
}

dotfiles="$HOME/dotfiles"
utils="$dotfiles/utils"
source "$HOME/dotfiles/secrets.sh"
source "$utils/python.sh"
source "$utils/devops.sh"
source "$utils/rust.sh"
source "$utils/git.sh"
source "$utils/js.sh"
