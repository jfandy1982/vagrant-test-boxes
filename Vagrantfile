Vagrant.configure("2") do |config|

  # Plain Ubuntu (current stable release)
  config.vm.define "jammy64" do |jammy64|
    jammy64.vm.box = "ubuntu/jammy64"
    jammy64.vm.box_check_update = true

    jammy64.vm.hostname = "jammy64"
    jammy64.vm.network "private_network", ip: "192.168.56.10"

    jammy64.vm.synced_folder "../../../", "/home/vagrant/projects"

    jammy64.vm.provision :shell, path: "basic_setup_ubuntu.sh", privileged: false
  end

  # Ubuntu with prepared docker setup
  config.vm.define "docker" do |docker|
    docker.vm.box = "ubuntu/jammy64"
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
