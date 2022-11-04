# cuda 11.2, cudnn 8.1.1.33


sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.2.0/local_installers/cuda-repo-ubuntu2004-11-2-local_11.2.0-460.27.04-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2004-11-2-local_11.2.0-460.27.04-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu2004-11-2-local/7fa2af80.pub
sudo apt-get update


sudo apt-get -y install cuda


FILEID="1-1TFu6U7yIXYPU5JEuB9bI4LOTyfKCz1"
FILENAME="cudnn-11.2-linux-x64-v8.1.1.33.tgz"
curl -sc ~/cookie.txt "https://drive.google.com/uc?export=download&id=${FILEID}" > /dev/null
curl -Lb ~/cookie.txt "https://drive.google.com/uc?export=download&confirm=`awk '/_warning_/ {print $NF}' ~/cookie.txt`&id=${FILEID}" -o ${FILENAME}
rm -fr cookie.txt
tar -xzvf cudnn-11.2-linux-x64-v8.1.1.33.tgz

sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*

echo 'export LD_LIBRARY_PATH=/usr/local/cuda-11.2/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/lib/cuda/include:$LD_LIBRARY_PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
echo 'export PATH=/usr/local/cuda-11.2/bin:$PATH' >> ~/.bashrc
echo 'export PATH=/usr/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

sudo modprobe nvidia
sudo update-initramfs -u
sudo reboot