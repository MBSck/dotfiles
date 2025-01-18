#!/bin/bash
source utils.sh

check_root

# >>> Installation >>>
# apt update && apt upgrade

# echo "Adding repositories..."
# add_repository ppa:neovim-ppa/unstable
# apt-get update

# TODO: Debug this -> Somewhere it doesn't work
echo "Installing programs..."
install "apt-get" g++                 # Neovim dependency
# TODO: Check what name these have when installed
# install apt build-essential           # Lua dependency
# install apt libreadline-dev           # Lua dependeny
# install apt libssl-dev                # Lua dependency
install apt unzip                     # Lua dependency
install apt luarocks                  # Neovim dependency
install apt curl
install apt fd-find fdfind
install apt fzf
install snap tldr
install snap dust
install apt nodejs
install apt npm
install apt perl
install apt "rubygems -y"
install "apt-get" ripgrep
install "apt-get" neovim nvim
# TODO: Fix the curl commands
# command_install "curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin" kitty
# command_install "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh" rustup
# command_install "curl -LsSf https://astral.sh/uv/install.sh | sh" uv
# TODO: Fix the cargo command somehow, too
install cargo rnr
install snap tldr
install snap btop
install snap "obsidian --classic"
# get_nerdfont Iosevka
# <<< Installation <<<

# >>> Configuration >>>
# make_dir "$HOME/.local/bin"
# TODO: Make this symlink work
# ln -s /usr/bin/batcat ~/.local/bin/bat
# if [[ "$SHELL" != "/bin/zsh" ]]; then
#   echo "Changing shell to zsh..."
#   chsh -s /bin/zsh
# else
#   echo "Shell is already zsh."
# fi
# <<< Configuration <<<
