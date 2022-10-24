#!/bin/sh

set -e

#
# JupyterHub 셋팅 (bare metal)
#

do_set() {
  sudo usermod -aG docker $USER
  sudo usermod -aG docker $(whoami)
}

#
# 
#
do_set