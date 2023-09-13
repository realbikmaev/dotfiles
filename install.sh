if [ "$1" == "--files-only" ]; then
    echo "skipping installation of packages..."
else
    platform=$(uname)

    utils="$HOME/dotfiles/utils"

    if [[ "$platform" == "Linux" ]]; then
        sudo rm -rf /var/lib/apt/lists
        sudo apt update -y
        sudo apt upgrade -y
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
        source "$utils/js.sh"
        nvm install --lts
        curl https://pyenv.run | bash
        source "$utils/python.sh"
        pyenv install 3.10
        pyenv global 3.10
        pip3 install utilki
        sudo apt install --yes tmux vim
        curl https://sh.rustup.rs -sSf | sh -s -- --profile complete --default-toolchain nightly --no-modify-path -y
        source "$utils/rust.sh"
        cargo install zellij
        curl -L https://fly.io/install.sh | sh
    fi
fi

rm -rf ~/.bashrc
rm -rf ~/.gitconfig
rm -rf ~/.bash_profile
rm -rf ~/.tmux.conf
rm -rf ~/.vimrc
ln -s ~/dotfiles/.bashrc ~/.bashrc

if [[ "$platform" == "Linux" ]]; then
    ln -s ~/dotfiles/.gitconfig.linux ~/.gitconfig
elif [[ "$platform" == "Darwin" ]]; then
    ln -s ~/dotfiles/.gitconfig.macos ~/.gitconfig
fi
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc ~/.vimrc
