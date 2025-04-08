#!/bin/bash -x

# SPDX-FileCopyrightText: Contributors to the GXF project
#
# SPDX-License-Identifier: Apache-2.0

# Add localhost certificate to truststore
keytool -importcert -trustcacerts -file osgp-ca/certs/localhost.cert.pem -keystore trust.jks -storepass 123456 -noprompt -alias localhost

# Add osgp ca certificate to truststore
keytool -importcert -trustcacerts -file osgp-ca/certs/cacert.cer -keystore trust.jks -storepass 123456 -noprompt -alias osgp-ca
