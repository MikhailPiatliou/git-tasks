#! /usr/bin/bash
# beta 0.1
###########Nginx setup############
yum -y install nginx
yum -y install java
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




wget -q  http://mirrors.jenkins.io/war-stable/latest/jenkins.war
cp /vagrant/jenkins.service /etc/systemd/system/


#cp /vagrant/jenkins.service /etc/systemd/system/

