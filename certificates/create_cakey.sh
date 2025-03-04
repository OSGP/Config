#!/bin/bash -x

# SPDX-FileCopyrightText: Contributors to the GXF project
#
# SPDX-License-Identifier: Apache-2.0

export KEYS=osgp-ca/keys
export CERTS=osgp-ca/certs

export OPENSSL_CONF=osgp-ca.cfg

echo ########################################################################
echo # Create CA Key: $KEYS\cakey.pem
echo ########################################################################
openssl genrsa -aes256 -out $KEYS/cakey.pem 4096
