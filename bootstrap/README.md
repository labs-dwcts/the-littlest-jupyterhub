# dwcts-the-littlest-jupyterhub

# Bare metal

## Prerequisites
### install build tools
```
sudo apt-get install -y build-essential
```
### Node.js
```
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - &&\
sudo apt-get install -y nodejs
```

## Installation
Use `wget` or `curl`
### wget
```
sudo wget -qO- https://raw.githubusercontent.com/labs-dwcts/the-littlest-jupyterhub/main/bootstrap/install.sh | sh
```


### curl
```
sudo curl -L https://raw.githubusercontent.com/labs-dwcts/the-littlest-jupyterhub/main/bootstrap/install.sh | sh
```

## Login
Login admin
 - admin:password
```
http://{Server IP}
```

# Docker

## Install Docker

Use `wget` or `curl`
### wget
```
sudo wget -qO- https://raw.githubusercontent.com/labs-dwcts/the-littlest-jupyterhub/main/bootstrap/container/installdocker.sh | sh
```

### curl
```
sudo curl -L https://raw.githubusercontent.com/labs-dwcts/the-littlest-jupyterhub/main/bootstrap/container/installdocker.sh | sh
```

## Add Docker group
```
sudo usermod -a -G docker $USER
```

## Run dwcts-tljh

Use `wget` or `curl`
### wget
```
sudo wget -qO- https://raw.githubusercontent.com/labs-dwcts/the-littlest-jupyterhub/main/bootstrap/container/rundwctstljh.sh | sh
```

### curl
```
sudo curl -L https://raw.githubusercontent.com/labs-dwcts/the-littlest-jupyterhub/main/bootstrap/container/rundwctstljh.sh | sh
```

## Shell inside the running docker container
```
docker exec -it dwcts-tljh /bin/bash
```

## Login
Login admin
 - admin:password
```
http://{Server IP}:12000
```


## DockerHub Repository
DockerHub
https://hub.docker.com/r/labsdwcts/dwcts-tljh

```
docker pull labsdwcts/dwcts-tljh
```

## Install dwcts-tljh
```
git clone https://github.com/labs-dwcts/the-littlest-jupyterhub.git install
cd install/bootstrap/container
sudo bash ./installtljh.sh
cd ../../
rm -fr install
```