# Creates a working tree to check out a branch locally.
# This is useful when you have multiple branches on origin,
# and want to pull work with them
function worktree() {
  if [ $# -eq 0 ]; then
    git worktree list
    return 0
  fi

  REPO_NAME=$(basename `git rev-parse --show-toplevel`)
  BASEDIR=$GIT_WORKTREE_DIR/$REPO_NAME
  mkdir -p $BASEDIR

  BRANCHNAME=$1

  # if we already created the worktree and the branch, just go there
  if [[ -e $BASEDIR/$BRANCHNAME ]]; then
    cd $BASEDIR/$BRANCHNAME
    return 0
  fi

  # Ensure we don't have stale trees around...
  git worktree prune;

  # Get fresh data from origin...
  git fetch origin;

  # Check for the presense of a local branch...
  git rev-parse --verify $BRANCHNAME

  # $? == 0 means local branch with <branch-name> exists.
  if [[ $? == 0 ]]; then
    # Create a worktree from the local branch.  If it already exists
    # in another worktree, then this will die with error.
    git worktree add $BASEDIR/$BRANCHNAME $BRANCHNAME
  else
    # Create a local branch with the same name as origin, then create
    # a worktree from it.
    git worktree add -b $BRANCHNAME $BASEDIR/$BRANCHNAME master
  fi
  cd $BASEDIR/$BRANCHNAME
}

export GIT_WORKTREE_DIR="/home/robert/git-worktrees"
alias gwt='worktree'

