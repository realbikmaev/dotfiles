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
fi

rm -rf ~/.bashrc
rm -rf ~/.gitconfig
rm -rf ~/.bash_profile
rm -rf ~/.tmux.conf
rm -rf ~/.vimrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc ~/.vimrc
