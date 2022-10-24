#!/bin/sh

set -e

#
# JupyterHub 셋팅 (bare metal)
#

doSet() {
  sudo usermod -aG docker $USER
  sudo usermod -aG docker $(whoami)
}

#
# 
#
doSet