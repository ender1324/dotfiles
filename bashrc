function gcp() {
# We dont want to override the editor globally with nano
# Thats why we make a seperate variable that can be empty
EMPTABLE_EDITOR=$GIT_EDITOR
# Then use the normal one with fallback and everything
if [ -z "$GIT_EDITOR" ]
then
    PREV_EDITOR="nano"
    echo "Default editor not set falling back to $PREV_EDITOR"
else
    PREV_EDITOR=$GIT_EDITOR
fi
export GIT_EDITOR="sed -i '/Signed-off-by:.*/d' .git/COMMIT_EDITMSG && $PREV_EDITOR"

git cherry-pick "$@" -e
export GIT_EDITOR=$EMPTABLE_EDITOR
}
