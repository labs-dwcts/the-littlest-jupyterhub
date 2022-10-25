#!/bin/sh

set -e

#
# JupyterHub 설치 (labsdwcts/dwcts-tljh dockerhub)
#

doPull() {
  docker pull labsdwcts/dwcts-tljh:latest
}

#
# 
#
doPull