#!/bin/bash

# SPDX-FileCopyrightText: Contributors to the GXF project
#
# SPDX-License-Identifier: Apache-2.0

# Description
# Call create_cert.sh with specific server certificate configuration section "v3_req".

# Params for the script.
# $1 = the common name (CN) and the file name for the certificate
# $2 = CA password
# $3 = truststore password
./create_cert.sh v3_req "$1" "$2" "$3"
