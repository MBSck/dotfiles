# ALIASES
# Make aliases for programs
alias vi="nvim"
alias vim="nvim"
alias optool="/Users/scheuck/.local/bin/optool"
alias ds9="/Applications/SAOImageDS9.app/Contents/MacOS/ds9"
alias fv="/Applications/FV.app/Contents/MacOS/FV &"
alias hip="java -jar /Applications/Hipparcos.app/jhip.jar &"
alias oimag="javaws /Applications/JMMC\ OImaging.app/OImaging.jnlp &"
alias oiexp="javaws /Applications/JMMC\ OIFitsExplorer.app/OIFitsExplorer.jnlp &"
alias aspro="javaws /Applications/JMMC\ Aspro.app/aspro2.jnlp &"
alias litpro="javaws /Applications/JMMC\ LITpro.app/LITpro.jnlp &"
alias scal="javaws /Applications/JMMC\ SearchCal.app/SearchCal.jnlp &"
alias update='sudo softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup; npm install npm -g; npm update -g; sudo gem update'

# Configuration path shortcuts
alias nvimrc="cd ${DOT}/lazyvim/"
alias zsh="cd ${DOT}/zsh/"
alias kittyrc="cd ${DOT}/kitty/"

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
alias calfind="cd ${CODE}/calfind"
alias matadrs="cd ${CODE}/matadrs"
alias p2obp="cd ${CODE}/p2obp"
alias ppd="cd ${CODE}/modelling/ppdmod"
alias oimod="cd ${CODE}/modelling/oimodeler"
alias fourim="cd ${CODE}/fourim"
alias tools="cd ${CODE}/ir-tools/ir-tools"
alias tidbits="cd ${CODE}/tidbits"

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
