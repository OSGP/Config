# Rotating and removing Tomcat log files

This folder contains the necessary information to rotate catalina.out and to remove old Tomcat log files, like the localhost_access_log files.

To get up & running, take the following steps:
- Adapt `/var/log/tomcat` to the folder, where your catalina.out is created.
- Adapt `/opt/osgp/current/bin` to the folder, where your delete-old-tomcat-logfiles.sh shell file is placed.
- Adapt `tomcat` in `create 0644 tomcat tomcat` to the user and group running tomcat on your system.
- Place tomcat7 in your `/etc/logrotate.d` folder

