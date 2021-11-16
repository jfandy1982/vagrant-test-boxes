Vagrant.configure("2") do |config|

  # Plain Ubuntu (current stable release)
  config.vm.define "focal64" do |focal64|
    focal64.vm.box = "ubuntu/focal64"
    focal64.vm.box_check_update = true

    focal64.vm.hostname = "focal64"
    focal64.vm.network "private_network", ip: "192.168.56.10"

    focal64.vm.synced_folder "../../../", "/home/vagrant/projects"

    focal64.vm.provision :shell, path: "basic_setup_ubuntu.sh", privileged: false
  end

  # Ubuntu with prepared docker setup
  config.vm.define "docker" do |docker|
    docker.vm.box = "ubuntu/focal64"
    docker.vm.box_check_update = false

    docker.vm.hostname = "docker"
    docker.vm.network "private_network", ip: "192.168.56.20"
    docker.vm.network "forwarded_port", guest: 2375, host: 2375

    docker.vm.synced_folder "../../../", "/home/vagrant/projects"

    docker.vm.provision :shell, path: "basic_setup_ubuntu.sh", privileged: false
    docker.vm.provision "file", source: "./config/docker.service.override.conf", destination: "/tmp/docker.service.override.conf"
    docker.vm.provision :shell, path: "basic_setup_docker.sh", privileged: false
  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

end
