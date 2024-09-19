alias cf="cd ~/go/src/github.com/sethlowie/dotfiles && nvim"
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
