#!/bin/bash
if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed'
  echo 'Installing git'
  sudo apt-get install -y git
fi

git clone -b monolith https://github.com/express42/reddit.git ~/reddit

cd ~/reddit && bundle install

cd ~/reddit && puma -d
ps aux | grep puma
