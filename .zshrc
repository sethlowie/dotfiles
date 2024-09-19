# setup zinit if not setup and source
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit snippet OMZP::git
zinit snippet OMZP::kubectl

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/ohmyposh.toml)"
fi

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Outputs the name of the current branch
# Usage example: git pull origin $(git_current_branch)
# Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# it's not a symbolic ref, but in a Git repo.
function git_current_branch() {
  local ref
  ref=$(__git_prompt_git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

autoload -Uz compinit && compinit

# bindkey -v
bindkey '^I' autosuggest-accept
# bindkey '^p' history-search-backward
# bindkey '^n' history-search-forward

#HISTORY
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE 
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

### ALL MY STUFF
alias cf="cd ~/dotfiles && nvim"
alias nlogs="cd ~/.local/state/nvim && nvim"

alias pt="pnpm typecheck"
alias ptt="pnpm test"
alias pd="pnpm dev"

function fd() {
  cd $(find ~/go/src/github.com -maxdepth 2 -type d | fzf)
}

alias pip="pip3"
alias python="python3"
alias py="python3"

function list_workspaces() {
  # Get the list of monitors
  monitors=($(aerospace list-monitors | awk '{print $1}'))

  # Check if there are more than one monitor
  if [ ${#monitors[@]} -gt 1 ]; then
    # If argument is "1", get workspaces for monitor 2, and vice versa
    if [ "$1" == "1" ]; then
      echo "Running aerospace list-workspaces --monitor 2"
      aerospace list-workspaces --monitor 2
    elif [ "$1" == "2" ]; then
      echo "Running aerospace list-workspaces --monitor 1"
      aerospace list-workspaces --monitor 1
    else
      echo "Invalid argument. Please provide '1' or '2'."
    fi
  else
    echo "Only one monitor detected. No swap needed."
  fi
}

source ~/go/src/github.com/sethlowie/workfiles-teal/terminal/shortcuts.zsh

alias ls='eza -l -a --icons -F -a --octal-permissions -h'
