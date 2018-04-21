BOX = "bento/centos-7.4"
BOX_VERSION = "201801.02.0"

Vagrant.configure("2") do |config|
  config.vm.define "r1-host1" do |d|
    d.vm.box = BOX
    d.vm.box_version = BOX_VERSION
    d.vm.box_check_update = false
    d.vm.hostname = "r1-host1"
    d.vm.network "private_network", ip: "192.168.33.101"
    d.vm.provider "virtualbox" do |p|
      p.cpus = "1"
      p.memory = "512"
      p.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
    end
  end

  config.vm.define "r1-host2" do |d|
    d.vm.box = BOX
    d.vm.box_version = BOX_VERSION
    d.vm.box_check_update = false
    d.vm.hostname = "r1-host2"
    d.vm.network "private_network", ip: "192.168.33.102"
    d.vm.provider "virtualbox" do |p|
      p.cpus = "1"
      p.memory = "512"
      p.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
    end
  end

  config.vm.define "r2-host1" do |d|
    d.vm.box = BOX
    d.vm.box_version = BOX_VERSION
    d.vm.box_check_update = false
    d.vm.hostname = "r2-host1"
    d.vm.network "private_network", ip: "192.168.33.111"
    d.vm.provider "virtualbox" do |p|
      p.cpus = "1"
      p.memory = "512"
      p.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
    end
  end

  config.vm.define "r2-host2" do |d|
    d.vm.box = BOX
    d.vm.box_version = BOX_VERSION
    d.vm.box_check_update = false
    d.vm.hostname = "r2-host2"
    d.vm.network "private_network", ip: "192.168.33.112"
    d.vm.provider "virtualbox" do |p|
      p.cpus = "1"
      p.memory = "512"
      p.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
    end
  end

  config.vm.define "r3-host1" do |d|
    d.vm.box = BOX
    d.vm.box_version = BOX_VERSION
    d.vm.box_check_update = false
    d.vm.hostname = "r3-host1"
    d.vm.network "private_network", ip: "192.168.33.121"
    d.vm.provider "virtualbox" do |p|
      p.cpus = "1"
      p.memory = "512"
      p.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
    end
  end

  config.vm.define "r3-host2" do |d|
    d.vm.box = BOX
    d.vm.box_version = BOX_VERSION
    d.vm.box_check_update = false
    d.vm.hostname = "r3-host2"
    d.vm.network "private_network", ip: "192.168.33.122"
    d.vm.provider "virtualbox" do |p|
      p.cpus = "1"
      p.memory = "512"
      p.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
    end
  end

end
