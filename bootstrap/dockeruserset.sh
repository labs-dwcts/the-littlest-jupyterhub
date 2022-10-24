#!/bin/sh

set -e

#
# JupyterHub 셋팅 (bare metal)
#

doSet() {
  sudo usermod -aG docker $USER
}

#
# 
#
doSet