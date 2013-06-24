#!/bin/sh

# update software packages installed in user space

# update homebrew
brew update 2>&1 > /dev/null
brew_outdated=$(brew outdated)
if [[ -x `which terminal-notifier` ]]; then
  terminal-notifier -message "$brew_outdated" -title 'brew packages with updates'
else
  echo $brew_outdated
fi
brew upgrade

# update global node modules
npm_outdated=$(npm outdated -g)
if [[ -x `which terminal-notifier` ]]; then
  terminal-notifier -message "$npm_outdated" -title 'node modules with updates'
else
  echo $npm_outdated
fi
npm update -g

# update rvm
rvm get stable --auto

# update ruby gems
gems_outdated=$(gem outdated)
if [[ -x `which terminal-notifier` ]]; then
  terminal-notifier -message "$gems_outdated" -title 'ruby gems with updates'
else
  echo $gems_outdated
fi
gem update

# update python packages
for i in `pip freeze --local | grep -v '^\-e' | cut -d = -f 1`; do 
  pip install --upgrade --quiet $i
done