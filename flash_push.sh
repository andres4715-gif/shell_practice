#!/usr/bin/env bash

CURRENT_BRANCH=git branch --show-current
echo "CURRENT_BRANCH:", $CURRENT_BRANCH

git add .
git commit -m "new data"
git push origin master