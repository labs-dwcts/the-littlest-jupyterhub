# OS: Ubuntu 20.04 LTS
#!/bin/sh

set -e

doRun() {
  docker run \
    --privileged \
    --detach \
    --name=dwcts-tljh \
    --publish 80:80 \
    --mount type=bind,source=$(pwd),target=/srv/src \
    labsdwcts/dwcts-tljh
}

doAlwaysRun() {
  docker run \
    --privileged \
    --detach \
    --name=dwcts-tljh \
    --publish 80:80 \
    --mount type=bind,source=$(pwd),target=/srv/src \
    --restart=always \
    labsdwcts/dwcts-tljh
}

doUpdateAlways() {
  docker update --restart=always dwcts-tljh
}

# doAlwaysRun
# doUpdateAlways
doRun