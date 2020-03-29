Vagrant.configure("2") do |config|
  config.vm.define "bionic64" do |bionic64|
    bionic64.vm.box = "ubuntu/bionic64"
    bionic64.vm.box_check_update = true

    bionic64.vm.hostname = "bionic64"
    bionic64.vm.network "private_network", ip: "192.168.33.10"

    bionic64.vm.synced_folder "../", "/home/vagrant/projects"
    bionic64.vm.provision :shell, path: "basic_setup.sh", privileged: false
  end

  config.vm.define "mint19" do |mint19|
    mint19.vm.box = "mrlesmithjr/linuxmint-19.3"
    mint19.vm.box_check_update = true

    mint19.vm.hostname = "mint19"
    mint19.vm.network "private_network", ip: "192.168.33.11"

    mint19.vm.synced_folder "../", "/home/vagrant/projects"
    mint19.vm.provision :shell, path: "basic_setup.sh", privileged: false
  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

end
