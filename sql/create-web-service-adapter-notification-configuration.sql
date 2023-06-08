-- SPDX-FileCopyrightText: Contributors to the GXF project
--
-- SPDX-License-Identifier: Apache-2.0

--osgp_adapter_ws_core
INSERT INTO notification_web_service_configuration VALUES ('LianderNetManagement', 'OSGP', 'org.opensmartgridplatform.adapter.ws.schema.core.notification', 'http://localhost:8080/web-api-net-management/soap/osgp/notificationService', FALSE, 'pkcs12', '/etc/ssl/certs/LianderNetManagement.pfx', '1234', FALSE, 'jks', '/etc/ssl/certs/trust.jks', '123456', 10, 20, 10000, FALSE, 0, 0, 0, 0);

--osgp_adapter_ws_publiclighting
INSERT INTO notification_web_service_configuration VALUES ('LianderNetManagement', 'OSGP', 'org.opensmartgridplatform.adapter.ws.schema.publiclighting.notification', 'http://localhost:8080/web-api-net-management/soap/osgp/notificationService', FALSE, 'pkcs12', '/etc/ssl/certs/LianderNetManagement.pfx', '1234', FALSE, 'jks', '/etc/ssl/certs/trust.jks', '123456', 10, 20, 10000, FALSE, 0, 0, 0, 0);

--osgp_adapter_ws_tariffswitching
INSERT INTO notification_web_service_configuration VALUES ('LianderNetManagement', 'OSGP', 'org.opensmartgridplatform.adapter.ws.schema.tariffswitching.notification', 'http://localhost:8080/web-api-net-management/soap/osgp/notificationService', FALSE, 'pkcs12', '/etc/ssl/certs/LianderNetManagement.pfx', '1234', FALSE, 'jks', '/etc/ssl/certs/trust.jks', '123456', 10, 20, 10000, FALSE, 0, 0, 0, 0);

