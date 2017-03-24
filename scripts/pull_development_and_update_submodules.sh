#!/bin/sh

cd Shared
git pull origin development
cd ../Platform
git pull origin development
git submodule update --remote
cd ../Protocol-Adapter-OSLP
git pull origin development
git submodule update --remote
cd ../Protocol-Adapter-DLMS
git pull origin development
git submodule update --remote
cd ../Protocol-Adapter-IEC61850
git pull origin development
git submodule update --remote
cd ../Integration-Tests
git pull origin development
git submodule update --remote
cd ../Config
git pull origin development
cd ../Documentation 
git pull origin development
cd ../PublicLightingDemoApp 
git pull origin development
git submodule update --remote
cd ..

echo Done.
