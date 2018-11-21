#!/bin/bash

NOFPROC=1C

cd Config
git pull
cd ../Documentation
git pull
cd ../open-smart-grid-platform
git pull
mvn clean install -T $NOFPROC
cd ..
