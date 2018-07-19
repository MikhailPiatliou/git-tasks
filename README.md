<<<<<<< HEAD
# git-tasks
README file for task 2.
Editors:
=======
Task 2 
>>>>>>> 7a39601be5bd45b2dcffadbcbe8e2e0b25ba4307
	- kuchynski
	- maniukevich
	- znak

<<<<<<< HEAD
=======
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
>>>>>>> 7a39601be5bd45b2dcffadbcbe8e2e0b25ba4307
