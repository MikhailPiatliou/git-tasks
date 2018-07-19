# -*- mode: ruby -*-
# vi: set ft=ruby :
  
  
  
  
  Vagrant.configure("2") do |config|
  
  
   config.vm.define "JenkinsServer01" do |jenkins|    
      jenkins.vm.box = "sbeliakou/centos-7.4-x86_64-minimal"
      jenkins.vm.hostname = "JenkinsServer01"
      jenkins.vm.network "private_network", ip: "192.168.1.254"
      jenkins.vm.provision "shell", path: "./script.sh"
      config.vm.provider "virtualbox" do |vb|
	  vb.gui = false
	  vb.memory = "2048"
	  vb.name = "JenkinsServer01"
	  end
  end
  
end

 
 
 
 
 
 
 