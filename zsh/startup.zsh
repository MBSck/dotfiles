# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

ssh-add ~/.ssh/id_github &>/dev/null
ssh-add ~/.ssh/id_astronode11 &>/dev/null
