DO
$$
BEGIN



-- Create a light measurement device 'LMD01'
IF NOT EXISTS (
  SELECT 1
  FROM iec61850_device
  WHERE device_identification = 'LMD01') THEN
  INSERT INTO iec61850_device(id,creation_time,modification_time,version,device_identification,icd_filename,port,server_name,enable_all_reports_on_connect,use_combined_load)
  VALUES(
    nextval('iec61850_device_id_seq'),
    '2020-11-10 11:01:10.111111',
    '2020-11-10 11:01:10.111111',
    0,
    'LMD01',
    'FlexOVL_540_171101_2_out.icd',
    102,
    'AA1TH01',
    false,
    false);
END IF;

-- Create a light measurement device 'LMD02'
IF NOT EXISTS (
  SELECT 1
  FROM iec61850_device
  WHERE device_identification = 'LMD02') THEN
  INSERT INTO iec61850_device(id,creation_time,modification_time,version,device_identification,icd_filename,port,server_name,enable_all_reports_on_connect,use_combined_load)
  VALUES(
    nextval('iec61850_device_id_seq'),
    '2020-11-10 11:01:10.111111',
    '2020-11-10 11:01:10.111111',
    0,
    'LMD02',
    'FlexOVL_540_171101_2_out.icd',
    102,
    'AA1TH01',
    false,
    false);
END IF;

-- Create a light measurement device 'LMD03'
IF NOT EXISTS (
  SELECT 1
  FROM iec61850_device
  WHERE device_identification = 'LMD03') THEN
  INSERT INTO iec61850_device(id,creation_time,modification_time,version,device_identification,icd_filename,port,server_name,enable_all_reports_on_connect,use_combined_load)
  VALUES(
    nextval('iec61850_device_id_seq'),
    '2020-11-10 11:01:10.111111',
    '2020-11-10 11:01:10.111111',
    0,
    'LMD03',
    'FlexOVL_540_171101_2_out.icd',
    102,
    'AA1TH01',
    false,
    false);
END IF;

-- Create a light measurement device 'LMD04'
IF NOT EXISTS (
  SELECT 1
  FROM iec61850_device
  WHERE device_identification = 'LMD04') THEN
  INSERT INTO iec61850_device(id,creation_time,modification_time,version,device_identification,icd_filename,port,server_name,enable_all_reports_on_connect,use_combined_load)
  VALUES(
    nextval('iec61850_device_id_seq'),
    '2020-11-10 11:01:10.111111',
    '2020-11-10 11:01:10.111111',
    0,
    'LMD04',
    'FlexOVL_540_171101_2_out.icd',
    102,
    'AA1TH01',
    false,
    false);
END IF;



END;
$$
