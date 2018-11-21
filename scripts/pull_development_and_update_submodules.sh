#!/bin/sh

echo ">>> Open Smart Grid Platform ..."
cd open-smart-grid-platform
git fetch
git pull
git pull origin development
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
cd ..

echo Done.
