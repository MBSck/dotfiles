# PATHS
# Java
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# Display variable
export DISPLAY=:0

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

# >>> fzf initialize >>>
eval "$(fzf --zsh)"
# <<< fzf initialize <<<

# Use fd instead of fzf
export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

source ~/Software/fzf-git.sh/fzf-git.sh
