#! /usr/bin/bash
# beta 0.1
####################################install_java#####################################
cd /usr/local/src/ && wget -q --no-cookies --no-check-certificate --header \
"Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm"
sudo yum localinstall jdk-8u*-linux-x64.rpm -y
sudo touch /etc/profile.d/java.sh
tee /etc/profile.d/java.sh << EOF
#!/bin/bash
JENKINS_HOME=/opt/jenkins/master
JAVA_HOME=/usr/java/jdk1.8.0_131/
PATH=$JAVA_HOME/bin:$PATHs
export PATH JAVA_HOME
export CLASSPATH=.
export JENKINS_HOME

EOF
sudo chmod +x /etc/profile.d/java.sh
source /etc/profile.d/java.sh
###########Nginx setup############
yum -y install nginx
cat <<EOF > /etc/nginx/conf.d/server.conf
server {
        listen       80 default_server;
        listen       [::]:80 default_server;

        server_name  jenkins;
        add_header backend_srv jenkins;
        #charset koi8-r;
location / {
           proxy_pass http://192.168.15.2:8080;
        }
}

EOF

cat <<EOF > /etc/nginx/nginx.conf
worker_processes  1;
events {
    worker_connections  1024;
}
http {
    include       mime.types;
    default_type  application/octet-stream;
    sendfile        on;
    keepalive_timeout 65;
include /etc/nginx/conf.d/*.conf;

}

EOF
wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
cp /vagrant/jenkins.service /etc/systemd/system/
mkdir -r /opt/jenkins/bin
mv jenkins.war /opt/jenkins/bin/


