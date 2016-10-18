#!/bin/bash

cd Config
git pull
cd ../Shared
git pull
git submodule update --remote
mvn clean install -DskipTests
cd ../Platform
git pull
git submodule update --remote
mvn clean install -DskipTests
cd ../Protocol-Adapter-OSLP
git pull
git submodule update --remote
mvn clean install -DskipTests
cd ../Protocol-Adapter-DLMS
git pull
git submodule update --remote
mvn clean install -DskipTests
cd ../Protocol-Adapter-IEC61850
git pull
git submodule update --remote
mvn clean install -DskipTests
cd ../Integration-Tests
git pull
git submodule update --remote --init
mvn clean install -DskipTests

