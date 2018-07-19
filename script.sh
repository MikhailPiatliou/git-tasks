#! /bin/bash

dir=/home/vagrant


# 1. Install prerequisites for Jenkins server (Java)

cd /usr/local/src/

wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \


chmod +x jdk-8u131-linux-x64.rpm


yum localinstall jdk-8u*-linux-x64.rpm -y


wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jre-8u181-linux-x64.rpm

sudo yum localinstall jre-8u181-linux-x64.rpm -y

export JAVA_HOME=/usr/java/jdk1.8.0_181/

export PATH=$PATH:$JAVA_HOME

cp /vagrant/java.sh /etc/profile.d/


# 2. Jenkins server
java -jar jenkins.war



# 3. Install nginx
yum install nginx -y


cp /vagrant/nginx.conf /etc/nginx/


