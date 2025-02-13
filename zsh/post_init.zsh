# Set up prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Set up direnv
eval "$(direnv hook zsh)"

# Set up fzf key bindings and fuzzy completion
if [[ "$(checkOS)" == "linux" ]]; then
  source /usr/share/doc/fzf/examples/completion.zsh
elif [[ "$(checkOS)" == "mac" ]]; then
  source <(fzf --zsh)
fi
