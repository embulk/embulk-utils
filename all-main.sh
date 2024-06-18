#!/bin/sh
git submodule update --init --recursive --remote
git submodule foreach git fetch -p --tags origin
git submodule foreach git checkout main
git submodule foreach git rebase origin/main
git submodule foreach "git for-each-ref --format='%(refname:short)' refs/heads/ --merged=main | grep -v main | xargs --no-run-if-empty git branch -d"
