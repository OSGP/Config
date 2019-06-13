-- Create the admin user

CREATE ROLE osp_admin LOGIN
  PASSWORD '1234'
  SUPERUSER INHERIT CREATEDB CREATEROLE REPLICATION;

-- Create the databases

CREATE DATABASE osgp_adapter_protocol_oslp
  WITH OWNER = osp_admin
       ENCODING = 'UTF-8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;

CREATE DATABASE osgp_adapter_protocol_iec61850
  WITH OWNER = osp_admin
       ENCODING = 'UTF-8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;

CREATE DATABASE osgp_adapter_protocol_dlms
  WITH OWNER = osp_admin
       ENCODING = 'UTF-8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;

CREATE DATABASE osgp_adapter_ws_smartmetering
  WITH OWNER = osp_admin
       ENCODING = 'UTF-8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;

CREATE DATABASE osgp_adapter_ws_distributionautomation
  WITH OWNER = osp_admin
       ENCODING = 'UTF-8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;

CREATE DATABASE osgp_adapter_ws_microgrids
  WITH OWNER = osp_admin
       ENCODING = 'UTF-8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;

CREATE DATABASE osgp_adapter_ws_publiclighting
  WITH OWNER = osp_admin
       ENCODING = 'UTF-8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;

CREATE DATABASE osgp_adapter_ws_tariffswitching
  WITH OWNER = osp_admin
       ENCODING = 'UTF-8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;

CREATE DATABASE osgp_core
  WITH OWNER = osp_admin
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;

CREATE DATABASE osp_devicesimulator_web
  WITH OWNER = osp_admin
       ENCODING = 'UTF-8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;

CREATE DATABASE osgp_logging
  WITH OWNER = osp_admin
       ENCODING = 'UTF-8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;

CREATE DATABASE osgp_adapter_protocol_iec60870
  WITH OWNER = osp_admin
       ENCODING = 'UTF-8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;

-- Create the readonly users

CREATE USER osgp_read_only_ws_user WITH PASSWORD '1234' NOSUPERUSER;

CREATE USER osgp_core_db_api_user WITH PASSWORD '1234' NOSUPERUSER;

CREATE USER osgp_core_db_api_iec61850_user WITH PASSWORD '1234' NOSUPERUSER;

