-- SPDX-FileCopyrightText: Contributors to the GXF project
--
-- SPDX-License-Identifier: Apache-2.0

﻿DO
$$
BEGIN

UPDATE ssld SET light_measurement_device_id = null;

DELETE FROM device_authorization WHERE device IN (SELECT id FROM device WHERE device_identification IN ('LMD01','LMD02','LMD03','LMD04'));

DELETE FROM light_measurement_device WHERE id IN (SELECT id FROM device WHERE device_identification IN ('LMD01','LMD02','LMD03','LMD04'));

DELETE FROM device WHERE device_identification IN ('LMD01','LMD02','LMD03','LMD04');

END;
$$
