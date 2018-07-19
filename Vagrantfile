Vagrant.configure("2") do |config|
  
  config.vm.define "jenkins" do |jenkins|    
      jenkins.vm.box = "sbeliakou/centos-7.4-x86_64-minimal"
      jenkins.vm.hostname = "jenkins"
      jenkins.vm.network  "private_network", ip: "192.168.1.2"
      jenkins.vm.provision "shell", path: "./configureJenkins.sh"
      config.vm.provider "virtualbox" do |vb|
	  vb.gui = false
	  vb.memory= 2048
	  vb.name = "jenkins"
	  end
  end
 end
