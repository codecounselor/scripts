#!/bin/sh

#adapted from https://gist.github.com/mgamer/132534fe1155fb40adc5adfc58790373

DESCRIBEFILES=$(git diff --staged -G"^\s*fdescribe\(" --name-only | wc -l)
if [ $DESCRIBEFILES -gt 0 ]
then
  echo "You forgot to remove a fdescribe in the following files:"
  git --no-pager diff --staged --name-only -G"^\s*fdescribe\(" | xargs -L1 -I {} sh -c 'sed -i "" "s/\s*fdescribe(/describe(/g" {}; git add "{}"'
  echo "This is fixed automatically now"
fi

CONTEXTFILES=$(git diff --staged -G"^\s*fcontext\(" --name-only | wc -l)
if [ $CONTEXTFILES -gt 0 ]
then
  echo "You forgot to remove a fcontext in the following files:"
    git --no-pager diff --staged --name-only -G"^\s*fcontext\(" | xargs -L1 -I {} sh -c 'sed -i "" "s/\s*fcontext(/context(/g" {}; git add "{}"'
  echo "This is fixed automatically now"
fi

ITFILES=$(git diff --staged -G"^\s*fit\(" --name-only | wc -l)
if [ $ITFILES -gt 0 ]
then
  echo "You forgot to remove a fit in the following files:"
    git --no-pager diff --staged --name-only -G"^\s*fit\(" | xargs -L1 -I {} sh -c 'sed -i "" "s/\s*fit(/it(/g" {}; git add "{}"'
  echo "This is fixed automatically now"
fi

SPECIFYFILES=$(git diff --staged -G"^\s*fspecify\(" --name-only | wc -l)
if [ $SPECIFYFILES -gt 0 ]
then
  echo "You forgot to remove a fspecify in the following files:"
  git --no-pager diff --staged --name-only -G"^\s*fspecify\(" | xargs -L1 -I {} sh -c 'sed -i "" "s/\s*fspecify(/specify(/g" {}; git add "{}"'
  echo "This is fixed automatically now"
fi

EXAMPLEFILES=$(git diff --staged -G"^\s*fexample\(" --name-only | wc -l)
if [ $EXAMPLEFILES -gt 0 ]
then
  echo "You forgot to remove a fexample in the following files:"
  git --no-pager diff --staged --name-only -G"^\s*fexample\(" | xargs -L1 -I {} sh -c 'sed -i "" "s/\s*fexample(/example(/g" {}; git add "{}"'
  echo "This is fixed automatically now"
fi

