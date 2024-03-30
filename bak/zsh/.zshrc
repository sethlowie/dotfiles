function gt() {

    # Check if a branch name is provided
    if [ "$#" -ne 1 ]; then
        echo "Usage: gt <new-branch-name>"
        return 1
    fi

    local BRANCH_NAME=$1

    # Create a new branch based on the current HEAD
    git branch $BRANCH_NAME

    # Create a new worktree for the new branch in a new directory
    git worktree add "../$BRANCH_NAME" $BRANCH_NAME

    # Navigate into the new worktree directory
    cd "../$BRANCH_NAME"

    # Run yarn install
    yarn install
}


function wt() {
  git worktree list --porcelain | rg worktree | rev | cut -d / -f 1 | rev | rg -v '^(post-web|dev|stg)$';
}

function worktrees() {
  while true; do
    clear;
    wt;
    sleep 2;
  done
}
