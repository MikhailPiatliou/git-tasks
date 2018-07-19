#!/bin/sh
yum -y --nogpgcheck install java-1.8.0-openjdk-devel.x86_64 nginx mc net-tools nano screen pcre-devel zlib-devel;
mkdir -p /opt/jenkins/bin /opt/jenkins/master
cd /opt/jenkins/bin
wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
systemctl nginx start
useradd jenkins
cp /vagrant/jenkins.service  /etc/systemd/system
export JENKINS_HOME=/opt/jenkins/master
export JENKINS_DIR=/opt/jenkins/bin
PATH=$PATH:$JENKINS_HOME:$JENKINS_DIR
export PATH
systemctl daemon-reload;
systemctl start jenkins;