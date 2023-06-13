REM SPDX-FileCopyrightText: Contributors to the GXF project
REM
REM SPDX-License-Identifier: Apache-2.0

@echo off

set OPENSSL=OpenSSL-Win32_1.0.1h_Light\bin\openssl
set KEYS=osgp-ca\keys
set CERTS=osgp-ca\certs

set OPENSSL_CONF=osgp-ca.cfg

echo ########################################################################
echo # Create CA Key: %CERTS%\cacert.cer
echo ########################################################################
%OPENSSL% req -new -x509 -days 3650 -key %KEYS%\cakey.pem -sha256 -extensions v3_ca -out %CERTS%\cacert.cer