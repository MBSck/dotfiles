# PATHS
# Path to pyenv installation
PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
export PATH="/opt/local/bin:${PATH}"
export PATH=/Users/scheuck/.local/bin:$PATH
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# Java
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# Display variable
export DISPLAY=:0

# GNU
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"

# Set clang paths.
# export CC="/opt/local/bin/clang-mp-16"
# export CXX="/opt/local/bin/clang++-mp-16"
# export C_INCLUDE_PATH="/opt/local/include"
# export CPLUS_INCLUDE_PATH="/opt/local/include"
# export LIBRARY_PATH="/opt/local/lib"
XCBASE=`xcrun --show-sdk-path`

# Implement adb
# if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
#  export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
# fi

# Set IDL paths
export IDL_DIR="/Applications/harris/idl"
export IDL_PATH=$IDL_PATH:"${IDL_DIR}/lib"
# export IDL_PATH="/Applications/itt/idl71:/Applications/itt/idl71/lib:/Applications/itt/idl71/lib/wavelet/source"

export IDL_PACKAGE_DIR="${IDL_DIR}/packages"
export IDL_PATH=$IDL_PATH:$IDL_PACKAGE_DIR/astrolib/pro
# export IDL_PATH=$IDL_PATH:$IDL_PACKAGE_DIR/textoidl
export IDL_PATH=$IDL_PATH:$IDL_PACKAGE_DIR/OIfits_Monnier/OI-data
export IDL_PATH=$IDL_PATH:$IDL_PACKAGE_DIR/starfinder
export IDL_PATH=$IDL_PATH:$IDL_PACKAGE_DIR/coyote
export IDL_PATH=$IDL_PATH:$IDL_PACKAGE_DIR/extra_idl_routines
export IDL_PATH=$IDL_PATH:$IDL_PACKAGE_DIR/idl_emcee/pro
export IDL_PATH=$IDL_PATH:$IDL_PACKAGE_DIR/itools
export IDL_PATH=$IDL_PATH:$IDL_PACKAGE_DIR/itools/components
export IDL_PATH=$IDL_PATH:$IDL_PACKAGE_DIR/itools/framework
export IDL_PATH=$IDL_PATH:$IDL_PACKAGE_DIR/itools/iu_widgets
export IDL_PATH=$IDL_PATH:$IDL_PACKAGE_DIR/itools/extra
export IDL_STARTUP="${HOME}/.idlrc"


# Set Important Path aliases
DOWN="${HOME}/Downloads/"
DESK="${HOME}/Desktop/"
DOC="${HOME}/Documents/"
PIC="${HOME}/Pictures/"
BOOK="${HOME}/ReadingMaterial/Books/"
PAPER="${HOME}/ReadingMaterial/Papers/"
CODE="${HOME}/Code"
DATA="${HOME}/Data"
DOT="${CODE}/dotfiles"
TERMINAL="${DOT}/terminal/"
LATEX="${DOC}/latex"

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Ruby paths
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3
