# ALIASES
# Make aliases for programs
alias nvim="lvim"
alias vi="nvim"
alias vim="nvim"
alias py3="python3"
alias pip3="python3 -m pip"
alias pytest="python -m pytest"
alias wlog="python3 /Users/scheuck/Code/tidbits/log_working_hours.py"
alias idl="/Applications/itt/idl71/bin/idl"
alias optool="/Applications/Optool.app/optool"
alias ds9="/Applications/SAOImageDS9.app/Contents/MacOS/ds9"
alias fv="/Applications/FV.app/Contents/MacOS/FV &"
alias hip="java -jar /Applications/Hipparcos.app/jhip.jar &"
alias oimag="javaws /Applications/JMMC\ OImaging.app/OImaging.jnlp &"
alias oiexp="javaws /Applications/JMMC\ OIFitsExplorer.app/OIFitsExplorer.jnlp &"
alias aspro="javaws /Applications/JMMC\ Aspro.app/aspro2.jnlp &"
alias litpro="javaws /Applications/JMMC\ LITpro.app/LITpro.jnlp &"
alias scal="javaws /Applications/JMMC\ SearchCal.app/SearchCal.jnlp &"

# Configuration path shortcuts
alias nvimrc="cd ${DOT}/vim/lvim/"
alias zsh="cd ${TERMINAL}/zsh/"
alias kittyrc="cd ${TERMINAL}/kitty/"

# Directly edit configuration files
alias zshrc="nvim ${HOME}/.zshrc"
alias bashrc="nvim ${HOME}/.bashrc"

# Source aliases
alias loadzsh="source ~/.zshrc"

# General Path shortcuts
alias home="cd ${HOME}"
alias desk="cd ${DESK}"
alias data="cd ${DATA}"
alias code="cd ${CODE}"
alias down="cd ${DOWN}"
alias doc="cd ${DOC}"
alias pic="cd ${PIC}"
alias book="cd  ${BOOK}"
alias paper="cd ${PAPER}"

# More Path shortcuts
alias glatex="cd ${LATEX}"
alias rust="cd ${CODE}/rust_projects"

# Code shortcuts
alias dot="cd ${DOT}"
alias calfind="cd ${CODE}/calfind; pyenv activate calfind"
alias matadrs="cd ${CODE}/matadrs; pyenv activate matadrs"
alias p2obp="cd ${CODE}/p2obp; pyenv activate p2obp"
alias mod="cd ${CODE}/modelling; pyenv activate modelling"
alias ppd="cd ${CODE}/modelling/ppdmod; pyenv activate modelling"
alias oimod="cd ${CODE}/modelling/oimodeler; pyenv activate oimodeler"
alias plot="cd ${CODE}/plotting; pyenv activate plotting"
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

# Kitty integration
# alias ikat="kitty +kitten icat"
# alias s="kitty +kitten ssh"
