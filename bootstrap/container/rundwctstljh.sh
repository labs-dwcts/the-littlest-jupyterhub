# OS: Ubuntu 20.04 LTS
#!/bin/sh

set -e

doRun() {
  docker run \
    --privileged \
    --detach \
    --name=dwcts-tljh \
    --publish 12000:80 \
    --mount type=bind,source=$(pwd),target=/srv/src \
    # --restart="always" \
    # --gpus all
    # --gpus ‘”device=0,1”’
    labsdwcts/dwcts-tljh
}

siteAddress() {
  echo 'site address : http://'$(hostname -I)':12000'

}

siteAddress
doRun