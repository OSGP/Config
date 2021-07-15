#!/bin/bash
psql -U osp_admin -d osgp_core -f ./delete-light-measurement-devices.sql
psql -U osp_admin -d osgp_adapter_protocol_iec61850 -f ./delete-light-measurement-devices-for-protocol-adapter-iec61850.sql
