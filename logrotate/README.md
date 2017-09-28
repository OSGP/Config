# Rotating and removing Tomcat log files

This folder contains the necessary information to rotate catalina.out and to remove old Tomcat log files, like the localhost_access_log files.

To get up and running, take the following steps:
- Place the `tomcat` and `httpd` files in folder `/etc/logrotate.d`.
- Adapt `/var/log/tomcat` to the folder containing your catalina.out.
  The folder is `/data/tomcat/logs`on the Liander systems.
- Adapt `/var/log/httpd` to the folder containing your httpd log files.
  The folder is `/data/httpd/logs` on the Liander systems.
- Adapt `/opt/osgp/current/bin` to the folder containing the `delete-old-tomcat-logfiles.sh` shell file.
  The folder is `/data/scripts` on the Liander systems.
- Adapt `tomcat` in `create 0644 tomcat tomcat` to the user and group running tomcat on your system.
  The user and group are tomcat on the Liander systems.
