#!/bin/bash
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


function command_install() {
  check_install $2
  if [ $? -eq 0 ]; then
    $1
  fi
}

function install() {
  if [ -n  "$3" ]; then
    check_install $3
  else
    check_install $2
  fi

  if [ $? -eq 1 ]; then
    return 1
  fi

  installer=$1
  if [[ "$installer" == *"apt"* || "$installer" == *"snap"*  || "$installer" == *"cargo"* ]]; then
    installer="$1 install"
  fi

  additional_args="$*"
  $installer "$2" -y
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

