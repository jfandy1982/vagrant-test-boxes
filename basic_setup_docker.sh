#!/usr/bin/env bash

# Steps are taken from:
# - Docker engine:
#     https://docs.docker.com/engine/install/ubuntu/
# - Portainer.io:
#     https://documentation.portainer.io/v2.0/deploy/ceinstalldocker/ > "Docker on Linux"
# - Idea with file provisioning to enable remote access to docker within vagrant:
#     https://github.com/bubabi/vagrant-with-docker

# update the apt package index
sudo apt-get update -y

# allow apt to use a repository over HTTPS
sudo apt-get -y install \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

# add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# add Docker's stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# install docker engine
sudo apt-get update -y
sudo apt-get -y install docker-ce docker-ce-cli docker-compose containerd.io
sudo docker run hello-world

# Post-installation steps
# User/Usergroup setup
sudo echo "Post-installation steps for Docker"
sudo echo "Add user [vagrant] to group [docker]"
sudo usermod -aG docker vagrant
sudo echo "done..."

# Start Docker on boot
sudo echo "Enable docker service at boot"
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo echo "done..."

# Configure remote access with systemd unit file
# conf file is placed by file provisioner (see Vagrantfile)
sudo echo "Configure remote access with systemd unit file"
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo mv /tmp/docker.service.override.conf /etc/systemd/system/docker.service.d/override.conf

# reload configuration
sudo systemctl daemon-reload
sudo systemctl restart docker.service
sudo ps -ax | grep docker
sudo echo "done..."

# Install docker container mgmt tool [portainer-ce]
sudo echo "Install [portainer-ce/latest]"
sudo docker volume create portainer_data
sudo docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
sudo echo "done..."
