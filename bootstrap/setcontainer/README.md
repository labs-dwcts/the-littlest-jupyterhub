# DockerHub Repository

DockerHub
https://hub.docker.com/r/labsdwcts/dwcts-tljh

# Set Container

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
newgrp docker
```

## Install dwcts-tljh

Use `wget` or `curl`

### wget

```
sudo wget -qO- https://raw.githubusercontent.com/labs-dwcts/the-littlest-jupyterhub/main/bootstrap/setcontainer/installdwctstljh.sh | sh
```

### curl

```
sudo curl -L https://raw.githubusercontent.com/labs-dwcts/the-littlest-jupyterhub/main/bootstrap/setcontainer/installdwctstljh.sh | sh
```

## Shell inside the running docker container

```
docker exec -it dwcts-tljh /bin/bash
```

## Test login

Login admin

- admin:password

```
http://{Server IP}
```

## commit container

check `docker ps --all` and `docker images`

```
docker commit tljh-systemd dwcts-tljh
```

## push container

```
docker login
```

input dockerhub `username` and `password`

```
export DOCKER_ID_USER=labsdwcts
```

```
docker tag dwcts-tljh $DOCKER_ID_USER/dwcts-tljh
```

```
docker push $DOCKER_ID_USER/dwcts-tljh
```

## pull container

```
docker pull labsdwcts/dwcts-tljh
```
