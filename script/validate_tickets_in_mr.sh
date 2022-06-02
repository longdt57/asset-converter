# get tickets from MR title
tickets=`echo $CI_MERGE_REQUEST_TITLE | grep -o "[A-Za-z]\+-[0-9]\+"`

# check tickets existence
if [ -z "$tickets" -a "$tickets" != " " ]
then
	echo "No ticket found in MR Title"
	exit 1
fi

exit 0