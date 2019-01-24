#!/bin/zsh

DOCKER_SOCKET=/var/run/docker.sock

if [ -S ${DOCKER_SOCKET} ]; then
  DOCKER_GID=$(sudo stat -c '%g' $DOCKER_SOCKET)
  USER=$(whoami)

  sudo chmod 777 $DOCKER_SOCKET

  sudo sed -i "/$USER/d" /etc/sudoers
fi

/bin/zsh $@
