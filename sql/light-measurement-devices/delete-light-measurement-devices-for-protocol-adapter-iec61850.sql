DO
$$
BEGIN

DELETE FROM iec61850_device WHERE device_identification IN ('LMD01','LMD02','LMD03','LMD04');

END;
$$
