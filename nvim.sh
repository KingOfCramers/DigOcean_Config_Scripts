#!/bin/bash

if [[ $EUID -eq 0 ]]; then
   echo "This script should not run as root" 
   exit 1
fi

# Set default shell to bash
sudo chsh -s /bin/bash

# Install Neovim
sudo apt update
sudo apt install neovim -y

# Configure Neovim to use .vimrc file
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim

# Tell 

# Let NVIM and VIM share configuration files
echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" >> ~/.config/nvim/init.vim
echo "let &packpath=&runtimepath" >> ~/.config/nvim/init.vim
echo "source ~/.vimrc" >> ~/.config/nvim/init.vim

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Move .vimrc file to correct location
mv ./reference/.vimrc ~/.vimrc
