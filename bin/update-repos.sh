#!/bin/sh
# update all git repositories in a directory
# uses [terminal-notifier](https://github.com/alloy/terminal-notifier)

# Set DIR to the directory with your repositories to update
DIR=`pwd`

repos=`find $DIR -type d -name .git | xargs -n 1 dirname`
notify=`which terminal-notifier`

for repo in $repos; do 
  cd $repo
  echo 'Updating repository ' $repo
  if [[ -f $notify ]] ; then
    git pull | $notify -title "Git Repo: $repo"
  else
    git pull
  fi
  echo ''
  cd $DIR
done
