#!/bin/bash

# To be used when branch naming matchs 'prefix-issueNumber-message'
# Exracts the issue number from the current branch and appends it to the commit message

COMMIT_MESSAGE_FILE=$1
BRANCH_NAME=`git symbolic-ref --short HEAD` || 2>/dev/null

# Expects a commit message of the form: {prefix}-{issueNumber}-{message}
ISSUE_NUMBER=`echo $BRANCH_NAME | cut -d "-" -f 2`
echo "prepare-commit-msg hook:: Branch=$BRANCH_NAME, Issue=$ISSUE_NUMBER"

# This way you can customize which branches should be skipped when prepending commit message.
if [ -z "$BRANCHES_TO_SKIP" ]; then
  BRANCHES_TO_SKIP="master develop"
fi

SKIP_BRANCH_ARRAY=($BRANCHES_TO_SKIP)
BRANCH_EXCLUDED=$(printf "%s\n" "${SKIP_BRANCH_ARRAY[@]}" | grep -c "^$BRANCH_NAME$")
BRANCH_IN_COMMIT=$(grep -c "\[$BRANCH_NAME\]" "$COMMIT_MESSAGE_FILE")

if [ -n "$BRANCH_NAME" ] && ! [[ $BRANCH_EXCLUDED -eq 1 ]] && ! [[ $BRANCH_IN_COMMIT -ge 1 ]]; then
  # -i.bak creates a copy of the original file
  # find one occurnce (the end of the line) and add '#issue'
  # This allows git keywords (i.e. fixes) to prefix the issue number
  sed -i.bak -e "1s/$/ #${ISSUE_NUMBER}/" $COMMIT_MESSAGE_FILE
  # Add it to the beginning too for better readability
  sed -i -e "1s/^/#${ISSUE_NUMBER} /" $COMMIT_MESSAGE_FILE
  echo "prepare-commit-msg hook:: injected issue number ($ISSUE_NUMBER) into your commit message"
else
  echo "prepare-commit-msg hook:: exclusion rule triggered, no issue number appended"
fi

# Handy Dandy Links
# https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks
# https://gist.github.com/bartoszmajsak/1396344
# https://www.jayway.com/2012/11/29/automatic-issue-tags-in-git-commit-messages/
