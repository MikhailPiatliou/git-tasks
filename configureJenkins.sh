#!/bin/sh
#installing needed software
yum -y --nogpgcheck install java mc net-tools nano screen pcre-devel zlib-devel;
#adding jenkins user
useradd jenkins;
#copying jenkins init script
cp /vagrant/jenkins.service /etc/systemd/system/
#installing jenkins
screen -t jenkins -dm bash -c '
export JENKINS_HOME=/opt/jenkins/master;
export JENKINS_DIR=/opt/jenkins/bin;
mkdir -p $JENKINS_HOME;
mkdir -p $JENKINS_DIR;
cd $_;
wget https://mirrors.tuna.tsinghua.edu.cn/jenkins/war-stable/latest/jenkins.war;
wall "Jenkins is installed.";
service jenkins start
'
#installing nginx
screen -t "nginx" -dm bash -c 'mkdir /home/vagrant/nginx;
cd $_;
wget http://nginx.org/download/nginx-1.14.0.tar.gz;
tar -xf ./nginx-1.14.0.tar.gz; cd nginx-1.14.0;
./configure; make; make install;
mkdir /var/log/nginx;
touch /var/log/nginx/jenkins.access.log;
rm /usr/local/nginx/conf/nginx.conf;
cp /vagrant/nginx.conf /usr/local/nginx/conf/;
wall "nginx is installed";
./objs/nginx;
'
