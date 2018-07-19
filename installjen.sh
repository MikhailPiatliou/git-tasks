yum install -y java
sudo yum install -y nginx
rm /home/vagrant/nginx/conf/nginx.conf
cp /vagrant/nginx.conf /home/vagrant/nginx/conf/nginx.conf
wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
java -jar jenkins.war &
