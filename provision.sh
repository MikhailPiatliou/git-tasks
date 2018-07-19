#! /usr/bin/bash
# beta 0.1
####################################install_java#####################################
cd /usr/local/src/ && wget -q --no-cookies --no-check-certificate --header \
"Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm"
sudo yum localinstall jdk-8u*-linux-x64.rpm -y
#sudo rm -f /usr/local/src/jdk-8u*-linux-x64.rpm
sudo touch /etc/profile.d/java.sh
tee /etc/profile.d/java.sh << EOF
#!/bin/bash
JAVA_HOME=/usr/java/jdk1.8.0_131/
PATH=$JAVA_HOME/bin:$PATHs
export PATH JAVA_HOME
export CLASSPATH=.
EOF
sudo chmod +x /etc/profile.d/java.sh
source /etc/profile.d/java.sh
###################################################################################
cp /vagrant/jenkins.service /etc/systemd/system/

