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
function dcd() {
    dc -f "$1" down
}

export DOCKER_DEFAULT_PLATFORM=linux/amd64

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

alias w="wrangler"
alias tunnel="cloudflared tunnel --url $1"

source "$HOME/dotfiles/secrets.sh"
