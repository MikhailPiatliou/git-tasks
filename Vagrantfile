# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "sbeliakou/centos-7.4-x86_64-minimal"

  config.vm.define "nginx" do |nginx|
    nginx.vm.provider :"virtualbox" do |virt|
      virt.name = "jenkins"
      virt.memory = "4096"
    end
    nginx.vm.hostname = "jenkins"
    nginx.vm.network "private_network", ip: "192.168.1.2"
    nginx.vm.provision :shell, path: "provision.sh"
  end
  
end
