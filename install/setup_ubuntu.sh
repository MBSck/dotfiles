#!/bin/bash
source utils.sh

check_root

dotfile_dir="$(dirname "$(dirname "$(realpath "$0")")")"
user_home=$(echo "$dotfile_dir" | cut -d'/' -f1-3)

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
install apt direnv
install apt fd-find fdfind
install apt fzf
install snap tldr
install snap dust
install apt nodejs
install apt npm
install apt perl
install apt luarocks            # Neovim dependency
install apt-get xorg            # Neovim keybaord copying
install apt-get xclip           # Neovim keybaord copying
install apt-get ruby-full ruby
install apt-get ripgrep rg
install apt-get neovim nvim

# TODO: Fix the curl commands
# install "curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin" kitty
# install "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh" rustup
# install "curl -LsSf https://astral.sh/uv/install.sh | sh" uv

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

# TODO: Fix this
# julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.add("LanguageServer"); Pkg.add("SymbolServer")'
# julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.update()'

remove_and_relink $dotfile_dir/git/gitconfig $user_home/.gitconfig;
remove_and_relink $dotfile_dir/zsh $user_home/zsh;
remove_and_relink $dotfile_dir/zsh/zshrc $user_home/.zshrc;
remove_and_relink $dotfile_dir/direnv $user_home/.config/direnv;
remove_and_relink $dotfile_dir/kitty $user_home/.config/kitty;
remove_and_relink $dotfile_dir/kitty/logo /usr/lib/kitty/logo;
remove_and_relink $dotfile_dir/btop $user_home/.config/btop;
remove_and_relink $dotfile_dir/bat $user_home/.config/bat;
batcat cache -build > /dev/null 2>&1

# NOTE: With this the default terminal of Ubuntu can be changed to kitty
# sudo update-alternatives --config x-terminal-emulator
# <<< Configuration <<<
