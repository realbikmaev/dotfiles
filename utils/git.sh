get_commit() {
    local count=$1
    local commit_hash=$(git log --skip="$count" -n 1 --pretty=format:%H)
    local pink_color="\e[38;2;214;51;184m"
    local reset_color="\e[0m"

    if [ -n "$commit_hash" ]; then
        commit_message=$(git log --skip="$count" -n 1 --pretty=format:%B)
        commit_diff=$(git diff --color=always "$commit_hash"~1 "$commit_hash")
        echo -e "${pink_color}message:${reset_color}"
        echo "$commit_message"
        echo -e "${pink_color}diff:${reset_color}"
        echo -e "$commit_diff"
    else
        echo "no such commit, oh no!"
    fi
}

function gc {
    get_commit "$1"
}

function git_proxy {
    git config --global http.proxy "$1"
}

alias gg="git add . && git commit -m 'asdf'"
alias gp="git add . && git commit -m 'asdf' && git push"
alias ggg="git add . && git commit -m $1"
