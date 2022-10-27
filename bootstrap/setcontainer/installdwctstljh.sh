#!/bin/sh

set -e

#
# Install JupyterHub (docker)
#
doSetDirectory(){
  # create a share directory
  sudo mkdir /srv/data /srv/setenv /srv/scratch \
  && sudo ln -s /srv/data /etc/skel/data \
  && sudo ln -s /srv/setenv /etc/skel/setenv

  # change group ownership and default permissions to use group
  sudo chown root:jupyterhub-users /srv/scratch \
    && sudo chmod 777 /srv/scratch \
    && sudo chmod g+s /srv/scratch

  # Create a symbolic link to the scratch folder in users home directories
  sudo ln -s /srv/scratch /etc/skel/scratch
}

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

  docker exec -i dwcts-tljh sh -c "python3 /srv/src/bootstrap/bootstrap.py --admin admin"
  
  docker exec -i dwcts-tljh sh -c "tljh-config set user_environment.default_app jupyterlab && tljh-config reload hub"
  
  docker cp share/jupyterhub/ dwcts-tljh:/opt/tljh/hub/share

  docker exec -i dwcts-tljh sh -c "export PATH=$PATH:/opt/tljh/user/bin && conda install -c conda-forge -y \
    jupyterlab-language-pack-ko-KR"

  docker exec -i dwcts-tljh sh -c "export PATH=$PATH:/opt/tljh/user/bin && conda install -c conda-forge -y \
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

  docker exec -i dwcts-tljh sh -c "export PATH=$PATH:/opt/tljh/user/bin && pip install \
    jupyterlab-nvdashboard \
    nbconvert"

  exit
}

#
# 
#
# doInstall 2>&1 | tee -a /var/log/installtljhdocker.log
doSetDirectory
doInstall