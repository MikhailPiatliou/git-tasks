Vagrant.configure("2") do |config|

	config.vm.box = "sbeliakou/centos-7.4-x86_64-minimal"  
	config.vm.define "nginx-2" do |node|
	config.vm.provider "virtualbox" do |vb|	
		node.vm.network "private_network", ip:"192.168.100.200"
		node.vm.provision "shell", path: "./installjen.sh"
	end
	end
end
