#!/usr/bin/env bash

failed_dependency() {
  local message=$1

  echo "Script failed because of missing dependency: $message."
  exit 1
}

if ! which docker &>/dev/null; then
  failed_dependency "Docker is not installed"
fi

if ! which git &>/dev/null; then
  failed_dependency "Git is not installed"
fi

if ! which docker-compose &>/dev/null; then
  failed_dependency "Docker Compose is not installed"
fi

if [[ $(whoami) = "root" ]]; then
  failed_dependency "Can not be installed as root"
fi

if ! getent group docker | grep $(whoami) &>/dev/null; then
  failed_dependency "User is not on the Docker group"
fi

echo "Cloning repository..."

git clone git://github.com/cfcosta/workstation $HOME/.workstation

echo "Adding binary to \$PATH"

sudo ln -s $HOME/.workstation/bin/workstation /usr/local/bin/workstation

