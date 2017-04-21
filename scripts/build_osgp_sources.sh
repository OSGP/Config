#!/bin/bash

NOFPROC=1C

cd Config
git pull
cd ../Documentation
git pull
cd ../Shared
git pull
git submodule update --remote
mvn clean install -T $NOFPROC
cd ../Platform
git pull
git submodule update --remote
mvn clean install -T $NOFPROC
cd ../Protocol-Adapter-OSLP
git pull
git submodule update --remote
mvn clean install -T $NOFPROC
cd ../Protocol-Adapter-DLMS
git pull
git submodule update --remote
mvn clean install -T $NOFPROC
cd ../Protocol-Adapter-IEC61850
git pull
git submodule update --remote
mvn clean install -T $NOFPROC
cd ../Integration-Tests
git pull
git submodule update --remote --init
mvn clean install -T $NOFPROC
cd ../PublicLightingDemoApp
git pull
git submodule update --remote --init
mvn clean install -T $NOFPROC

