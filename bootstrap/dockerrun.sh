#!/bin/sh

set -e

#
# JupyterHub 설치 (docker)
#

do_run() {
  git clone https://github.com/labs-dwcts/the-littlest-jupyterhub.git
  cd the-littlest-jupyterhub/
  
  docker build -t tljh-systemd . -f integration-tests/Dockerfile
  
  docker run \
  --privileged \
  --detach \
  --name=tljh-dev \
  --publish 12000:80 \
  --mount type=bind,source=$(pwd),target=/srv/src \
  tljh-systemd
  
  #docker exec -it tljh-dev /bin/bash
  docker exec -it tljh-dev sh -c "python3 /srv/src/bootstrap/bootstrap.py --admin admin"
  
  docker exec -it tljh-dev sh -c "tljh-config set user_environment.default_app jupyterlab && tljh-config reload hub"
  
  docker exec -it tljh-dev sh -c "export PATH=$PATH:/opt/tljh/user/bin && conda install -c conda-forge jupyterlab-language-pack-ko-KR -y"
    
  docker exec -it tljh-dev /bin/bash
  ps
  exit
    
  # export PATH=$PATH:/opt/tljh/user/bin
}

#
# 
#
do_run