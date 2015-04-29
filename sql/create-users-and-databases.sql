-- Create the admin user

CREATE ROLE db_admin LOGIN
  PASSWORD '1234'
  SUPERUSER INHERIT CREATEDB CREATEROLE REPLICATION;



-- Create the databases

CREATE DATABASE osgp_adapter_protocol_oslp
  WITH OWNER = db_admin
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;


CREATE DATABASE osgp_core
  WITH OWNER = db_admin
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;


CREATE DATABASE osgp_ws_logging
  WITH OWNER = db_admin
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;


CREATE DATABASE osp_devicesimulator_web
  WITH OWNER = db_admin
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;


CREATE DATABASE osp_logging
  WITH OWNER = db_admin
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;


CREATE DATABASE osp_net_management_web
  WITH OWNER = db_admin
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;


CREATE DATABASE osp_owner_web
  WITH OWNER = db_admin
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;


CREATE DATABASE osp_user_management_web
  WITH OWNER = db_admin
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;
	   
	   

-- Create the readonly users

CREATE USER osgp_read_only_ws_user WITH PASSWORD '1234' NOSUPERUSER;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO osgp_read_only_ws_user;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO osgp_read_only_ws_user;


CREATE USER osgp_core_db_api_user PASSWORD '1234' NOSUPERUSER;
GRANT SELECT ON public.device TO osgp_core_db_api_user;

-- Create the logback databases

-- Logback: the reliable, generic, fast and flexible logging framework.
-- Copyright (C) 1999-2010, QOS.ch. All rights reserved.
--
-- See http://logback.qos.ch/license.html for the applicable licensing 
-- conditions.

-- This SQL script creates the required tables by ch.qos.logback.classic.db.DBAppender
--
-- It is intended for PostgreSQL databases.

-- DROP TABLE    logging_event_property;
-- DROP TABLE    logging_event_exception;
-- DROP TABLE    logging_event;
-- DROP SEQUENCE logging_event_id_seq;


CREATE SEQUENCE logging_event_id_seq MINVALUE 1 START 1;


CREATE TABLE logging_event 
  (
    timestmp         BIGINT NOT NULL,
    formatted_message  TEXT NOT NULL,
    logger_name       VARCHAR(254) NOT NULL,
    level_string      VARCHAR(254) NOT NULL,
    thread_name       VARCHAR(254),
    reference_flag    SMALLINT,
    arg0              VARCHAR(254),
    arg1              VARCHAR(254),
    arg2              VARCHAR(254),
    arg3              VARCHAR(254),
    caller_filename   VARCHAR(254) NOT NULL,
    caller_class      VARCHAR(254) NOT NULL,
    caller_method     VARCHAR(254) NOT NULL,
    caller_line       CHAR(4) NOT NULL,
    event_id          BIGINT DEFAULT nextval('logging_event_id_seq') PRIMARY KEY
  );

CREATE TABLE logging_event_property
  (
    event_id	      BIGINT NOT NULL,
    mapped_key        VARCHAR(254) NOT NULL,
    mapped_value      VARCHAR(1024),
    PRIMARY KEY(event_id, mapped_key),
    FOREIGN KEY (event_id) REFERENCES logging_event(event_id)
  );

CREATE TABLE logging_event_exception
  (
    event_id         BIGINT NOT NULL,
    i                SMALLINT NOT NULL,
    trace_line       VARCHAR NOT NULL,
    PRIMARY KEY(event_id, i),
    FOREIGN KEY (event_id) REFERENCES logging_event(event_id)
  );