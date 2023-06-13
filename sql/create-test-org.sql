-- SPDX-FileCopyrightText: Contributors to the GXF project
--
-- SPDX-License-Identifier: Apache-2.0

-- Insert the test org

INSERT INTO organisation(id, creation_time, modification_time, version, function_group, name, organisation_identification, enabled, domains, prefix)
    VALUES (nextval('organisation_id_seq'),'2013-01-01 00:00:00','2013-01-01 00:00:00',0,0,'test-org','test-org', TRUE, 'COMMON;PUBLIC_LIGHTING;TARIFF_SWITCHING;', 'TSO');