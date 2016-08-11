#!/bin/bash

REQUESTS=osgp-ca/requests
PRIVATE=osgp-ca/private
CERTS=osgp-ca/certs

CERT_TYPE=$1
COMMON_NAME=$2
CA_PASS=$3
PKCS12_PASS=$4

export OPENSSL_CONF=osgp-ca.cfg

echo ########################################################################
echo # Create certificate request: $REQUESTS/$COMMON_NAME.req.pem
echo ########################################################################
openssl req -new -sha256 -reqexts $CERT_TYPE -nodes -out $REQUESTS/$COMMON_NAME.req.pem -keyout $PRIVATE/$COMMON_NAME.key.pem -subj /commonName=$COMMON_NAME

echo ########################################################################
echo # Sign certificate request: $CERTS/$COMMON_NAME.cert.pem
echo ########################################################################
openssl ca -days 1095 -md sha256 -extensions $CERT_TYPE -batch -passin pass:$CA_PASS -out $CERTS/$COMMON_NAME.cert.pem -infiles $REQUESTS/$COMMON_NAME.req.pem

echo ########################################################################
echo # Create PKCS12 file: $CERTS/$COMMON_NAME.pfx
echo ########################################################################
openssl pkcs12 -export -inkey $PRIVATE/$COMMON_NAME.key.pem -in $CERTS/$COMMON_NAME.cert.pem -certfile $CERTS/cacert.cer -out $CERTS/$COMMON_NAME.pfx -passout pass:$PKCS12_PASS
