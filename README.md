# git-tasks
This is the project that deployes jenkins service for providing a CI/CD processes.
Our project can be deployed by only Vagrant tool

# Install and configure Nginx.
1. Vagrant runs file provision.sh with follow steps;
  1. automation install Nginx from yum repositories;
  2. create config /etc/nginx/conf.d/jenkins.conf for availability by link http://jenkins.
  3. download jenkins.war and implements it as service trought systemd

<dl>
  <dt>Developers:</dt>
  <dd>1. Y. Sokal
    Contribution:
        - Created nginx service for working with jenkins service
        - Configure nginx 
        - Changing READ.me file
  </dd>
  <dd>2. A. Andryieuski
        - Created VM CentOS 7 by Vagrant
        - Created jenkins service
        - Changing READ.me file
  </dd>
</dl>
 

![alt text](https://drive.google.com/open?id=0B2h4DxcUKi5TQ096R3ZLWVYtM0tuZERRVkc2enVGajFFNjV3 "concept")
