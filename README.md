# git-tasks
<<<<<<< HEAD

<p>Linux service - systemd</p>
<ol>
<li>Download jenkins.war</li>
<li>Create service file /etc/systemd/system/jenkins.service<br>
[Unit]<br>
Description=Jenkins Daemon<br>
[Service]<br>
ExecStart=/usr/bin/java -jar /home/jenkins/jenkins.war<br>
ExecStop=kill <code>ps -ef | grep [j]enkins.war | awk '{ print $2 }'</code><br>
User=jenkins<br>
[Install]<br>
WantedBy=multi-user.target</li>
</ol>
=======
Task 2 
	- kuchynski
	- maniukevich
	- znak

Linux service - systemd
1. Download jenkins.war 
2. Create service file /etc/systemd/system/jenkins.service 
    [Unit]
    Description=Jenkins Daemon
    [Service]
    ExecStart=/usr/bin/java -jar /home/jenkins/jenkins.war
    ExecStop=kill `ps -ef | grep [j]enkins.war | awk '{ print $2 }'`
    User=jenkins
    [Install]
    WantedBy=multi-user.target

>>>>>>> b8bb71186abd61c2a5d42d3c2480d784274742ad
