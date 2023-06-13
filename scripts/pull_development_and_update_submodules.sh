#!/bin/sh

# SPDX-FileCopyrightText: Contributors to the GXF project
#
# SPDX-License-Identifier: Apache-2.0

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
