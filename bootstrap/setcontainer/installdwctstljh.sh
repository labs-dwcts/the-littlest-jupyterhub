#!/bin/sh

set -e

doUserSet() {
  sudo usermod -aG docker $USER
}

doSet() {
  git clone https://github.com/labs-dwcts/the-littlest-jupyterhub.git install

  cd install/bootstrap/
  sudo bash ./setdwctstljh.sh

  cd ../../
  rm -fr install
}

doUserSet
doSet