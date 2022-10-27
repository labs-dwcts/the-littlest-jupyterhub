#!/bin/sh

set -e

#
# Install Docker compose (docker)
#

doInstall() {
  sudo curl -L https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  docker-compose --version
  exit
}

#
# 
#
doInstall