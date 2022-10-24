#!/bin/sh

set -e

#
# JupyterHub 설치 (docker)
#

doInstall() {
  git clone https://github.com/labs-dwcts/the-littlest-jupyterhub.git
  cd the-littlest-jupyterhub/
  
  docker build -t tljh-systemd . -f integration-tests/Dockerfile
  
  docker run \
  --privileged \
  --detach \
  --name=dwcts-tljh \
  --publish 12000:80 \
  --mount type=bind,source=$(pwd),target=/srv/src \
  tljh-systemd
  
  #docker exec -it dwcts-tljh /bin/bash
  docker exec -it dwcts-tljh sh -c "python3 /srv/src/bootstrap/bootstrap.py --admin admin"
  
  docker exec -it dwcts-tljh sh -c "tljh-config set user_environment.default_app jupyterlab && tljh-config reload hub"
  
  docker exec -it dwcts-tljh sh -c "export PATH=$PATH:/opt/tljh/user/bin && conda install -c conda-forge -y \
    jupyterlab-language-pack-ko-KR"

  docker exec -it dwcts-tljh sh -c "conda install -c conda-forge -y \
    nodejs=16 \
    jupyterlab-git \
    jupyterlab-github \
    jupyterlab_execute_time \
    jupyterlab-variableinspector \
    jupyterlab-drawio \
    jupyterlab-lsp \
    python-lsp-server \
    ipywidgets \
    jupyter-archive"

  docker exec -it dwcts-tljh sh -c "pip install \
    jupyterlab-nvdashboard \
    nbconvert"

  docker exec -it dwcts-tljh sh -c "git clone https://github.com/labs-dwcts/the-littlest-jupyterhub temp \
    && cp -fr temp/share/jupyterhub/ /opt/tljh/hub/share/ \
    && rm -fr temp"

  docker exec -it dwcts-tljh /bin/bash
  ps
  exit
    
  # export PATH=$PATH:/opt/tljh/user/bin
}

#
# 
#
doInstall