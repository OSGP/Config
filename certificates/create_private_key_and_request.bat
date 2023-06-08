REM SPDX-FileCopyrightText: Contributors to the GXF project
REM
REM SPDX-License-Identifier: Apache-2.0

@echo off

REM This script can create a private key and request to obtain a SSL Certificate from a SSL Certificate providers like Xolphin
REM Call this script like: create_private_key_and_request.bat v3_req %1 %2 %3 where %1 is the URL, %2 is the CA Password, %3 is the PKCS12 Password

set OPENSSL=OpenSSL-Win32_1.0.1h_Light\bin\openssl
set PUBLIC=public

set CERT_TYPE=%1
set COMMON_NAME=%2
set CA_PASS=%3
set PKCS12_PASS=%4

echo ########################################################################
echo # Create certificate request: %PUBLIC%\%COMMON_NAME%.req.pem
echo ########################################################################
%OPENSSL% req -new -sha256 -reqexts %CERT_TYPE% -nodes -out %PUBLIC%\%COMMON_NAME%.req.pem -keyout %PUBLIC%\%COMMON_NAME%.key.pem -config %PUBLIC%\public.cfg