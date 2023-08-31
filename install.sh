platform=$(uname)

# if [[ "$platform" == "Darwin" ]]; then
#
if [[ "$platform" == "Linux" ]]; then
    sudo rm -rf /var/lib/apt/lists
    sudo apt update -y
    sudo apt upgrade -y
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
