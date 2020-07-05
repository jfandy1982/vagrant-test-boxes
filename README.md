# Test Infrastructure with Vagrant

This repository contains definitions of vagrant boxes for testing developments in my other repositories. Execute command `vagrant up` in this folder to spin up all defined boxes in the file `Vagrantfile`. Up to now, there are only two boxes defined in the configuration:

- Ubuntu 64 (no UI): Spin it up with `vagrant up bionic64`
- Linux Mint 19: Spin it up with `vagrant up mint19`

The initialization script stored in bash script `basic_setup.sh` only perfoms minimal actions. It updates the packages, it installs a few basic packages incl. language packs for German and it finally sets the timezone to "Europe/Berlin".

The maintenance of the locally available vagrant boxes can be done as follows:

- Update to the latest image available in online Vagrant Repository: `vagrant box update [box name]`
- Remove outdated images: `vagrant box prune`
