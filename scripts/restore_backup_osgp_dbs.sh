#!/bin/bash

HOST=localhost
PORT=5432
USER=osp_admin
BACKUP_DIR=$HOME/backups/osgp
LOGFILE=restore.log

if [ $# -eq 0 ];then
    echo "The first argument must be a backup (file from $BACKUP_DIR/) ..."
	ls $BACKUP_DIR/
    exit
fi

BACKUP_DIR=$BACKUP_DIR/$1

function restore() {
        echo "- restoring $BACKUP_DIR/$1.gz ..."
	dropdb -h $HOST -p $PORT -U $USER --if-exists $1 >> $LOGFILE
	createdb -h $HOST -p $PORT -U $USER $1 >> $LOGFILE
	cat $BACKUP_DIR/$1.gz | gunzip | psql -U $USER $1 >> $LOGFILE
}

mkdir -p $BACKUP_DIR

# PGAdmin may not be running.
killall pgadmin3

echo "Restoring OSGP databases from $BACKUP_DIR/$1 ..."

restore osgp_adapter_protocol_dlms
restore osgp_adapter_protocol_oslp
restore osgp_adapter_ws_microgrids
restore osgp_adapter_ws_smartmetering
restore osgp_core
restore osgp_logging
restore osp_devicesimulator_web
restore osp_net_management_web
restore osp_owner_web
restore osp_user_management_web

echo "Done."
