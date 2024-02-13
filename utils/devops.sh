alias docker="sudo docker"
alias dc="docker-compose"
alias dkc="docker ps | awk '{print $1}' | xargs docker kill"

function dcu() {
    if [ -z "$1" ]; then
        file="./docker-compose.yml"
    else
        file="$1"
    fi
    echo "$file"
    dc -f "$file" up --build
}

function dcud() {
    if [ -z "$1" ]; then
        file="./docker-compose.yml"
    else
        file="$1"
    fi
    echo "$file"
    dc -f "$file" up --build -d --remove-orphans
}

function dcd() {
    dc -f "$1" down
}

export DOCKER_DEFAULT_PLATFORM=linux/amd64

function w() {
    bash -i -c "watchexec -r \"$1\""
}
alias we="watchexec"

alias tf="terraform"
alias tfi="terraform init"
alias tfiu="terraform init -upgrade"
alias tfp="terraform plan -out=terraform.tfplan"
alias tfa="terraform apply terraform.tfplan"
alias tfs="terraform show terraform.tfstate"
alias tfd="terraform destroy"
alias tfpa="tfp && tfa"

alias f="flyctl"
alias ff="flyctl logs"
alias fp="flyctl machine api-proxy"
alias dd="flyctl deploy --strategy=immediate --detach"

alias wr="wrangler"
alias tunnel="cloudflared tunnel --url $1"

if [[ "$platform" == "Linux" ]]; then
    export FLYCTL_INSTALL="/home/khaidar/.fly"
    export PATH="$FLYCTL_INSTALL/bin:$PATH"
fi

if [[ "$platform" == "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    source ~/.orbstack/shell/init.zsh 2>/dev/null || :
fi

eval "$(direnv hook bash)"
export FLY_API_TOKEN="$FLY_API_TOKEN"
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export UBUNTU="/Users/bikmaev/OrbStack/ubuntu/home/bikmaev"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

alias cm="git commit -m $1"
