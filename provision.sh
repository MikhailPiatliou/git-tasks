#! /bin/bash
path_jenkins=/opt/jenkins
JENKINS_HOME=/opt/jenkins/master
JENKINS_DIR=/opt/jenkins/bin
sudo useradd jenkins
sudo mkdir -p  $path_jenkins
sudo yum install mc net-tools vim java-1.8.0-openjdk-devel -y
sudo wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war -P $path_jenkins

sudo user

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
