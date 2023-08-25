# PATHS
# Path to pyenv installation
PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"

# Implement adb
# if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
#  export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
# fi

# Set IDL paths
IDL_PACKAGE_DIR="/Applications/itt/idl71/packages"
export IDL_PATH="/Applications/itt/idl71:/Applications/itt/idl71/lib:/Applications/itt/idl71/lib/wavelet/source"
export IDL_PATH=$IDL_PATH:$IDL_PACKAGE_DIR/astrolib/pro
export IDL_PATH=$IDL_PATH:$IDL_PACKAGE_DIR/textoidl
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
export IDL_STARTUP=~/.idlrc

# FFTW paths.
export DYLD_LIBRARY_PATH="/usr/local/lib"
export LDFLAGS="-L/usr/local/lib"
export CFLAGS="-I/usr/local/include"

# Set Important Path aliases
DOWN="${HOME}/Downloads/"
DOC="${HOME}/Documents/"
PIC="${HOME}/Pictures/"
BOOK="${HOME}/ReadingMaterial/Books/"
PAPER="${HOME}/ReadingMaterial/Papers/"
CODE="${HOME}/Code"
DATA="${HOME}/Data"
DOT="${CODE}/dotfiles"
TERMINAL="${DOT}/terminal/"
LATEX="${DOC}/latex"
