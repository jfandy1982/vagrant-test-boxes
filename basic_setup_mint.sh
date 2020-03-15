#!/usr/bin/env bash

# update the apt package index
sudo apt-get update -y
sudo apt upgrade -y

# allow apt to use a repository over HTTPS
sudo apt-get -y install \
  apt-transport-https \
  ca-certificates \
  console-data \
  curl \
  language-pack-de \
  language-pack-de-base \
  software-properties-common

# adjust timezone settings
sudo echo "Europe/Berlin" | sudo tee /etc/timezone
sudo dpkg-reconfigure -f noninteractive tzdata
