<p>Linux service - systemd</p>
<ol>
<li>Download jenkins.war</li>
<li>Create service file /etc/systemd/system/jenkins.service<br>
[Unit]<br>
Description=Jenkins Daemon<br>
[Service]<br>
ExecStart=/usr/bin/java -jar /opt/jenkins/bin/jenkins.war<br>
ExecStop=kill <code>ps -ef | grep [j]enkins.war | awk '{ print $2 }'</code><br>
User=jenkins<br>
[Install]<br>
WantedBy=multi-user.target</li>
</ol>
