#!/bin/sh

#installing needed software
yum -y --nogpgcheck install java mc net-tools nano screen pcre-devel zlib-devel;

#installing jenkins
screen -t jenkins -dm bash -c '
mkdir /opt/jenkins/ && cd $_;
mkdir master
mkdir bin
wget https://mirrors.tuna.tsinghua.edu.cn/jenkins/war-stable/latest/jenkins.war;
useradd -d /opt/jenkins/master jenkins;
mv jenkins.war bin/;
cat << EOF > /etc/systemd/system/jenkins.service
[Unit]
Description=Jenkins Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/java -jar /opt/jenkins/bin/jenkins.war
Restart=always
User=jenkins

[Install]
WantedBy=multi-user.target
EOF
export JENKINS_HOME=/opt/jenkins/master
export JENKINS_DIR=/opt/jenkins/bin
PATH=$PATH:$JENKINS_HOME:$JENKINS_DIR
export PATH
# cp /vagrant/jenkins.service /etc/systemd/system/;
systemctl daemon-reload;
systemctl start jenkins;
wall "Jenkins was installed and started.";
'

#installing nginx
screen -t "nginx" -dm bash -c 'mkdir /home/vagrant/nginx;
cd $_;
wget http://nginx.org/download/nginx-1.14.0.tar.gz;
tar -xf ./nginx-1.14.0.tar.gz; cd nginx-1.14.0;
wall "nginx was installed";
./configure; make; make install;
touch /var/log/nginx/jenkins.access.log;
rm /usr/local/nginx/conf/nginx.conf;
cp /vagrant/nginx.conf /usr/local/nginx/conf/;
./objs/nginx;
'
