#!/bin/bash
# DISCLAIMER: This script needs to be executed from the dotfiles repository
# Check if the script is being run as root, if not, ask for sudo
if [ "$(id -u)" -ne 0 ]; then
    echo "This script requires sudo privileges. Please run it with sudo."
    exit 1
fi

# >>> Functions >>>
function make_dir() {
  if [ ! -d $1 ]; then
    echo "Directory $1 does not exist. Creating it now."
    mkdir -p $1
  fi
}

function check_install() {
  printf -v line '%*s' 50 ''
  line=${line// /-}
  echo "$line"

  if command -v $1 >/dev/null 2>&1; then
    echo "$1 is already installed."
    return 1
  else
    echo "Installing $1...";
    return 0
  fi
}

add_repository() {
  if ! grep -q "$1" /etc/apt/sources.list.d/*; then
    echo "Repository $1 not found. Adding it..."
    add-apt-repository "$1" -y
  else
    echo "Repository $1 is already added."
  fi
}

function install() {
  installer=$1
  if [[ "$installer" == *"apt"* || "$installer" == *"snap"*  || "$installer" == *"cargo"* ]]; then
    installer="$1 install"
  fi

  check_install $2
  additional_args="$*"
  $installer $2 $additional_args -y
}

function command_install() {
  # TODO: Check if this works
  check_install $2 && $1
}

function get_nerdfont() {
  make_dir "$HOME/.fonts"
  if [ -z "$(find "$HOME/.fonts" -iname "*$1*")" ]; then
    # TODO: Make sure the right version is gotten
    wget -P "$HOME/.fonts" /https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/$1.zip
  else
    echo "$1 already exists in fonts."
  fi
}
# <<< Functions <<<

# >>> Installation >>>
# apt update && apt upgrade

echo "Adding repositories..."
add_repository ppa:neovim-ppa/unstable
apt-get update

# TODO: Debug this -> Somewhere it doesn't work
echo "Installing programs..."
install "apt-get" g++                 # Neovim dependency
install apt build-essential           # Lua dependency
install apt libreadline-dev           # Lua dependeny
install apt unzip                     # Lua dependency
install apt libssl-dev                # Lua dependency
install apt luarocks                  # Neovim dependency
install apt curl
install apt fd-find
install apt fzf
install snap tldr
install snap dust
install "apt-get" neovim
command_install "curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin" kitty
command_install "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh" rustup
command_install "curl -LsSf https://astral.sh/uv/install.sh | sh" uv
install cargo rnr
install snap tldr
install snap btop
install snap obsidian --classic
# get_nerdfont Iosevka

# <<< Installation <<<

# >>> SymLinking >>>
make_dir "$HOME/.local/bin"
# TODO: Make this symlink work
# ln -s /usr/bin/batcat ~/.local/bin/bat
# <<< SymLinking <<<

# >>> Configuration >>>
if [[ "$SHELL" != "/bin/zsh" ]]; then
  echo "Changing shell to zsh..."
  chsh -s /bin/zsh
else
  echo "Shell is already zsh."
fi
# <<< Configuration <<<
