#!/usr/bin/env bash

set -e

#
# install jupyterHub (bare metal)
#
doSetDirectory() {
  data="/srv/data"
  setenv="/srv/setenv"
  scratch="/srv/scratch"
  skeldata="/etc/skel/data"
  skelsetenv="/etc/skel/setenv"
  skelscratch="/etc/skel/scratch"
  jupyterhubusers="jupyterhub-users"

  # change group ownership and default permissions to use group
  if [ ! $(getent group "${jupyterhubusers}") ]
    then
      sudo groupadd jupyterhub-users
  else
    echo "${jupyterhubusers} group exists."
  fi

  # create a share directory
  for value in $data $setenv $scratch
    do
      if [ ! -d "${value}" ]
        then
          sudo mkdir -p "${value}"
      else
          echo "Directory already exists."
      fi
  done
  

  # create a symlink $data, $setenv, $scratch to /etc/skel directory
  if [ ! -L "${skeldata}" ]
    then
      sudo ln -s "${data}" "${skeldata}"
  elif [ ! -L "${skelsetenv}" ]
    then
      sudo ln -s "${setenv}" "${skelsetenv}"
  elif [ ! -L "${skelscratch}" ]
    then
      sudo ln -s "${scratch}" "${skelscratch}"
  else
    echo "Symlink already exists."
  fi
  
  sudo chown root:jupyterhub-users "${scratch}" "${setenv}"

  # sudo chmod 777 /srv/scratch
  # sudo chmod 755 /srv/setenv
  # sudo chmod g+s /srv/scratch /srv/setenv

  sudo chmod 777 "${scratch}"
  sudo chmod 755 "${setenv}"
  sudo chmod g+s "${scratch}" "${setenv}"
}

doInstall() {
  # update
  sudo apt update
  
  # prerequisites
  sudo apt install -y build-essential
  sudo apt install -y python3 python3-dev git curl
  curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && sudo apt install -y nodejs
  
  # installation
  curl -L https://raw.githubusercontent.com/labs-dwcts/the-littlest-jupyterhub/main/bootstrap/bootstrap.py | sudo -E python3 - --admin admin
  
  # change jupyterhub directory
  git clone https://github.com/labs-dwcts/the-littlest-jupyterhub temp
  sudo cp -fr temp/share/jupyterhub/ /opt/tljh/hub/share/
  
  # add conda environment
  sudo cp -fr temp/bootstrap/envlist/* /srv/setenv
  
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
doSetDirectory
doInstall