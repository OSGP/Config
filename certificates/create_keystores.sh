#!/bin/bash -x

# SPDX-FileCopyrightText: Contributors to the GXF project
#
# SPDX-License-Identifier: Apache-2.0

echo Adding localhost.cert.pem to trust.jks
keytool -importcert -trustcacerts -file osgp-ca/certs/localhost.cert.pem -keystore trust.jks -storepass 123456 -noprompt -alias localhost
echo
echo Adding cacert.cer to trust.jks
keytool -importcert -trustcacerts -file osgp-ca/certs/cacert.cer -keystore trust.jks -storepass 123456 -noprompt -alias osgp-ca
