function gcp() {
if [ "$@" == "--abort" ]
then
   git cherry-pick --abort
elif [ "$@" == "--continue" ]
then
   git cherry-pick --continue
else
PREV_EDITOR=$GIT_EDITOR
export GIT_EDITOR='sed -i "/Signed-off-by:.*/d" .git/COMMIT_EDITMSG && nano'

git cherry-pick "$@" -e
export GIT_EDITOR=$PREV_EDITOR
fi
}
