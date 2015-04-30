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
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO osgp_read_only_ws_user;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO osgp_read_only_ws_user;


CREATE USER osgp_core_db_api_user PASSWORD '1234' NOSUPERUSER;
GRANT SELECT ON public.device TO osgp_core_db_api_user;
