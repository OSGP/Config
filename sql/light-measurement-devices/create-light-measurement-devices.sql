DO
$$
BEGIN



-- Create ABB manufacturer
IF NOT EXISTS (
  SELECT 1
  FROM   manufacturer
  WHERE  name = 'ABB') THEN
  
  INSERT INTO manufacturer (
    code,
    name,
    use_prefix)
  VALUES (
    'ABB',
    'ABB',
    false);
END IF;

-- Create device model for ABB light measurement devices
IF NOT EXISTS (
  SELECT 1
  FROM device_model
  WHERE model_code = 'ABB-001') THEN

  INSERT INTO device_model (
    id,
    creation_time,
    modification_time,
    version,
    manufacturer_id,
    model_code,
    description,
    file_storage)
  VALUES (
    nextval('device_model_id_seq'),
    '2020-11-10 00:00:00',
    '2020-11-10 00:00:00',
    0,
    (SELECT id FROM manufacturer WHERE name = 'ABB'),
    'ABB-001',
    'ABB-001',
    true);
END IF;

-- Create a light measurement device 'LMD01'
IF NOT EXISTS (
  SELECT 1
  FROM device
  WHERE device_identification = 'LMD01') THEN

  INSERT INTO device (
    id,
    creation_time,
    modification_time,
    version,
    device_identification,
    device_type,
    is_activated,
    protocol_info_id,
    network_address,
    in_maintenance,
    technical_installation_date,
    device_model,
    device_lifecycle_status)
  VALUES (
    nextval('device_id_seq'),
    '2020-11-10 00:00:00',
    '2020-11-10 00:00:00',
    0,
    'LMD01',
    'LMD',
    true,
    (SELECT id FROM protocol_info WHERE protocol = 'IEC61850' AND protocol_version = '1.0'),
    '127.0.0.1',
    false,
    '2020-11-10 00:00:00',
    (SELECT id FROM device_model WHERE model_code = 'ABB-001'),
    'IN_USE');

  INSERT INTO light_measurement_device (
    id,
    description,
    code,
    color,
    digital_input,
    last_communication_time)
  VALUES (
    (SELECT id FROM device WHERE device_identification = 'LMD01'),
    'Light Measurement Device 01',
    'LMD-01',
    '#c9eec9',
    1,
    '1970-01-01 00:00:00');

  INSERT INTO device_authorization (
    id,
    creation_time,
    modification_time,
    version,
    function_group,
    device,
    organisation)
  VALUES (
    nextval('device_authorization_id_seq'),
    '2020-11-10 00:00:00',
    '2020-11-10 00:00:00',
    0,
    0, -- FUNCTION_GROUP.ADMIN
    (SELECT id FROM device WHERE device_identification = 'LMD01'),
    (SELECT id FROM organisation WHERE organisation_identification = 'test-org'));
END IF;

-- Create a light measurement device 'LMD02'
IF NOT EXISTS (
  SELECT 1
  FROM device
  WHERE device_identification = 'LMD02') THEN
  
  INSERT INTO device (
    id,
    creation_time,
    modification_time,
    version,
    device_identification,
    device_type,
    is_activated,
    protocol_info_id,
    network_address,
    in_maintenance,
    technical_installation_date,
    device_model,
    device_lifecycle_status)
  VALUES (
    nextval('device_id_seq'),
    '2020-11-10 00:00:00',
    '2020-11-10 00:00:00',
    0,
    'LMD02',
    'LMD',
    true,
    (SELECT id FROM protocol_info WHERE protocol = 'IEC61850' AND protocol_version = '1.0'),
    '127.0.0.1',
    false,
    '2020-11-10 00:00:00',
    (SELECT id FROM device_model WHERE model_code = 'ABB-001'),
    'IN_USE');

  INSERT INTO light_measurement_device (
    id,
    description,
    code,
    color,
    digital_input,
    last_communication_time)
  VALUES (
    (SELECT id FROM device WHERE device_identification = 'LMD02'),
    'Light Measurement Device 02',
    'LMD-02',
    '#eec9c9',
    2,
    '1970-01-01 00:00:00');

  INSERT INTO device_authorization (
    id,
    creation_time,
    modification_time,
    version,
    function_group,
    device,
    organisation)
  VALUES (
    nextval('device_authorization_id_seq'),
    '2020-11-10 00:00:00',
    '2020-11-10 00:00:00',
    0,
    0, -- FUNCTION_GROUP.ADMIN
    (SELECT id FROM device WHERE device_identification = 'LMD02'),
    (SELECT id FROM organisation WHERE organisation_identification = 'test-org'));
