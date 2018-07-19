#!/bin/sh

#installing needed software
yum -y --nogpgcheck install java mc net-tools nano screen pcre-devel zlib-devel;
#installing jenkins
screen -t jenkins -dm bash -c '
mkdir /home/vagrant/jenk;
cd $_;
wget https://mirrors.tuna.tsinghua.edu.cn/jenkins/war-stable/latest/jenkins.war;
wall "Jenkins is installed.";
java -jar ./jenkins.war;
'
#installing nginx
screen -t "nginx" -dm bash -c 'mkdir /home/vagrant/nginx;
cd $_;
wget http://nginx.org/download/nginx-1.14.0.tar.gz;
tar -xf ./nginx-1.14.0.tar.gz; cd nginx-1.14.0;
wall "nginx is installed";
./configure; make; make install;
touch /var/log/nginx/jenkins.access.log;
rm /usr/local/nginx/conf/nginx.conf;
cp /vagrant/nginx.conf /usr/local/nginx/conf/;
./objs/nginx;
'
