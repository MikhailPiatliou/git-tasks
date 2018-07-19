# The diagram of our workflow.
![picture](img/Diagram.png)

## Team members:

Aliaksandr Aranski, Yauheni Papkou

Project includes:
1. Vagrant file for creating environment for Jenkins server.
2. Provisioning script jenkins.sh script for installing and running jenkins.sh.

Provisioning script:

a) Jenkins installed to folder /opt/jenkins/
b) Server should be run under ‘jenkins’ user and started from init script as service
c) JENKINS_HOME=/opt/jenkins/master
d) JENKINS_DIR=/opt/jenkins/bin  ( <- .war is here)
e) Closed by Nginx and available by link http://jenkins



