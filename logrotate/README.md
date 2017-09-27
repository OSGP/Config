# Rotating and removing Tomcat log files

This folder contains the necessary information to rotate catalina.out and to remove old Tomcat log files, like the localhost_access_log files.

To get up and running, take the following steps:
- Place the `tomcat7` file in your `/etc/logrotate.d` folder.
- Adapt `/var/log/tomcat` to the folder containing your catalina.out.
- Adapt `/opt/osgp/current/bin` to the folder containing the `delete-old-tomcat-logfiles.sh` shell file.
- Adapt `tomcat` in `create 0644 tomcat tomcat` to the user and group running tomcat on your system.

