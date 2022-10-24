#!/bin/sh

set -e

#
# JupyterHub 설치 (hsblabs/tljh-dw-docker)
#

do_pull() {
  docker pull labs/tljh-dw
}

#
# 
#
do_pull