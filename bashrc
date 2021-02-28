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
# Check if the second argument is -e so we know if we want to open editor or not
if [ "$2" == "-e" ]
then
export GIT_EDITOR="sed -i '/Signed-off-by:.*/d' .git/COMMIT_EDITMSG && $PREV_EDITOR"
else
export GIT_EDITOR="sed -i '/Signed-off-by:.*/d' .git/COMMIT_EDITMSG"
fi

git cherry-pick "$@" -e

if [ -z "$EMPTABLE_EDITOR" ]
then
    unset GIT_EDITOR
else
    PREV_EDITOR=$GIT_EDITOR
fi

}
