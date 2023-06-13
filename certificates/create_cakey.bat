REM SPDX-FileCopyrightText: Contributors to the GXF project
REM
REM SPDX-License-Identifier: Apache-2.0

@echo off

set OPENSSL=OpenSSL-Win32_1.0.1h_Light\bin\openssl
set KEYS=osgp-ca\keys

set OPENSSL_CONF=osgp-ca.cfg

echo ########################################################################
echo # Create CA Key: %KEYS%\cakey.pem
echo ########################################################################
%OPENSSL% genrsa -aes256 -out %KEYS%\cakey.pem 4096