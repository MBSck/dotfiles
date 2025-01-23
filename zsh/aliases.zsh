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

# Configuration path shortcuts
alias dot="cd ${DOT}; kitty @ set-tab-title dotfiles"
alias nvimrc="cd ${DOT}/lazyvim/; kitty @ set-tab-title lazyvim"
alias zsh="cd ${DOT}/zsh/; kitty @ set-tab-title zsh"
alias kittyrc="cd ${DOT}/kitty/; kitty @ set-tab-title kitty"

# Directly edit configuration files
alias zshrc="nvim $HOME/.zshrc"

# Source aliases
alias loadzsh="source $HOME/.zshrc"

# General Path shortcuts
alias desk="cd ${DESK}; kitty @ set-tab-title desktop"
alias data="cd ${DATA}; kitty @ set-tab-title data"
alias code="cd ${CODE}; kitty @ set-tab-title code"
alias down="cd ${DOWN}; kitty @ set-tab-title downloads"
alias doc="cd ${DOC}; kitty @ set-tab-title documents"
alias pic="cd ${PIC}; kitty @ set-tab-title pictures"
alias book="cd  ${BOOK}; kitty @ set-tab-title books"
alias paper="cd ${PAPER}; kitty @ set-tab-title papers"

# Code shortcuts
alias calfind="cd ${CODE}/calfind; kitty @ set-tab-title calfind"
alias matadrs="cd ${CODE}/matadrs; kitty @ set-tab-title matadrs"
alias p2obp="cd ${CODE}/p2obp; kitty @ set-tab-title p2obp"
alias ppd="cd ${CODE}/ppdmod; kitty @ set-tab-title ppdmod"
alias oimod="cd ${CODE}/oimodeler; kitty @ set-tab-title oimodeler"
alias fourim="cd ${CODE}/fourim; kitty @ set-tab-title fourim"
alias tools="cd ${CODE}/ir-tools; kitty @ set-tab-title ir-tools"
alias tidbits="cd ${CODE}/tidbits; kitty @ set-tab-title tidbits"

# TODO: Write uv init that automatically creates a .envrc as well or something like that

# Fast interactions
alias c="clear"
alias o="open"
alias p="cat"
alias t="time"
alias k="kill"
alias h="history"
alias q="exit"
alias ls="ls --color=auto"
alias la="ls -la"
alias ll="ls -ll"
alias cs="clear; ls"
alias ca="clear; ls -la"
alias cl="clear; ls -ll"

# Better navigation
alias ..="cd .."
alias ...="cd ..; cd .."
alias ....="cd ..; cd ..; cd .."
alias .....="cd ..; cd ..; cd ..; cd .."

# Kitty integration
# alias ikat="kitty +kitten icat"
# alias s="kitty +kitten ssh"
