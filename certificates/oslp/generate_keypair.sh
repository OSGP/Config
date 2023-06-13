#!/bin/sh

# SPDX-FileCopyrightText: Contributors to the GXF project
#
# SPDX-License-Identifier: Apache-2.0

# Generates a public and private ECDSA key, which can be used as
# communication keys for a platform using OSLP.
# The .der encoded files are generated from the initial .pem format,
# because the platform needs .der encoding.

[ ${1} ] || { echo "Provide a name as parameter. It will be used for the public and private key."; exit 1; }

PRIVATE_FILE=oslp_${1}_ecdsa_private
PUBLIC_FILE=oslp_${1}_ecdsa_public

echo "Generate keys ${PRIVATE_FILE}.pem/.der and ${PUBLIC_FILE}.pem/.der" 
openssl ecparam -genkey -name prime256v1 -out ${PRIVATE_FILE}.pem
openssl ec -in ${PRIVATE_FILE}.pem -out ${PUBLIC_FILE}.pem -pubout

openssl pkcs8 -topk8 -in ${PRIVATE_FILE}.pem -out ${PRIVATE_FILE}.der -outform der -nocrypt
openssl ec -in ${PUBLIC_FILE}.pem -out ${PUBLIC_FILE}.der -outform der -pubin -pubout

