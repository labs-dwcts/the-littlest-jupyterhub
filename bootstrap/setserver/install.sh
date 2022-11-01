#!/bin/bash
## This gist contains instructions about cuda v11.2 and cudnn 8.1.1 installation in Ubuntu 20.04 for Tensorflow 2.10.0

### If you have previous installation remove it first. 
sudo apt-get purge nvidia*
sudo apt remove nvidia-*
sudo rm /etc/apt/sources.list.d/cuda*
sudo apt-get autoremove && sudo apt-get autoclean
sudo rm -rf /usr/local/cuda*


### to verify your gpu is cuda enable check
lspci | grep -i nvidia

### gcc compiler is required for development using the cuda toolkit. to verify the version of gcc install enter
gcc --version

# system update
sudo apt-get update
sudo apt-get upgrade -y


# install other import packages
sudo apt-get install build-essential g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev gnupg2 curl ca-certificates -y


# first get the PPA repository driver
sudo add-apt-repository ppa:graphics-drivers/ppa
release="ubuntu"$(lsb_release -sr | sed -e "s/\.//g")
sudo apt-key del 7fa2af80
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt-key adv --fetch-keys "http://developer.download.nvidia.com/compute/cuda/repos/"$release"/x86_64/7fa2af80.pub"
sudo sh -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/'$release'/x86_64 /" > /etc/apt/sources.list.d/nvidia-cuda.list'
sudo sh -c 'echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/'$release'/x86_64 /" > /etc/apt/sources.list.d/nvidia-machine-learning.list'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC
sudo apt-get update


# installing CUDA-11.2
sudo apt-get -o Dpkg::Options::="--force-overwrite" install cuda-11-2 cuda-drivers -y


# setup your paths
echo 'export PATH=/usr/local/cuda-11.2/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-11.2/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc
sudo ldconfig

# install cuDNN v8.1.1
# in order to download cuDNN you have to be regeistered here https://developer.nvidia.com/developer-program/signup
# then download cuDNN v8.1.1 form https://developer.nvidia.com/cudnn

CUDNN_TAR_FILE="cudnn-11.2-linux-x64-v8.1.1.33.tgz"
wget https://developer.nvidia.com/compute/machine-learning/cudnn/secure/8.1.1.33/11.2_20210301/cudnn-11.2-linux-x64-v8.1.1.33.tgz
tar -zxvf ${CUDNN_TAR_FILE}


# copy the following files into the cuda toolkit directory.
sudo cp -P cuda/include/cudnn.h /usr/local/cuda-11.2/include
sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda-11.2/lib64/
sudo chmod a+r /usr/local/cuda-11.2/lib64/libcudnn*

# Finally, to verify the installation, check
nvidia-smi
nvcc -V

# install Tensorflow (an open source machine learning framework)
# I choose version 2.10.0 because it is stable and compatible with CUDA 11.2 Toolkit and cuDNN 8.1

sudo pip3 install --user tensorflow==2.10.0