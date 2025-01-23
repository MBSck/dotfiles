#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'        # No Color

function hline() {
length=${1:-40}
printf "%${length}s\n" | tr " " "-"
}

# Check if the script is being run as root, if not exit
function check_root() {
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


# General install function with command or tool
# Supported are apt, apt-get, snap, cargo, wget and curl
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
    apt|apt-get|snap)
      installer="$installer install $package -y"
      ;;
    cargo)
      installer="$installer install $package"
      ;;
    curl*|wget*)
      installer="$installer"
      ;;
    *)
      echo "Unsupported installer: $installer"
      exit 1
      ;;
  esac

  if $installer > /dev/null 2>&1; then
    echo -e "$package ${GREEN}installed successfully${NC}"
    return 0
  fi

  echo -e "$package ${RED}failed to install${NC}" >&2
  return 1
}

# Removes old symlinks and creates new ones
remove_and_relink() {
  local new_target="$1"
  local old_path="$2"

  if [[ -z "$new_target" || -z "$old_path" ]]; then
    echo "Usage: remove_and_relink <new_target> <old_path>"
    return 1
  fi

  if [ -L "$old_path" ]; then
    rm "$old_path" && echo -e "${GREEN}Removed symlink:${NC} $old_path" || echo -e "${RED}Failed to remove symlink:${NC} $old_path"
  elif [ -e "$old_path" ]; then
    if [ -f "$old_path" ]; then
      rm "$path" && echo -e "${GREEN}Removed file:${RED} $old_path" || echo -e "${RED}Failed to remove file:${NC} $old_path"
    elif [ -d "$old_path" ]; then
      rm -r "$old_path" && echo -e "${GREEN}Removed folder:${NC} $old_path" || echo -e "${RED}Failed to remove folder:${NC} $old_path"
    fi
  else
    echo -e "${YELLOW}Path does not exist:${YELLOW} $old_path"
  fi

  ln -s "$new_target" "$old_path" && echo -e "${GREEN}Created symlink:${NC} $new_target -> $old_path" || echo -e "${RED}Failed to create symlink:${NC} $new_target -> $old_path"
  return 0
}

# if prompt_user "Do you want to install all nerdfonts?"; then
#   echo "Installing nerd fonts..."
#   brew search '/font-.*-nerd-font/' | awk '{ print $1 }' | xargs -I{} brew install --cask {} || true
# else
#   echo "Skipping installation of nerdfonts."
# fi

# TODO: Make sure this isn't accessing root
function get_nerdfont() {
  make_dir "$HOME/.fonts"
  if [ -z "$(find "$HOME/.fonts" -iname "*$1*")" ]; then
    # TODO: Make sure the right version is gotten
    wget -P "$HOME/.fonts" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/$1.zip
  else
    echo "$1 already exists in fonts."
  fi
}

