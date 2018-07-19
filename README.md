# Description:
The aim is developing collaboration between team members

during work on the implementation of the same features

by using branching model of Git.

Need to develop Vagrantfile and provisioning script

of automated rolling out of Jenkins server

#### Vagrantfile should include:
- Configuration of VM
- Provisioning script:

  a) Jenkins installed to folder /opt/jenkins/
  
  b) Server should be run under ‘jenkins’ user and started from init script as service
  
  c) JENKINS_HOME=/opt/jenkins/master
  
  d) JENKINS_DIR=/opt/jenkins/bin  ( <- .war is here)
  
  e) Closed by Nginx and available by link http://jenkins
 