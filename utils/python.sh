export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"

if [ "$platform" == "linux" ]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init --no-rehash --path)"
elif [ "$platform" == "Darwin" ]; then
    eval "$(/opt/homebrew/bin/pyenv init - --no-rehash)"
fi

if which pyenv-virtualenv-init >/dev/null 2>&1; then eval "$(pyenv virtualenv-init -)"; fi

alias p="python3"
alias pv="pyenv"
alias pr="python3 -m $1"
alias pm="python3 -m app.main"
alias pt="python3 -m app.test"
alias pi="pip3 install $1"
alias pu="pip3 install -U $1"
alias pui="pip3 uninstall -y $1"

alias pp="poetry"
alias ppa="poetry add $1"
alias ppd="poetry add --dev $1"
alias ppr="poetry remove $1"
alias ppi="poetry install"
alias ppu="poetry update"
# with output of tests
alias ppo="poetry run pytest -rP"
# without output of tests
alias ppt="poetry run pytest"
# bump the version number
alias ppv="poetry version $1"
# build and publish to pypi
alias ppp="poetry build && poetry publish -n"

function pvd() {
    pyenv virtualenv-delete "$1"
}

function pvn() {
    utilki venv "$1"
}

function bb() {
    black -l 78 .
}

alias cov="open ./htmlcov/index.html"

# inbred python's long lost cousin
alias j="julia"
alias ju="juliaup"
alias pluto="j -e 'import Pluto; Pluto.run()'"
