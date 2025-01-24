# PATHS
# Java
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# GNU
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"

# Set Important Path aliases
DOWN="$HOME/Downloads/"
DESK="$HOME/Desktop/"
DOC="$HOME/Documents/"
BOOK="${DOC}/ReadingMaterial/Books/"
PAPER="${DOC}/ReadingMaterial/Papers/"
CODE="${DOC}/Code"
DOT="${CODE}/dotfiles"
PIC="$HOME/Pictures/"
DATA="$HOME/Data"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# >>> juliaup initialize >>>
# !! Contents within this block are managed by juliaup !!
path=('/Users/scheuck/.juliaup/bin' $path)
export PATH
# <<< juliaup initialize <<<

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
[[ -d $XDG_CONFIG_HOME/zsh ]] && export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
source "$ZDOTDIR/.zshenv"
