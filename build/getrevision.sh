#!/bin/sh
# match SVN revision number from git log
git log -3 --pretty=%B | grep ^git-svn-id | head -n 1 | sed 's/.*trunk@\(\d\{4,5\}\)\s.*/\1/g'
