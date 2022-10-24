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
`wget` 또는 `curl` 로 설치 합니다.
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

`wget` 또는 `curl` 로 설치 합니다.
### wget
```
sudo wget -qO- https://raw.githubusercontent.com/labs-dwcts/the-littlest-jupyterhub/main/bootstrap/installdocker.sh | sh
```

### curl
```
sudo curl -L https://raw.githubusercontent.com/labs-dwcts/the-littlest-jupyterhub/main/bootstrap/installdocker.sh | sh
```

## Add Docker group
dockeruserset.sh
```
sudo usermod -a -G docker $USER
```

## Install dwcts-tljh
```
sudo wget -qO- https://raw.githubusercontent.com/labs-dwcts/the-littlest-jupyterhub/main/bootstrap/installtljhdocker.sh | sh
```

## Docker Pull
dockerpull.sh
```
docker pull labs/tljh-dw
```

## Test tljh-dwcts is with Docker
dockerrun.sh
```
docker run \
  --privileged \
  --detach \
  --name=tljh-dw \
  --publish 12000:80 \
  --mount type=bind,source=$(pwd),target=/srv/src \
  hsblabs/tljh-dw
```

## Shell inside the running docker container
```
docker exec -it tljh-dw /bin/bash
```

## Login
Login admin
 - admin:password
```
http://{Server IP}:12000
```