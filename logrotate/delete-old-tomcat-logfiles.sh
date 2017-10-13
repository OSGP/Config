# This script deletes old Tomcat logfiles like the standard "localhost_access_log" files.
# It does not touch catalina.out. Catalina.out should be rotated and removed by logrotate.
# Main uses: ran standalone ad-hoc, daily from a cron job or daily from logrotate.

#!/bin/bash
CATALINA_FOLDER=$1
MAX_AGE_DAYS=30

if [ $# -eq 0 ];then
    echo "Passing the folder containing the Tomcat log files as parameter is mandatory."
    echo "Example: ./delete-old-tomcat-logfiles.sh /var/log/tomcat"
    exit
fi

find ${CATALINA_FOLDER} -name "manager.*" -mtime +${MAX_AGE_DAYS} -exec rm {} \;
find ${CATALINA_FOLDER} -name "catalina.*.log" -mtime +${MAX_AGE_DAYS} -exec rm {} \;
find ${CATALINA_FOLDER} -name "host-manager.*.log" -mtime +${MAX_AGE_DAYS} -exec rm {} \;
find ${CATALINA_FOLDER} -name "localhost_access_log.*.txt" -mtime +${MAX_AGE_DAYS} -exec rm {} \;
find ${CATALINA_FOLDER} -name "localhost.*" -mtime +${MAX_AGE_DAYS} -exec rm {} \;

