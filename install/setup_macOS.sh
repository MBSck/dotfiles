#!/bin/bash
source utils.sh

check_root

# >>> Installation >>>
dotfile_dir=$(pwd);
cd ~;
command_install "/bin/bash -c '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)'" brew
command_install "curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin" kitty

# TODO: Rewrite this so it installs the right things
command_install "brew install neovim" nvim
command_install "npm install neovim" nvim
command_install "gem install neovim" nvim
install brew fzf
install brew fd
install brew tldr
install brew btop
install brew rnr
install brew lazygit
install brew dust
install brew luarocks
install brew uv
# <<< Installation <<<

# >>> Configuration >>>
# TODO: Finish this setup here and move it to the end
# git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# create a new Zsh configuration
# setopt EXTENDED_GLOB
# for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
#   ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
# done

if [[ "$SHELL" != "/bin/zsh" ]]; then
  echo "Changing shell to zsh..."
  chsh -s /bin/zsh
else
  echo "Shell is already zsh."
fi

remove_and_relink $dotfile_dir/git/gitconfig ~/.gitconfig;
remove_and_relink $dotfile_dir/zsh ~/zsh;
remove_and_relink $dotfile_dir/zsh/zshrc ~/.zshrc;
remove_and_relink $dotfile_dir/kitty ~/.config/kitty;
remove_and_relink $dotfile_dir/btop ~/.config/btop;
remove_and_relink $dotfile_dir/bat ~/.config/bat;

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

