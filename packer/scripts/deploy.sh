#!/bin/bash
if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed'
  echo 'Installing git'
  sudo apt-get install -y git
fi

git clone -b monolith https://github.com/express42/reddit.git /srv/reddit

cd /srv/reddit && bundle install
