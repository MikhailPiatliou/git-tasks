Task 2 
	- kuchynski
	- maniukevich
	- znak

<p>Linux service - systemd</p>
<ol>
<li>1. Download jenkins.war</li>
<li>2. Create service file /etc/systemd/system/jenkins.service<br>
[Unit]<br>
Description=Jenkins Daemon<br>
[Service]<br>
ExecStart=/usr/bin/java -jar /opt/jenkins/bin/jenkins.war<br>
ExecStop=kill <code>ps -ef | grep [j]enkins.war | awk '{ print $2 }'</code><br>
User=jenkins<br>
[Install]<br>
WantedBy=multi-user.target</li>
</ol>
