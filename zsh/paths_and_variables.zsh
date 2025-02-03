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

# >>> IDL directories >>>
export IDL_DIR="/Applications/NV5/idl90/"
export IDL_PACKAGE_DIR="${IDL_DIR}/packages"
export IDL_PATH=$IDL_PATH:"${IDL_DIR}/lib"
export IDL_PATH=$IDL_PATH:"${IDL_PACKAGE_DIR}/astrolib/pro"
export IDL_PATH=$IDL_PATH:"${IDL_PACKAGE_DIR}/OIfits_Monnier/OI-data"
export IDL_PATH=$IDL_PATH:"${IDL_PACKAGE_DIR}/starfinder"
export IDL_PATH=$IDL_PATH:"${IDL_PACKAGE_DIR}/coyote"
export IDL_PATH=$IDL_PATH:"${IDL_PACKAGE_DIR}/extra_idl_routines"
export IDL_PATH=$IDL_PATH:"${IDL_PACKAGE_DIR}/idl_emcee/pro"
export IDL_PATH=$IDL_PATH:"${IDL_PACKAGE_DIR}/itools"
export IDL_PATH=$IDL_PATH:"${IDL_PACKAGE_DIR}/itools/components"
export IDL_PATH=$IDL_PATH:"${IDL_PACKAGE_DIR}/itools/framework"
export IDL_PATH=$IDL_PATH:"${IDL_PACKAGE_DIR}/itools/iu_widgets"
export IDL_PATH=$IDL_PATH:"${IDL_PACKAGE_DIR}/itools/extra"
export IDL_STARTUP="${HOME}/.idlrc"
# <<< IDL directories <<<

# export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
# [[ -d $XDG_CONFIG_HOME/zsh ]] && export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
# source "$ZDOTDIR/.zshenv"
