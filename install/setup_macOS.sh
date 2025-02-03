#!/bin/bash
source utils.sh

check_root

dotfile_dir="$(dirname "$(dirname "$(realpath "$0")")")"

# >>> Installation >>>
# TODO: Rewrite this so it installs the right things
# command_install "npm install neovim" nvim
# command_install "gem install neovim" nvim
# install "/bin/bash -c '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)'" brew
install brew neovim nvim
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
# if [[ "$SHELL" != "/bin/zsh" ]]; then
#   echo "Changing shell to zsh..."
#   chsh -s /bin/zsh
# else
#   echo "Shell is already zsh."
# fi

remove_and_relink $dotfile_dir/git/gitconfig $HOME/.gitconfig;
remove_and_relink $dotfile_dir/zsh $HOME/zsh;
remove_and_relink $dotfile_dir/zsh/zshrc $HOME/.zshrc;
remove_and_relink $dotfile_dir/direnv $HOME/.config/direnv;
# TODO: Add wezterm here
remove_and_relink $dotfile_dir/btop $HOME/.config/btop;
remove_and_relink $dotfile_dir/bat $HOME/.config/bat;
remove_and_relink $dotfile_dir/lazygit /Library/Application\ Support/lazygit

# if prompt_user "Do you want to back up existing Neovim configuration files and reinstall?"; then
#   echo "Setting up lazyvim..."
#   mv ~/.config/nvim{,.bak}
#
#   # optional but recommended
#   mv ~/.local/share/nvim{,.bak}
#   mv ~/.local/state/nvim{,.bak}
#   mv ~/.cache/nvim{,.bak}
#
#   # download lazyvim
#   git clone https://github.com/LazyVim/starter ~/.config/nvim
#   rm -rf ~/.config/nvim/.git
# else
#   echo "Skipping backup of existing Neovim configuration files."
# fi
