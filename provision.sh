#! /bin/bash
path_jenkins=/opt/jenkins
JENKINS_HOME=/opt/jenkins/master
JENKINS_DIR=/opt/jenkins/bin
sudo useradd jenkins
sudo mkdir -p  $path_jenkins
sudo yum install mc net-tools vim java-1.8.0-openjdk-devel nginx -y
sudo wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war -P $path_jenkins

sudo cat > /etc/systemd/system/jenkins.service <<EOF
[Unit]
Description=Jenkins Daemon

[Service]
ExecStart=/usr/bin/java -jar $path_jenkins/jenkins.war
User=jenkins
Group=jenkins
Environment=JENKINS_HOME=$JENKINS_HOME
Environment=JENKINS_DIR=$JENKINS_DIR

[Install]
WantedBy=multi-user.target
EOF

sudo chown -R jenkins:jenkins $path_jenkins

systemctl daemon-reload
sudo systemctl start jenkins

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


