#! /bin/bash

yum install -y java-1.8.0-openjdk nginx
mkdir -p /opt/jenkins/bin
cd /opt/jenkins/bin
wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
systemctl enable nginx
sed -i -e 's/\(^\s*location \/ {\)/\1\n\t    proxy_pass http:\/\/127.0.0.1:8080;/' /etc/nginx/nginx.conf
systemctl start nginx
useradd jenkins

systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins 

