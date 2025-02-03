# ALIASES
# Make aliases for programs
alias vi="nvim"
alias vim="nvim"
alias lg="lazygit"
alias optool="/Users/scheuck/.local/bin/optool"
alias idl="/Applications/NV5/idl90/bin/idl"
alias ds9="/Applications/SAOImageDS9.app/Contents/MacOS/ds9"
alias fv="/Applications/FV.app/Contents/MacOS/FV &"
alias hip="java -jar /Applications/Hipparcos.app/jhip.jar &"
alias oimag="javaws /Applications/JMMC\ OImaging.app/OImaging.jnlp &"
alias oiexp="javaws /Applications/JMMC\ OIFitsExplorer.app/OIFitsExplorer.jnlp &"
alias aspro="javaws /Applications/JMMC\ Aspro.app/aspro2.jnlp &"
alias litpro="javaws /Applications/JMMC\ LITpro.app/LITpro.jnlp &"
alias scal="javaws /Applications/JMMC\ SearchCal.app/SearchCal.jnlp &"

# Configuration path shortcuts
alias dot="cd ${DOT}; wezterm cli set-tab-title dotfiles"
alias nvimrc="cd ${DOT}/lazyvim/; wezterm cli set-tab-title lazyvim"
alias zsh="cd ${DOT}/zsh/; wezterm cli set-tab-title zsh"
alias wez="cd ${DOT}/wezterm/; wezterm cli set-tab-title wez"

# Directly edit configuration files
alias zshrc="nvim $HOME/.zshrc"

# Source aliases
alias loadzsh="source $HOME/.zshrc"

# General Path shortcuts
alias desk="cd ${DESK}; wezterm cli set-tab-title desktop"
alias data="cd ${DATA}; wezterm cli set-tab-title data"
alias code="cd ${CODE}; wezterm cli set-tab-title code"
alias down="cd ${DOWN}; wezterm cli set-tab-title downloads"
alias doc="cd ${DOC}; wezterm cli set-tab-title documents"
alias pic="cd ${PIC}; wezterm cli set-tab-title pictures"
alias book="cd  ${BOOK}; wezterm cli set-tab-title books"
alias paper="cd ${PAPER}; wezterm cli set-tab-title papers"

# Code shortcuts
alias calfind="cd ${CODE}/calfind; wezterm cli set-tab-title calfind"
alias matadrs="cd ${CODE}/matadrs; wezterm cli set-tab-title matadrs"
alias p2obt="cd ${CODE}/p2obt; wezterm cli set-tab-title p2obt"
alias ppd="cd ${CODE}/ppdmod; wezterm cli set-tab-title ppdmod"
alias oimod="cd ${CODE}/oimodeler; wezterm cli set-tab-title oimodeler"
alias fourim="cd ${CODE}/fourim; wezterm cli set-tab-title fourim"
alias tools="cd ${CODE}/ir-tools; wezterm cli set-tab-title ir-tools"
alias tidbits="cd ${CODE}/tidbits; wezterm cli set-tab-title tidbits"

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
