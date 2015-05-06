-- Create the admin user

CREATE ROLE osp_admin LOGIN
  PASSWORD '1234'
  SUPERUSER INHERIT CREATEDB CREATEROLE REPLICATION;



-- Create the databases

CREATE DATABASE osgp_adapter_protocol_oslp
  WITH OWNER = osp_admin
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;


CREATE DATABASE osgp_core
  WITH OWNER = osp_admin
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;


CREATE DATABASE osgp_ws_logging
  WITH OWNER = osp_admin
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;


CREATE DATABASE osp_devicesimulator_web
  WITH OWNER = osp_admin
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;


CREATE DATABASE osp_logging
  WITH OWNER = osp_admin
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;
	   
	   

-- Create the readonly users

CREATE USER osgp_read_only_ws_user WITH PASSWORD '1234' NOSUPERUSER;

CREATE USER osgp_core_db_api_user PASSWORD '1234' NOSUPERUSER;



-- Insert the test org

INSERT INTO organisation(id, creation_time, modification_time, version, function_group, name, organisation_identification, enabled, domains, prefix)
    VALUES (nextval('organisation_id_seq'),'2013-01-01 00:00:00','2013-01-01 00:00:00',0,0,'test-org','test-org', TRUE, 'COMMON;PUBLIC_LIGHTING;TARIFF_SWITCHING;', 'TSO');
