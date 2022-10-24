#!/bin/sh

set -e

#
# JupyterHub 설치 (hsblabs/tljh-dw-docker)
#

doPull() {
  docker pull labs/tljh-dw
}

#
# 
#
doPull