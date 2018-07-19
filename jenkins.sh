#!/bin/bash
echo "Downloading files"

rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y gc gcc gcc-c++ pcre-devel zlib-devel make wget openssl-devel git java-1.8.0-openjdk
wget -nv https://nginx.org/download/nginx-1.14.0.tar.gz
wget http://www.openssl.org/source/openssl-1.0.2o.tar.gz


echo "Extracting files"
tar zxf openssl-1.0.2o.tar.gz
tar zxf nginx-1.14.0.tar.gz

echo "Building NGINX from sources"
cd nginx-1.14.0
git clone git://github.com/vozlt/nginx-module-vts.git
./configure --prefix=/home/vagrant/nginx \
		 --sbin-path=/home/vagrant/nginx/sbin/nginx \
		 --conf-path=/home/vagrant/nginx/conf/nginx.conf \
		 --error-log-path=/home/vagrant/nginx/logs/error.log \
		 --http-log-path=/home/vagrant/nginx/logs/access.log \
		 --pid-path=/home/vagrant/nginx/logs/nginx.pid \
		 --without-http_gzip_module \
		 --with-http_ssl_module \
		 --with-http_realip_module \
		 --with-pcre \
		 --add-module=nginx-module-vts\
		 --user=vagrant \
		 --with-openssl=/home/vagrant/openssl-1.0.2o \

make
make install

echo "Copying NGINX configuration files"
mkdir -p /home/vagrant/nginx/conf/vhosts
cp -rf /vagrant/nginx/jenkins.conf /home/vagrant/nginx/conf/vhosts/
cp -rf /vagrant/nginx/nginx.service /lib/systemd/system/
cp -rf /vagrant/nginx/nginx.conf /home/vagrant/nginx/conf/

echo "Starting services"
systemctl enable nginx.service
systemctl start nginx.service

echo "Cleanup"
rm -rf /home/vagrant/nginx-1.14.0
rm -rf /home/vagrant/nginx-1.14.0.tar.gz
rm -rf /home/vagrant/openssl-1.0.2o.tar.gz
rm -rf /home/vagrant/openssl-1.0.2o

echo "Installing jenkins..."
useradd jenkins
mkdir -p /opt/jenkins/{bin,master}
cp /vagrant/jenkins.service /etc/systemd/system/
cd /opt/jenkins/bin
wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
chown -R jenkins /opt/jenkins
systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins

