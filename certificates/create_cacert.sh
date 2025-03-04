#!/bin/bash -x

# SPDX-FileCopyrightText: Contributors to the GXF project
#
# SPDX-License-Identifier: Apache-2.0

export KEYS=osgp-ca/keys
export CERTS=osgp-ca/certs

export OPENSSL_CONF=osgp-ca.cfg

echo ########################################################################
echo # Create CA Key: $CERTS\cacert.cer
echo ########################################################################
openssl req -new -x509 -days 3650 -key $KEYS/cakey.pem -sha256 -extensions v3_ca -out $CERTS/cacert.cer
