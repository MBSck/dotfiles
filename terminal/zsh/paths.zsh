# PATHS
# Path to pyenv installation
PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"

# Implement adb
# if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
#  export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
# fi

# Set IDL paths
export IDL_PATH="/Applications/itt/idl71:/Applications/itt/idl71/lib:/Applications/itt/idl71/lib/wavelet/source"
export IDL_DIR="/Applications/itt/idl71"
export IDL_PATH=$IDL_PATH:/Users/scheuck/Code/idl/astrolib/pro
export IDL_PATH=$IDL_PATH:/Users/scheuck/Code/idl/textoidl
export IDL_PATH=$IDL_PATH:/Users/scheuck/Code/idl/OIfits_Monnier/OI-data
export IDL_PATH=$IDL_PATH:/Users/scheuck/Code/idl/starfinder
export IDL_PATH=$IDL_PATH:/Users/scheuck/Code/idl/coyote
export IDL_PATH=$IDL_PATH:/Users/scheuck/Code/idl/extra_idl_routines
export IDL_PATH=$IDL_PATH:/Users/scheuck/Code/idl/idl_emcee/pro
export IDL_PATH=$IDL_PATH:/Users/scheuck/Code/idl/itools:/Users/scheuck/Code/idl/itools/components:/Users/scheuck/Code/idl/itools/framework:/Users/scheuck/Code/idl/itools/iu_widgets:idl/itools/extra
export IDL_STARTUP=/Users/scheuck/.idlrc

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
