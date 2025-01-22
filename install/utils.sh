#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'        # No Color

function check_root() {
  # Check if the script is being run as root, if not, ask for sudo
  if [ "$(id -u)" -ne 0 ]; then
      echo "This script requires sudo privileges. Please run it with sudo."
      exit 1
  fi
}

function make_dir() {
  if [ ! -d $1 ]; then
    echo "Directory $1 does not exist. Creating it now."
    mkdir -p $1
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
  local installer=$1
  local package=$2
  local check_command=${3:-$package}

  if [[ -z "$installer" || -z "$package" ]]; then
    echo "Usage: install <installer> <package> or install <command> <package>"
    return 1
  fi

  if command -v "$check_command" >/dev/null 2>&1; then
    echo -e "$package is ${GREEN}already installed${NC}"
    return 0
  fi

  case "$installer" in
    apt|apt-get|snap|cargo)
      installer="$installer install"
      ;;
    wget|curl)
      echo "Not implemented."
      ;;
    *)
      echo "Unsupported installer: $installer"
      exit 1
      ;;
  esac

  if $installer "$package" -y > /dev/null 2>&1; then
    echo -e "$package ${GREEN}installed successfully${NC}"
    return 0
  fi

  echo -e "$package using $installer ${RED}failed to install${NC}" >&2
  return 1
}

remove_and_relink() {
  local new_target="$1"
  local old_path="$2"

  if [[ -z "$new_target" || -z "$old_path" ]]; then
    echo "Usage: remove_and_relink <new_target> <old_path>"
    return 1
  fi

  if [ -L "$old_path" ]; then
    rm "$old_path" && echo "Removed symlink: $old_path" || echo "Failed to remove symlink: $old_path"
  elif [ -e "$old_path" ]; then
    if [ -f "$old_path" ]; then
      rm "$path" && echo "Removed file: $old_path" || echo "Failed to remove file: $old_path"
    elif [ -d "$old_path" ]; then
      rm -r "$old_path" && echo "Removed folder: $old_path" || echo "Failed to remove folder: $old_path"
    fi
  else
    echo "Path does not exist: $old_path"
  fi

  ln -s "$new_target" "$old_path" && echo "Created symlink: $new_target -> $old_path" || echo "Failed to create symlink: $new_target -> $old_path"
  return 0
}

prompt_user() {
    read -p "$1 (y/n): " choice
    case "$choice" in
        y|Y ) return 0;;
        n|N ) return 1;;
        * ) echo "Invalid choice. Please enter 'y' or 'n'."; prompt_user "$1";;
    esac
}

# if prompt_user "Do you want to install all nerdfonts?"; then
#   echo "Installing nerd fonts..."
#   brew search '/font-.*-nerd-font/' | awk '{ print $1 }' | xargs -I{} brew install --cask {} || true
# else
#   echo "Skipping installation of nerdfonts."
# fi

function get_nerdfont() {
  make_dir "$HOME/.fonts"
  if [ -z "$(find "$HOME/.fonts" -iname "*$1*")" ]; then
    # TODO: Make sure the right version is gotten
    wget -P "$HOME/.fonts" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/$1.zip
  else
    echo "$1 already exists in fonts."
  fi
}

