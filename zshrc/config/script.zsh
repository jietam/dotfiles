wt() {
  if [ -z "$1" ]; then
    echo "Usage: wt <branch-name>"
    return 1
  fi
  local branch_name="$1"
  git branch "tanjie/$branch_name" && \
  git worktree add "../manus/$branch_name" "tanjie/$branch_name" && \
  cd "../manus/$branch_name"
}
