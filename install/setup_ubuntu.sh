#!/bin/bash
source utils.sh

check_root

dotfile_dir="$(dirname "$(dirname "$(realpath "$0")")")"

# >>> Installation >>>
hline
echo "Updating programs..."
hline
apt update -y
apt upgrade -y

# echo "Adding repositories..."
# add_repository ppa:neovim-ppa/unstable
# apt-get update

# TODO: Debug this (make everything work)
hline
echo "Installing..."
hline
install "apt-get" g++                 # Neovim dependency
# TODO: Check what name these have when installed
# install apt build-essential     # Lua dependency
# install apt libreadline-dev     # Lua dependeny
# install apt libssl-dev          # Lua dependency
install apt unzip               # Lua dependency
install apt curl
install apt fd-find fdfind
install apt fzf
install snap tldr
install snap dust
install apt nodejs
install apt npm
install apt perl
install apt luarocks            # Neovim dependency
install apt-get xclip           # Neovim keybaord copying
install apt-get ruby-full ruby
install apt-get ripgrep rg
install apt-get neovim nvim

# TODO: Fix the curl commands
# install "curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin" kitty
# install "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh" rustup
# command_install "curl -LsSf https://astral.sh/uv/install.sh | sh" uv

# TODO: Fix the cargo command somehow, too
# install cargo rnr
install snap tldr
install snap btop
# install snap "obsidian --classic"
# get_nerdfont Iosevka
# <<< Installation <<<

# >>> Configuration >>>
hline
echo "Configuring..."
hline
# make_dir "$HOME/.local/bin"
# TODO: Write a script that checks if these are installed
# npm install -g neovim
# gem install neovim
# cpanm -n Neovim:Ext

# if [[ "$SHELL" != "/bin/zsh" ]]; then
#   echo "Changing shell to zsh..."
#   chsh -s /bin/zsh
# else
#   echo "Shell is already zsh."
# fi

remove_and_relink $dotfile_dir/git/gitconfig $HOME/.gitconfig;
remove_and_relink $dotfile_dir/zsh $HOME/zsh;
remove_and_relink $dotfile_dir/zsh/zshrc $HOME/.zshrc;
remove_and_relink $dotfile_dir/kitty $HOME/.config/kitty;
remove_and_relink $dotfile_dir/btop $HOME/.config/btop;
remove_and_relink $dotfile_dir/bat $HOME/.config/bat;
# <<< Configuration <<<
