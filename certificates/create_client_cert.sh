#!/bin/bash

# Description
# Call create_cert.sh with specific client certificate configuration section "v3_client".

# Params for the script.
# $1 = the common name (CN) and the file name for the certificate
# $2 = CA password
# $3 = client cert password
./create_cert.sh v3_client "$1" "$2" "$3"
