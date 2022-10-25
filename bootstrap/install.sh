#!/bin/sh

set -e

#
# install jupyterHub (bare metal)
#

doInstall() {
  # update
  sudo apt update
  # sudo apt upgrade -y
  
  # prerequisites
  sudo apt install -y build-essential
  sudo apt install -y python3 python3-dev git curl
  curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && sudo apt install -y nodejs
  
  # installation
  curl -L https://raw.githubusercontent.com/labs-dwcts/the-littlest-jupyterhub/main/bootstrap/bootstrap.py | sudo -E python3 - --admin admin
  
  # git clone
  git clone https://github.com/labs-dwcts/the-littlest-jupyterhub temp
  sudo cp -fr temp/share/jupyterhub/ /opt/tljh/hub/share/
  rm -fr temp

  # settings
  # change default user interface for users
  sudo tljh-config set user_environment.default_app jupyterlab
  
  # enable PAM authenticator
  # sudo tljh-config set auth.type jupyterhub.auth.PAMAuthenticator
  sudo tljh-config reload
  
  # jupyterlab ko-KR language pack
  sudo -E /opt/tljh/user/bin/conda install -c conda-forge -y \
    jupyterlab-language-pack-ko-KR
  
  # extension
  # conda-forge
  sudo -E /opt/tljh/user/bin/conda install -c conda-forge -y \
    nodejs=16 \
    jupyterlab-git \
    jupyterlab-github \
    jupyterlab_execute_time \
    jupyterlab-variableinspector \
    jupyterlab-drawio \
    jupyterlab-lsp \
    python-lsp-server \
    ipywidgets \
    jupyter-archive
  
  # pypi
  sudo -E /opt/tljh/user/bin/pip install \
    jupyterlab-nvdashboard \
    nbconvert
}

#
# 
#
doInstall