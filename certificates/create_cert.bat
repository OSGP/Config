@echo off

set OPENSSL=OpenSSL-Win32_1.0.1h_Light\bin\openssl
set REQUESTS=osgp-ca\requests
set PRIVATE=osgp-ca\private
set CERTS=osgp-ca\certs

set CERT_TYPE=%1
set COMMON_NAME=%2
set CA_PASS=%3
set PKCS12_PASS=%4

set OPENSSL_CONF=osgp-ca.cfg

echo ########################################################################
echo # Create certificate request: %REQUESTS%\%COMMON_NAME%.req.pem
echo ########################################################################
%OPENSSL% req -new -sha256 -reqexts %CERT_TYPE% -nodes -out %REQUESTS%\%COMMON_NAME%.req.pem -keyout %PRIVATE%\%COMMON_NAME%.key.pem -subj /commonName=%COMMON_NAME%

echo ########################################################################
echo # Sign certificate request: %CERTS%\%COMMON_NAME%.cert.pem
echo ########################################################################
%OPENSSL% ca -days 1095 -md sha256 -extensions %CERT_TYPE% -batch -passin pass:%CA_PASS% -out %CERTS%\%COMMON_NAME%.cert.pem -infiles %REQUESTS%\%COMMON_NAME%.req.pem

echo ########################################################################
echo # Create PKCS12 file: %CERTS%\%COMMON_NAME%.pfx
echo ########################################################################
%OPENSSL% pkcs12 -export -inkey %PRIVATE%\%COMMON_NAME%.key.pem -in %CERTS%\%COMMON_NAME%.cert.pem -certfile %CERTS%\cacert.cer -out %CERTS%\%COMMON_NAME%.pfx -passout pass:%PKCS12_PASS%