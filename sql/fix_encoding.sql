-- SPDX-FileCopyrightText: Contributors to the GXF project
--
-- SPDX-License-Identifier: Apache-2.0

update pg_database set datallowconn = true where datname = 'template0';
update pg_database set datistemplate = false where datname = 'template1';
drop database template1;
create database template1 encoding = 'utf8' template = 'template0' LC_CTYPE='en_US.utf8' LC_COLLATE='en_US.utf8';
update pg_database set datistemplate = true where datname = 'template1';
update pg_database set datallowconn = false where datname = 'template0';

