#!/bin/bash

# To be used when branch naming matchs 'prefix-issueNumber-message'
# Exracts the issue number from the current branch and appends it to the commit message

# COMMIT_MESSAGE_FILE=$1
# BRANCH_NAME=`git symbolic-ref --short HEAD` || 2>/dev/null
#
# # Expects a commit message of the form: {prefix}-{issueNumber}-{message}
# ISSUE_NUMBER=`echo $BRANCH_NAME | cut -d "-" -f 2`
# echo "prepare-commit-msg hook:: Branch=$BRANCH_NAME, Issue=$ISSUE_NUMBER"
#
# # This way you can customize which branches should be skipped when prepending commit message.
# if [ -z "$BRANCHES_TO_SKIP" ]; then
#   BRANCHES_TO_SKIP="master develop"
# fi
#
# SKIP_BRANCH_ARRAY=($BRANCHES_TO_SKIP)
# BRANCH_EXCLUDED=$(printf "%s\n" "${SKIP_BRANCH_ARRAY[@]}" | grep -c "^$BRANCH_NAME$")
# BRANCH_IN_COMMIT=$(grep -c "\[$BRANCH_NAME\]" "$COMMIT_MESSAGE_FILE")
#
# if [ -n "$BRANCH_NAME" ] && ! [[ $BRANCH_EXCLUDED -eq 1 ]] && ! [[ $BRANCH_IN_COMMIT -ge 1 ]]; then
#   # -i.bak creates a copy of the original file
#   # Add it to the beginning
#   sed -Ei -e "1s/([fF]ixes)|(^)/\1\2 #${ISSUE_NUMBER} /" $COMMIT_MESSAGE_FILE
#   # remove leading space
#   sed -Ei -e "1s/^ //" $COMMIT_MESSAGE_FILE
#   echo "prepare-commit-msg hook:: injected issue number ($ISSUE_NUMBER) into your commit message"
# else
#   echo "prepare-commit-msg hook:: exclusion rule triggered, no issue number appended"
# fi

# .git/hooks/scoreboard-title.sh $1 $2 $3

COMMIT_MSG_FILE=$1
COMMIT_SOURCE=$2
SHA1=$3

# Only add custom message when there is no commit source
# ($COMMIT_SOURCE is empty). Otherwise, keep the default message
# proposed by Git. Possible commit source: message, template,
# merge, squash or commit. See https://git-scm.com/docs/githooks
ref=$(git rev-parse --abbrev-ref HEAD)
branch=(${ref//-/ })
issue_num=${branch[1]}
if [[ -z "$COMMIT_SOURCE" ]]
then
	echo "branch is: $branch, issue num is: $issue_num"
	if [[ ${branch[0]} == "issue" ]]; then
    title=$(gh issue view $issue_num --json title | jq -r .title)
		message="Fixes #$issue_num $title"
	fi
else
  # Use case here is subsequent commits to a branch; always inject the issue number
  message="#$issue_num "
fi

hint=$(cat "$COMMIT_MSG_FILE")
echo "$message" > "$COMMIT_MSG_FILE"
echo "$hint" >> "$COMMIT_MSG_FILE"

# Handy Dandy Links
# https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks
# https://gist.github.com/bartoszmajsak/1396344
# https://www.jayway.com/2012/11/29/automatic-issue-tags-in-git-commit-messages/
