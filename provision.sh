#!/bin/bash

yum -y install java-1.8.0-openjdk-devel vim nginx

#configure Nginx server for navigation to Jenkins without port
cat  > /etc/nginx/conf.d/jenkins.conf <<EOF
upstream jenkins {
                server 127.0.0.1:8080;
                }

server {
    listen      80;
    server_name jenkins;

    access_log  /opt/jenkins/log/access.log;
    error_log   /opt/jenkins/log/error.log;

    proxy_buffers 16 64k;
    proxy_buffer_size 128k;

    location / {
        proxy_pass  http://jenkins;
        proxy_next_upstream error timeout invalid_header http_500 http_502 http_503 http_504;
        proxy_redirect off;

    }
}
EOF

systemctl enable nginx
systemctl start nginx



