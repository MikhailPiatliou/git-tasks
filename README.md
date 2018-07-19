### Project summary  

This project purpose is to develop vagrant provisioner script that will start up virtual machine with running jenkins behind nginx proxy.
There are 2 students working on it Hleb Viniarski and Oleg Monko.


### Project consists:

- Vagrantfile - file for creating virual machine.
- jenkins.sh - provisioning script for installing Jenkins.
- nginx - folder for nginx config files. 
- jenkins.service - systemd script for jenkins.

### Project features:

- Jenkins installed to folder /opt/jenkins/
- Jenkins runs under ‘jenkins’ user and started from systemd script as service
- JENKINS_HOME=/opt/jenkins/master
- JENKINS_DIR=/opt/jenkins/bin
- Jenkins closed by Nginx and available by link http://jenkins
 
