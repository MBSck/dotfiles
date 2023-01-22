# Some Helpful path variables
CODE="${HOME}/Code"
DATA="${HOME}/Data"
DOT="${CODE}/dotfiles"

# Make aliases for programs
alias vi="nvim"
alias vim="nvim"
alias py3="python3"
alias pip3="python3 -m pip"
alias pytest="python -m pytest"
alias fv="open -a ring"

# Configuration shortcuts
alias zshrc="nvim ~/.zshrc"
alias aliases="nvim ${DOT}/terminal/zsh/aliases.zsh"
alias pathrc="nvim ${DOT}/terminal/zsh/paths.zsh"
alias commandrc="nvim ${DOT}/terminal/zsh/commands.zsh"
alias nvimrc="cd ${DOT}/nvim/"
alias tmuxrc="nvim ${DOT}/terminal/tmux/.tmux.conf"
alias alacritty="nvim ${DOT}/terminal/alacritty/alacritty.yml"

# Source aliases
alias loadzsh="source ~/.zshrc"

# General Path shortcuts
alias home="cd ${HOME}"
alias data="cd ${DATA}"
alias code="cd ${CODE}"
alias down="cd ${HOME}/Downloads/"
alias docs="cd ${HOME}/Documents/"
alias pics="cd ${HOME}/Pictures/"
alias book="cd  ${HOME}/Books/"
alias paper="cd ${HOME}/Papers/"

# Code shortcuts
alias dot="cd ${DOT}"
alias matadrs="cd ${CODE}/matadrs; pyenv activate matadrs"
alias p2obp="cd ${CODE}/p2obp; pyenv activate p2obp"
alias model="cd ${CODE}/modelling; pyenv activate modelling"
alias tidbits="cd ${CODE}/tidbits; pyenv activate tidbits"

# Fast interactions
alias c="clear"
alias o="open"
alias p="cat"
alias t="time"
alias k="kill"
alias h="history"
alias q="exit"
alias cs="clear; ls"
alias ca="clear; ls -la"
alias cl="clear; ls -ll"

# Better navigation
alias ...="cd ..; cd .."
alias ....="cd ..; cd ..; cd .."
alias .....="cd ..; cd ..; cd ..; cd .."
