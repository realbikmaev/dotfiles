export NVM_DIR="$HOME/.nvm"
if [[ "$platform" == 'Linux' ]]; then
    function nvm() {
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
        nvm "$@"
    }

    function npm() {
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
        npm "$@"
    }

elif [[ "$platform" == 'Darwin' ]]; then
    function nvm() {
        [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
        [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
        nvm "$@"
    }

    function npm() {
        [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
        [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
        npm "$@"
    }
fi

alias sr="npm run dev -- --open"
alias sd="ENVIRONMENT=dev npm run dev"
alias sp="npm run build && ENVIRONMENT=dev npm run preview"
alias sprod="npm run build && node build"
