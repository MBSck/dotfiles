#!/bin/bash
# DISCLAIMER: This script needs to starated from the dotfiles repository

# TODO: Implement a check at some point for linux installation as well
# Check the OS here (either linux or MacOs)
# if [[ "$OSTYPE" == "darwin"* ]]; then
#   installer = brew

# >>> Functions >>>
function check_install() {
  if command -v $1 >/dev/null 2>&1; then
    echo "$1 is already installed."
    return 1
  else
    echo "Installing $1...";
    return 0
  fi
}

function command_install() {
  check_install $1
  if [ $? -eq 0 ]; then
    $2
  fi
}

function brew_install() {
  check_install $1
  if [ $? -eq 0 ]; then
    brew install $1
  fi
}

remove_and_relink() {
  local new_target="$1"
  local old_path="$2"

  if [ -L "$old_path" ]; then
    rm "$old_path"
    echo "Removed symlink: $old_path"
  elif [ -e "$old_path" ]; then
    if [ -f "$old_path" ]; then
      rm "$path"
      echo "Removed file: $old_path"
    elif [ -d "$old_path" ]; then
      rm -r "$old_path"
      echo "Removed folder: $old_path"
    fi
  else
    echo "Path does not exist: $old_path"
  fi
  ln -s "$new_target" "$old_path"
  echo "Created symlink: $new_target"
}

prompt_user() {
    read -p "$1 (y/n): " choice
    case "$choice" in
        y|Y ) return 0;;
        n|N ) return 1;;
        * ) echo "Invalid choice. Please enter 'y' or 'n'."; prompt_user "$1";;
    esac
}
# <<< Functions <<<

# <<< Installation <<<
dotfile_dir=$(pwd);
cd ~;

# >>> Install programs >>>
command_install brew "/bin/bash -c '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)'"
command_install kitty "curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin"
command_install nvim "brew install neovim"
brew_install fzf
brew_install fd
brew_install tldr
brew_install btop
brew_install rnr
brew_install lazygit
brew_install atuin
brew_install dust

if prompt_user "Do you want to install all nerdfonts?"; then
  echo "Installing nerd fonts..."
  brew search '/font-.*-nerd-font/' | awk '{ print $1 }' | xargs -I{} brew install --cask {} || true
else
  echo "Skipping installation of nerdfonts."
fi
# <<< Install programs <<<

# >>> Configuration >>>
# >>> Configure zsh/zprezto >>>
# TODO: Finish this setup here and move it to the end
# git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# create a new Zsh configuration
# setopt EXTENDED_GLOB
# for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
#   ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
# done
# <<< Configure zsh/zprezto <<<

# >>> Setting zsh as default shell >>>
if [[ "$SHELL" != "/bin/zsh" ]]; then
  echo "Changing shell to zsh..."
  chsh -s /bin/zsh
else
  echo "Shell is already zsh per default."
fi
# <<< Setting zsh as default shell <<<

remove_and_relink $dotfile_dir/git/gitconfig ~/.gitconfig;
remove_and_relink $dotfile_dir/zsh ~/zsh;
remove_and_relink $dotfile_dir/zsh/zshrc ~/.zshrc;
remove_and_relink $dotfile_dir/kitty ~/.config/kitty;
remove_and_relink $dotfile_dir/lazygit ~/Library/Application\ Support/lazygit

# TODO: Make it so that it doesn't overwrite the existing files
# >>> Configure lazyvim >>>
if prompt_user "Do you want to back up existing Neovim configuration files and reinstall?"; then
  echo "Setting up lazyvim..."
  mv ~/.config/nvim{,.bak}

  # optional but recommended
  mv ~/.local/share/nvim{,.bak}
  mv ~/.local/state/nvim{,.bak}
  mv ~/.cache/nvim{,.bak}

  # download lazyvim
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git
else
  echo "Skipping backup of existing Neovim configuration files."
fi

remove_and_relink $dotfile_dir/lazyvim ~/.config/nvim/lua

# <<< Configure lazyvim <<<
# <<< Configuration <<<

# >>> Installation >>>
