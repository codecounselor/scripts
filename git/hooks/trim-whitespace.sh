#!/bin/sh

#adapted from https://gist.github.com/mgamer/132534fe1155fb40adc5adfc58790373

DESCRIBEFILES=$(git diff --staged -G"^[[:space:]]\{1,\}$" --name-only | wc -l)
if [ $DESCRIBEFILES -gt 0 ]
then
  echo "How could you leave whitespace in the following files?!? :"
  git --no-pager diff --staged --name-only -G"^\[[:space:]]\{1,\}$\(" | xargs -L1 -I {} sh -c 'sed -i "" "s/[[:space:]]\{1,\}$//g" {}; git add "{}"'
  echo "This is fixed automatically now"
fi
