REM SPDX-FileCopyrightText: Contributors to the GXF project
REM
REM SPDX-License-Identifier: Apache-2.0

D:\OSPG\OSGP\config\certificates>"c:\Program Files\Java\jdk1.7.0_55\bin\keytool.exe" -importcert -trustcacerts -file osgp-ca\certs\localhost.cert.pem -keystore trust.jks -storepass 123456 -noprompt -alias localhost

D:\OSPG\OSGP\config\certificates>"c:\Program Files\Java\jdk1.7.0_55\bin\keytool.exe" -importcert -trustcacerts -file osgp-ca\certs\cacert.cer -keystore trust.jks -storepass 123456 -noprompt -alias osgp-ca