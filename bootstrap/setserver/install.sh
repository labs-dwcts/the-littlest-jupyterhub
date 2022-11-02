#!/bin/bash
## OS : Ubuntu 20.04


# nvidia remove 
sudo apt-get purge nvidia* -y
sudo apt remove nvidia-* -y
sudo rm /etc/apt/sources.list.d/cuda*
sudo apt-get autoremove -y && sudo apt-get autoclean -y
sudo rm -rf /usr/local/cuda*

# update & upgrade
sudo apt update && sudo apt upgrade -y


# auto upgrade disable
sudo apt remove unattended-upgrades -y


# install development tools
sudo apt install build-essential -y


# nvidia driver 460.91.03
wget https://us.download.nvidia.com/XFree86/Linux-x86_64/460.91.03/NVIDIA-Linux-x86_64-460.91.03.run
sudo sh NVIDIA-Linux-x86_64-460.91.03.run --ui=none --no-questions --accept-license --disable-nouveau --no-cc-version-check --install-libglvnd


# cuda 11.2
wget https://developer.download.nvidia.com/compute/cuda/11.2.0/local_installers/cuda_11.2.0_460.27.04_linux.run
sudo sh cuda_11.2.0_460.27.04_linux.run --silent --toolkit --samples --override --override-driver-check --toolkitpath=/usr/local/cuda-11.2 --samplespath=/usr/local/cuda-11.2/samples


# cuda path
echo 'export PATH=/usr/local/cuda-11.2/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-11.2/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
# source ~/.bashrc
sudo ldconfig


# cudnn 8.1.1.33
# https://developer.nvidia.com/rdp/cudnn-archive
# https://developer.nvidia.com/rdp/cudnn-archive#a-collapse811-111
# wget https://developer.nvidia.com/compute/machine-learning/cudnn/secure/8.1.1.33/11.2_20210301/cudnn-11.2-linux-x64-v8.1.1.33.tgz
# or
# google drive
# https://drive.google.com/file/d/1-1TFu6U7yIXYPU5JEuB9bI4LOTyfKCz1/view?usp=sharing
FILEID="1-1TFu6U7yIXYPU5JEuB9bI4LOTyfKCz1"
FILENAME="cudnn-11.2-linux-x64-v8.1.1.33.tgz"
curl -sc ~/cookie.txt "https://drive.google.com/uc?export=download&id=${FILEID}" > /dev/null
curl -Lb ~/cookie.txt "https://drive.google.com/uc?export=download&confirm=`awk '/_warning_/ {print $NF}' ~/cookie.txt`&id=${FILEID}" -o ${FILENAME}

# cudnn-11.2-linux-x64-v8.1.1.33.tgz
# md5sum
# 5078ca954fcaef547aaf466555f8c4ca
#
# sha1sum
# 0928a491bf7abb4eee975138cec6b3249a87e3d1

tar -zxvf cudnn-11.2-linux-x64-v8.1.1.33.tgz
sudo cp -P cuda/include/cudnn.h /usr/local/cuda-11.2/include
sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda-11.2/lib64/
sudo chmod a+r /usr/local/cuda-11.2/lib64/libcudnn*


# runlevel (init 3)
sudo systemctl set-default multi-user.target


# check
nvidia-smi && /usr/local/cuda-11.2/bin/nvcc -V && cat /proc/driver/nvidia/version && cat /proc/driver/nvidia/gpus/0000\:c1\:00.0/information


# install golang
wget https://go.dev/dl/go1.19.3.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.19.3.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
# source ~/.bashrc
go version

echo 'reboot & test'