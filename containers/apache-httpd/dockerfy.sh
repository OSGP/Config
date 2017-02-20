#!/bin/bash
COMPONENT=apache-httpd
docker build -t $COMPONENT .
docker run -it --rm -e "SOAPENDPOINT=172.17.0.3" -p 8099:80 -p 44399:443 --name $COMPONENT $COMPONENT
