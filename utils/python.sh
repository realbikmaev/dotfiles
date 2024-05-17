export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# export platform=$(uname)

if [ "$platform" == "Linux" ]; then
    if command -v pyenv >/dev/null 2>&1; then
        eval "$(pyenv init --no-rehash --path)" >/dev/null 2>&1
    fi
elif [ "$platform" == "Darwin" ]; then
    if [ -f "/Users/bikmaev/.pyenv/bin/pyenv" ]; then
        # echo "local"
        eval "$(/Users/bikmaev/.pyenv/bin/pyenv init - --no-rehash)" 2>/dev/null
    else
        if command -v pyenv >/dev/null 2>&1; then
            # echo "global"
            eval "$(pyenv init --no-rehash --path)" >/dev/null 2>&1
        else
            # echo "homebrew"
            eval "$(/opt/homebrew/bin/pyenv init - --no-rehash)" 2>/dev/null
        fi
    fi
fi

if which pyenv-virtualenv-init >/dev/null 2>&1; then
    eval "$(pyenv virtualenv-init -)" 2>/dev/null
fi

alias p="python3"
alias pv="pyenv"
alias pr="python3 -m $1"
alias pm="python3 -m app.main"
# alias pt="python3 -m app.test"
alias pt="pytest"
alias pp="pytest -v -k $1"
alias pc="pre-commit"
alias pca="pre-commit run --all-files"
alias pip="pip3"
alias pi="pip3 install $1"
alias pu="pip3 install -U $1"
alias pui="pip3 uninstall -y $1"

alias wt="watchexec -r -w \".\" \"pytest -v\""
alias wk="watchexec -r -w \".\" \"pytest -v -k $1\""
alias wr="watchexec -r -w \".\" \"python3 -m $1\""
alias we="watchexec -r -c -i \"runtime.py\" -w \".\" \"python3 -m $1\""

# remember that poetry is installed via pipx
# TODO: add installation of poetry, pyenv, and pipx to setup.sh
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

function venvs {
    pyenv virtualenvs
}

function bb() {
    ruff format --line-length 78 .
    # black -l 78 .
}

alias cov="open ./htmlcov/index.html"

# inbred python's long lost cousin
alias j="julia"
alias ju="juliaup"
alias pluto="j -e 'import Pluto; Pluto.run()'"
alias jr="watchexec -r -w \"./src\" \"julia $1\""
