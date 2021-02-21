# Test Infrastructure with Vagrant

This repository contains definitions of vagrant boxes for testing developments in my other repositories. Execute command `vagrant up` in this folder to spin up all defined boxes in the file `Vagrantfile`.

- Ubuntu 64 (no UI): Spin it up with `vagrant up focal64`
- Docker on Ubuntu 64 (no UI): Spin it up with `vagrant up docker`

The maintenance of the locally available vagrant boxes can be done as follows:

- Update to the latest image available in online Vagrant Repository: `vagrant box update [box name]`
- Remove outdated images: `vagrant box prune`

## Prerequisites

### Oracle VirtualBox

The configured vagrant boxes use [Oracle VirtualBox](https://www.virtualbox.org) as virtualization tool. It has to be installed together with the VirtualBox Guest Additions. The most current version can be used.

### Vagrant Plugins

The following vagrant plugins are required in the local setup:

- vagrant-clean: Destroy all vagrant ressources for all vagrant environments (see [here](https://github.com/mspaulding06/vagrant-clean))
- vagrant-vbguest: Install the host's VB Guest Additions on the guest system (see [here](https://github.com/dotless-de/vagrant-vbguest))

The vagrant plugins can be installed using the command `vagrant plugin install vagrant-clean vagrant-vbguest`

### Synced folder

The configuration of these vagrant boxes will mount a folder on the host to path `/home/vagrant/projects` within the vagrant box. My personal folder layout allows that configuration, because I put this repository `jfandy1982/vagrant-test-boxes` into a folder `~/Projekte/Git-Repos/jfandy1982/`. As I want to use these boxes for isolated tests of my developments, I explicitely want to mount the other projects into the vagrant playground. It is probably not the most ideal option, but as long as I didn't containerize everything, it is OK for me. Check that setup individually.

## Defined vagrant boxes

### focal64

Use this vagrant box for experiments on a plain Ubuntu - e.g. bash scripting.

The initialization script stored in bash script `basic_setup_ubuntu.sh` only perfoms minimal actions. It updates the packages via APT, it installs a few basic packages incl. language packs for German and it finally sets the timezone to "Europe/Berlin".

### docker

Use this vagrant box for app development. It contains a docker installation to spin up various containers.

The initialization script stored in bash script `basic_setup_ubuntu.sh` only perfoms minimal actions. It updates the packages, it installs a few basic packages incl. language packs for German and it finally sets the timezone to "Europe/Berlin".

The script stored in bash script `basic_setup_docker.sh` installs the docker engine as described in the official Docker installation guide for [Ubuntu](https://docs.docker.com/engine/install/ubuntu/). It also configures the docker service:

- use docker CLI with regular user `vagrant`
- to start up on every boot
- be accessible from the network
