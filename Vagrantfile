# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
 
 config.vm.define "jenkins" do |jenkins|
		jenkins.vm.box = "sbeliakou/centos-7.4-x86_64-minimal"
		jenkins.vm.hostname = 'jenkins'
		jenkins.vm.box_url = "sbeliakou/centos-7.4-x86_64-minimal"
		jenkins.vm.network :private_network, ip: "192.168.1.2"
		jenkins.vm.provision "shell", path: "jenkins.sh"		
		jenkins.vm.provider :virtualbox do |v|
			v.customize ["modifyvm", :id, "--memory", 2048]
			v.customize ["modifyvm", :id, "--name","jenkins"]
  		end
	end
end
