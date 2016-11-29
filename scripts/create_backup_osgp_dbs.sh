#!/bin/bash

HOST=localhost
PORT=5432
USER=osp_admin

HOSTNAME=`hostname`
TIMESTAMP=`date +%Y%m%d_%H%M%S`

BACKUP_DIR=$HOME/backups/osgp/${HOSTNAME}_$TIMESTAMP
mkdir -p $BACKUP_DIR/

echo "Creating backup of osgp databases in ${BACKUP_DIR} ..."

pg_dump -h $HOST -p $PORT -d osgp_adapter_protocol_dlms -U $USER | gzip > $BACKUP_DIR/osgp_adapter_protocol_dlms.gz
pg_dump -h $HOST -p $PORT -d osgp_adapter_protocol_oslp -U $USER | gzip  > $BACKUP_DIR/osgp_adapter_protocol_oslp.gz
pg_dump -h $HOST -p $PORT -d osgp_adapter_ws_microgrids -U $USER | gzip  > $BACKUP_DIR/osgp_adapter_ws_microgrids.gz
pg_dump -h $HOST -p $PORT -d osgp_adapter_ws_smartmetering -U $USER | gzip  > $BACKUP_DIR/osgp_adapter_ws_smartmetering.gz
pg_dump -h $HOST -p $PORT -d osgp_core -U $USER | gzip  > $BACKUP_DIR/osgp_core.gz
pg_dump -h $HOST -p $PORT -d osgp_logging -U $USER | gzip  > $BACKUP_DIR/osgp_logging.gz
pg_dump -h $HOST -p $PORT -d osp_devicesimulator_web -U $USER | gzip  > $BACKUP_DIR/osp_devicesimulator_web.gz
pg_dump -h $HOST -p $PORT -d osp_net_management_web -U $USER | gzip  > $BACKUP_DIR/osp_net_management_web.gz
pg_dump -h $HOST -p $PORT -d osp_owner_web -U $USER | gzip  > $BACKUP_DIR/osp_owner_web.gz
pg_dump -h $HOST -p $PORT -d osp_user_management_web -U $USER | gzip  > $BACKUP_DIR/osp_user_management_web.gz

echo "Done."

