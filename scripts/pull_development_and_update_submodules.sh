#!/bin/sh

echo ">>> Shared ..."
cd Shared
git fetch
git pull
git pull origin development
echo ">>> Platform ..."
cd ../Platform
git fetch
git pull
git pull origin development
git submodule update --remote
echo ">>> Protocol-Adapter-OSLP ..."
cd ../Protocol-Adapter-OSLP
git fetch
git pull
git pull origin development
git submodule update --remote
echo ">>> Protocol-Adapter-DLMS ..."
cd ../Protocol-Adapter-DLMS
git fetch
git pull
git pull origin development
git submodule update --remote
echo ">>> Protocol-Adapter-IEC61850 ..."
cd ../Protocol-Adapter-IEC61850
git fetch
git pull
git pull origin development
git submodule update --remote
echo ">>> Integration-Tests ..."
cd ../Integration-Tests
git fetch
git pull
git pull origin development
git submodule update --remote
echo ">>> Config ..."
cd ../Config
git fetch
git pull
git pull origin development
echo ">>> Documentation ..."
cd ../Documentation 
git fetch
git pull
git pull origin development
echo ">>> PublicLightingDemoApp ..."
cd ../PublicLightingDemoApp 
git fetch
git pull
git pull origin development
git submodule update --remote
cd ..

echo Done.
