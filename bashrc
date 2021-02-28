function gcp() {
PREV_EDITOR=$GIT_EDITOR
export GIT_EDITOR="sed -i '/Signed-off-by:.*/d' .git/COMMIT_EDITMSG && $PREV_EDITOR"

git cherry-pick "$@" -e
export GIT_EDITOR=$PREV_EDITOR
}