END IF;

-- Create a light measurement device 'LMD03'
IF NOT EXISTS (
  SELECT 1
  FROM device
  WHERE device_identification = 'LMD03') THEN
  INSERT INTO device (
    id,
    creation_time,
    modification_time,
    version,
    device_identification,
    device_type,
    is_activated,
    protocol_info_id,
    network_address,
    in_maintenance,
    technical_installation_date,
    device_model,
    device_lifecycle_status)
  VALUES (
    nextval('device_id_seq'),
    '2020-11-10 00:00:00',
    '2020-11-10 00:00:00',
    0,
    'LMD03',
    'LMD',
    true,
    (SELECT id FROM protocol_info WHERE protocol = 'IEC61850' AND protocol_version = '1.0'),
    '127.0.0.1',
    false,
    '2020-11-10 00:00:00',
    (SELECT id FROM device_model WHERE model_code = 'ABB-001'),
    'IN_USE');

  INSERT INTO light_measurement_device (
    id,
    description,
    code,
    color,
    digital_input,
    last_communication_time)
  VALUES (
    (SELECT id FROM device WHERE device_identification = 'LMD03'),
    'Light Measurement Device 03',
    'LMD-03',
    '#c9c9ee',
    3,
    '1970-01-01 00:00:00');

  INSERT INTO device_authorization (
    id,
    creation_time,
    modification_time,
    version,
    function_group,
    device,
    organisation)
  VALUES (
    nextval('device_authorization_id_seq'),
    '2020-11-10 00:00:00',
    '2020-11-10 00:00:00',
    0,
    0, -- FUNCTION_GROUP.ADMIN
    (SELECT id FROM device WHERE device_identification = 'LMD03'),
    (SELECT id FROM organisation WHERE organisation_identification = 'test-org'));
END IF;

-- Create a light measurement device 'LMD04'
IF NOT EXISTS (
  SELECT 1
  FROM device
  WHERE device_identification = 'LMD04') THEN
  INSERT INTO device (
    id,
    creation_time,
    modification_time,
    version,
    device_identification,
    device_type,
    is_activated,
    protocol_info_id,
    network_address,
    in_maintenance,
    technical_installation_date,
    device_model,
    device_lifecycle_status)
  VALUES (
    nextval('device_id_seq'),
    '2020-11-10 00:00:00',
    '2020-11-10 00:00:00',
    0,
    'LMD04',
    'LMD',
    true,
    (SELECT id FROM protocol_info WHERE protocol = 'IEC61850' AND protocol_version = '1.0'),
    '127.0.0.1',
    false,
    '2020-11-10 00:00:00',
    (SELECT id FROM device_model WHERE model_code = 'ABB-001'),
    'IN_USE');
  
  INSERT INTO light_measurement_device (
    id,
    description,
    code,
    color,
    digital_input,
    last_communication_time)
  VALUES (
    (SELECT id FROM device WHERE device_identification = 'LMD04'),
    'Light Measurement Device 04',
    'LMD-04',
    '#eeeec9',
    4,
    '1970-01-01 00:00:00');

  INSERT INTO device_authorization (
    id,
    creation_time,
    modification_time,
    version,
    function_group,
    device,
    organisation)
  VALUES (
    nextval('device_authorization_id_seq'),
    '2020-11-10 00:00:00',
    '2029-11-10 00:00:00',
    0,
    0, -- FUNCTION_GROUP.ADMIN
    (SELECT id FROM device WHERE device_identification = 'LMD04'),
    (SELECT id FROM organisation WHERE organisation_identification = 'test-org'));
END IF;



END;
$$
