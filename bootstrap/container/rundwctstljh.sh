#!/bin/sh

set -e

doUserSet() {
  sudo usermod -aG docker $USER
}

doRun() {
  docker run \
    --privileged \
    --detach \
    --name=dwcts-tljh \
    --publish 12000:80 \
    --mount type=bind,source=$(pwd),target=/srv/src \
    labsdwcts/dwcts-tljh
}

doUserSet
doSet