# compare source branch - target branch to get ticket id from commit message
git fetch origin $CI_MERGE_REQUEST_TARGET_BRANCH_NAME
branch_log=`git log --cherry --pretty=format:'%s' origin/$CI_MERGE_REQUEST_TARGET_BRANCH_NAME..$CI_COMMIT_BRANCH`
tickets=`echo $branch_log | grep -o "[A-Za-z]\+-[0-9]\+"`

# check tickets existence
if [ -z "$tickets" -a "$tickets" != " " ]
then
	echo "No ticket found in Commit messages"
	exit 1
fi

exit 0