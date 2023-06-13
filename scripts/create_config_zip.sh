#!/bin/bash

# SPDX-FileCopyrightText: Contributors to the GXF project
#
# SPDX-License-Identifier: Apache-2.0

# Create a zip file for deployment of the configuration files.
# Note: This is a temporary file, which will be removed when the deployment process of the application is updated.

SOURCEDIR=/home/dev/Sources/OSGP
TARGETDIR=tmp

mkdir -p $TARGETDIR/test

echo "# Global cucumber properties" > $TARGETDIR/test/global-cucumber.properties
cp $SOURCEDIR/Integration-Tests/cucumber-tests-platform/src/test/resources/cucumber-platform.properties $TARGETDIR/test/
cp $SOURCEDIR/Integration-Tests/cucumber-tests-platform-dlms/src/test/resources/cucumber-platform-dlms.properties $TARGETDIR/test/

echo "# Global properties" > $TARGETDIR/global.properties
cp $SOURCEDIR/Platform/osgp-adapter-domain-admin/src/main/resources/osgp-adapter-domain-admin.properties $TARGETDIR
cp $SOURCEDIR/Platform/osgp-adapter-domain-admin/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-domain-admin-logback.xml
cp $SOURCEDIR/Platform/osgp-adapter-domain-core/src/main/resources/osgp-adapter-domain-core.properties $TARGETDIR
cp $SOURCEDIR/Platform/osgp-adapter-domain-core/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-domain-core-logback.xml
cp $SOURCEDIR/Platform/osgp-adapter-domain-microgrids/src/main/resources/osgp-adapter-domain-microgrids.properties $TARGETDIR
cp $SOURCEDIR/Platform/osgp-adapter-domain-microgrids/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-domain-microgrids-logback.xml
cp $SOURCEDIR/Platform/osgp-adapter-domain-distributionautomation/src/main/resources/osgp-adapter-domain-distributionautomation.properties $TARGETDIR
cp $SOURCEDIR/Platform/osgp-adapter-domain-distributionautomation/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-domain-distributionautomation-logback.xml
cp $SOURCEDIR/Platform/osgp-adapter-domain-publiclighting/src/main/resources/osgp-adapter-domain-publiclighting.properties $TARGETDIR
cp $SOURCEDIR/Platform/osgp-adapter-domain-publiclighting/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-domain-publiclighting-logback.xml
cp $SOURCEDIR/Platform/osgp-adapter-domain-smartmetering/src/main/resources/osgp-adapter-domain-smartmetering.properties $TARGETDIR
cp $SOURCEDIR/Platform/osgp-adapter-domain-smartmetering/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-domain-smartmetering-logback.xml
cp $SOURCEDIR/Platform/osgp-adapter-domain-tariffswitching/src/main/resources/osgp-adapter-domain-tariffswitching.properties $TARGETDIR
cp $SOURCEDIR/Platform/osgp-adapter-domain-tariffswitching/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-domain-tariffswitching-logback.xml
cp $SOURCEDIR/Protocol-Adapter-DLMS/osgp-protocol-adapter-dlms/src/main/resources/osgp-adapter-protocol-dlms.properties $TARGETDIR
cp $SOURCEDIR/Protocol-Adapter-DLMS/osgp-protocol-adapter-dlms/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-protocol-dlms-logback.xml
cp $SOURCEDIR/Protocol-Adapter-IEC61850/osgp-protocol-adapter-iec61850/src/main/resources/osgp-adapter-protocol-iec61850.properties $TARGETDIR
cp $SOURCEDIR/Protocol-Adapter-IEC61850/osgp-protocol-adapter-iec61850/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-protocol-iec61850-logback.xml
cp $SOURCEDIR/Protocol-Adapter-OSLP/osgp-adapter-protocol-oslp/src/main/resources/osgp-adapter-protocol-oslp.properties $TARGETDIR
cp $SOURCEDIR/Protocol-Adapter-OSLP/osgp-adapter-protocol-oslp/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-protocol-oslp-logback.xml
cp $SOURCEDIR/Protocol-Adapter-OSLP/osgp-adapter-protocol-oslp-elster/src/main/resources/osgp-adapter-protocol-oslp-elster.properties $TARGETDIR
cp $SOURCEDIR/Protocol-Adapter-OSLP/osgp-adapter-protocol-oslp-elster/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-protocol-oslp-elster-logback.xml
cp $SOURCEDIR/Platform/osgp-adapter-ws-admin/src/main/resources/osgp-adapter-ws-admin.properties $TARGETDIR
cp $SOURCEDIR/Platform/osgp-adapter-ws-admin/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-ws-admin-logback.xml
cp $SOURCEDIR/Platform/osgp-adapter-ws-core/src/main/resources/osgp-adapter-ws-core.properties $TARGETDIR
cp $SOURCEDIR/Platform/osgp-adapter-ws-core/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-ws-core-logback.xml
cp $SOURCEDIR/Platform/osgp-adapter-ws-microgrids/src/main/resources/osgp-adapter-ws-microgrids.properties $TARGETDIR
cp $SOURCEDIR/Platform/osgp-adapter-ws-microgrids/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-ws-microgrids-logback.xml
cp $SOURCEDIR/Platform/osgp-adapter-ws-distributionautomation/src/main/resources/osgp-adapter-ws-distributionautomation.properties $TARGETDIR
cp $SOURCEDIR/Platform/osgp-adapter-ws-distributionautomation/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-ws-distributionautomation-logback.xml
cp $SOURCEDIR/Platform/osgp-adapter-ws-publiclighting/src/main/resources/osgp-adapter-ws-publiclighting.properties $TARGETDIR
cp $SOURCEDIR/Platform/osgp-adapter-ws-publiclighting/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-ws-publiclighting-logback.xml
cp $SOURCEDIR/Platform/osgp-adapter-ws-smartmetering/src/main/resources/osgp-adapter-ws-smartmetering.properties $TARGETDIR
cp $SOURCEDIR/Platform/osgp-adapter-ws-smartmetering/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-ws-smartmetering-logback.xml
cp $SOURCEDIR/Platform/osgp-adapter-ws-tariffswitching/src/main/resources/osgp-adapter-ws-tariffswitching.properties $TARGETDIR
cp $SOURCEDIR/Platform/osgp-adapter-ws-tariffswitching/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-ws-tariffswitching-logback.xml
cp $SOURCEDIR/Platform/osgp-core/src/main/resources/osgp-core.properties $TARGETDIR
cp $SOURCEDIR/Platform/osgp-core/src/main/resources/logback.xml $TARGETDIR/osgp-core-logback.xml
cp $SOURCEDIR/Platform/osgp-logging/src/main/resources/osgp-logging.properties $TARGETDIR
cp $SOURCEDIR/Platform/osgp-logging/src/main/resources/logback.xml $TARGETDIR/osgp-logging-logback.xml
cp $SOURCEDIR/Protocol-Adapter-OSLP/signing-server/src/main/resources/signing-server.properties $TARGETDIR
cp $SOURCEDIR/Protocol-Adapter-OSLP/signing-server/src/main/resources/logback.xml $TARGETDIR/signing-server-logback.xml
cp $SOURCEDIR/Protocol-Adapter-OSLP/web-device-simulator/src/main/resources/web-device-simulator.properties $TARGETDIR
cp $SOURCEDIR/Protocol-Adapter-OSLP/web-device-simulator/src/main/resources/logback.xml $TARGETDIR/web-device-simulator-logback.xml
cp $SOURCEDIR/Protocol-Adapter-OSLP/osgp-core-db-api/src/main/resources/osgp-core-db-api.properties $TARGETDIR
cp $SOURCEDIR/Protocol-Adapter-IEC61850/osgp-core-db-api-iec61850/src/main/resources/osgp-core-db-api-iec61850.properties $TARGETDIR
cp $SOURCEDIR/Protocol-Adapter-DLMS/osgp-jasper-interface/src/main/resources/jasper-interface.properties $TARGETDIR
cp $SOURCEDIR/Platform/osgp-domain-logging/src/main/resources/osgp-domain-logging.properties $TARGETDIR

cd $TARGETDIR
zip ../config.zip *
cd ..
rm -rf $TARGETDIR
