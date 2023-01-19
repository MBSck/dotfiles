# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi


# Make alias for programs
alias py3='python3'
alias pi3='pip3 install'
alias pytest='python -m pytest'

# User specific aliases
alias cs='clear;ls'
alias csa='clear; ls -a'
alias ls='ls -G'
alias lsa='ls -a'
alias lsl='ls -l'

alias q='exit'
alias c='clear'
alias cs='clear;ls'
alias p='cat'
alias t='time'
alias k='kill'
alias h='history'
alias pd='pwd'
alias o='open'

alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'

# Path shortcuts
alias ghome='cd ~'
alias gmatisse='cd /Users/scheuck/Documents/PhD/matisse_stuff'
alias gdonotbackup='cd /Users/scheuck/Desktop/DoNotBackup/'
alias gtexlive='cd /usr/local/texlive/'
alias gmedia='cd /Volumes'

alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias inputrc='vim ~/.inputrc'
alias loadinput='source ~/.inputrc'
alias loadbash='source ~/.bashrc'

# Shortcuts for ssh-connections
alias astro='ssh -X scheuck@astro-node11'
alias nxhop='ssh -X scheuck@nx-hop-2'

# Set standard programs
export EDITOR=vim

# Color for terminal hostname
export TERM="xterm-color"
PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$'
export TERM=xterm-256color

# Export paths
# echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
# echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH=/usr/local/bin:$PATH

# Shortcut for modelling
alias rein='python setup.py bdist_wheel && pip install -e .'
. "$HOME/.cargo/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
