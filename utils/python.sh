export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"

eval "$(pyenv init --no-rehash --path)"
if which pyenv-virtualenv-init >/dev/null; then eval "$(pyenv virtualenv-init -)"; fi
alias p="python"
alias pv="pyenv"
alias pr="python -m $1"
alias pm="python -m app.main"
alias pt="python -m app.test"
alias pi="pip install $1"
alias pu="pip install -U $1"
alias pui="pip uninstall -y $1"

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
