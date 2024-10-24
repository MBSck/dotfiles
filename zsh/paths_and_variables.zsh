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
DOWN="~/Downloads/"
DESK="~/Desktop/"
DOC="~/Documents/"
PIC="~/Pictures/"
BOOK="~/ReadingMaterial/Books/"
PAPER="~/ReadingMaterial/Papers/"
CODE="~/Code"
DATA="~/Data"
DOT="${CODE}/dotfiles"

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:~/.rvm/bin"

# Ruby paths
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3

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
