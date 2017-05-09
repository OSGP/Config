#!/bin/bash

HOST=localhost
PORT=5432
USER=osp_admin
BACKUP_DIR=$HOME/backups/osgp
LOGFILE=restore.log

pgrep pgadmin3 && echo pgadmin3 is running, please close pgadmin3 before running this script && exit 1

if [ $# -eq 0 ];then
    echo "The first argument must be a backup (file from $BACKUP_DIR/) ..."
	ls $BACKUP_DIR/
    exit
fi

BACKUP_DIR=$BACKUP_DIR/$1

function restore() {
        echo "- restoring $BACKUP_DIR/$1.tar ..."
	pg_restore -h $HOST -p $PORT -U $USER -d $1 -c $BACKUP_DIR/$1.tar >> $LOGFILE
}

echo "Restoring OSGP databases from $BACKUP_DIR/$1 ..."

restore osgp_adapter_protocol_dlms
restore osgp_adapter_protocol_oslp
restore osgp_adapter_protocol_iec61850
restore osgp_adapter_ws_microgrids
restore osgp_adapter_ws_distributionautomation
restore osgp_adapter_ws_smartmetering
restore osgp_core
restore osgp_logging
restore osp_devicesimulator_web

echo "Done."
