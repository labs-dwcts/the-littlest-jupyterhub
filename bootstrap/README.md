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
wget -qO- https://raw.githubusercontent.com/labs-dwcts/the-littlest-jupyterhub/main/bootstrap/install.sh | sudo bash
```

### curl

```
curl -L https://raw.githubusercontent.com/labs-dwcts/the-littlest-jupyterhub/main/bootstrap/install.sh | sudo bash
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
sudo wget -qO- https://raw.githubusercontent.com/labs-dwcts/the-littlest-jupyterhub/main/bootstrap/container/installdocker.sh | sh && sudo systemctl --now enable docker
```

### curl

```
sudo curl -L https://raw.githubusercontent.com/labs-dwcts/the-littlest-jupyterhub/main/bootstrap/container/installdocker.sh | sh && sudo systemctl --now enable docker
```

## Add Docker group

```
sudo usermod -a -G docker $USER
newgrp docker
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

## Login

Login admin

- admin:password

```
http://{Server IP}
```
