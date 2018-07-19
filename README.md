Linux service - systemd

    1. Download jenkins.war
    2. Create service file /etc/systemd/system/jenkins.service
    [Unit]
    Description=Jenkins Daemon
    [Service]
    ExecStart=/usr/bin/java -jar /opt/jenkins/bin/jenkins.war
    ExecStop=kill ps -ef | grep [j]enkins.war | awk '{ print $2 }'
    User=jenkins
    [Install]
    WantedBy=multi-user.target
