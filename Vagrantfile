Vagrant.configure("2") do |config|
  config.vm.define "focal64" do |focal64|
    focal64.vm.box = "ubuntu/focal64"
    focal64.vm.box_check_update = true

    focal64.vm.hostname = "focal64"
    focal64.vm.network "private_network", ip: "192.168.33.10"

    focal64.vm.synced_folder "../", "/home/vagrant/projects"
    focal64.vm.provision :shell, path: "basic_setup.sh", privileged: false
  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

end
