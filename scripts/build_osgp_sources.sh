#!/bin/bash

# SPDX-FileCopyrightText: Contributors to the GXF project
#
# SPDX-License-Identifier: Apache-2.0

NOFPROC=1C

cd Config
git pull
cd ../Documentation
git pull
cd ../open-smart-grid-platform
git pull
mvn clean install -T $NOFPROC
cd ..
