# git-tasks
This is the project that deployes jenkins service for providing a CI/CD processes.
Our project can be deployed by only Vagrant tool



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
 
# Install and configure Nginx.
1. Run file provision.sh;
  1. automation install Nginx from yum repositories;
  2. create config /etc/nginx/conf.d/jenkins.conf for availability by link http://jenkins.
  3. download jenkins.war and implements it as service trought systemd
