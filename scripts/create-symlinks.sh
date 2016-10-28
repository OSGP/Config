#!/bin/bash

# Create links for all property files and logback configuration files
sudo mkdir -p /etc/osp/test
sudo chown -R dev:dev /etc/osp

SOURCEDIR=/home/dev/Sources/OSGP
TARGETDIR=/etc/osp/
sudo bash -c "echo \"# Global cucumber properties\" > $TARGETDIR/test/global-cucumber.properties"
sudo ln -sf $SOURCEDIR/Integration-Tests/cucumber-tests-platform/src/test/resources/cucumber-platform.properties $TARGETDIR/test/
sudo ln -sf $SOURCEDIR/Integration-Tests/cucumber-tests-platform-dlms/src/test/resources/cucumber-platform-dlms.properties $TARGETDIR/test/

sudo bash -c "echo \"# Global properties\" > $TARGETDIR/global.properties"
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-domain-admin/src/main/resources/osgp-adapter-domain-admin.properties $TARGETDIR
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-domain-admin/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-domain-admin-logback.xml
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-domain-core/src/main/resources/osgp-adapter-domain-core.properties $TARGETDIR
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-domain-core/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-domain-core-logback.xml
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-domain-microgrids/src/main/resources/osgp-adapter-domain-microgrids.properties $TARGETDIR
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-domain-microgrids/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-domain-microgrids-logback.xml
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-domain-publiclighting/src/main/resources/osgp-adapter-domain-publiclighting.properties $TARGETDIR
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-domain-publiclighting/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-domain-publiclighting-logback.xml
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-domain-smartmetering/src/main/resources/osgp-adapter-domain-smartmetering.properties $TARGETDIR
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-domain-smartmetering/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-domain-smartmetering-logback.xml
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-domain-tariffswitching/src/main/resources/osgp-adapter-domain-tariffswitching.properties $TARGETDIR
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-domain-tariffswitching/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-domain-tariffswitching-logback.xml
sudo ln -sf $SOURCEDIR/Protocol-Adapter-DLMS/osgp-protocol-adapter-dlms/src/main/resources/osgp-adapter-protocol-dlms.properties $TARGETDIR
sudo ln -sf $SOURCEDIR/Protocol-Adapter-DLMS/osgp-protocol-adapter-dlms/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-protocol-dlms-logback.xml
sudo ln -sf $SOURCEDIR/Protocol-Adapter-IEC61850/osgp-protocol-adapter-iec61850/src/main/resources/osgp-adapter-protocol-iec61850.properties $TARGETDIR
sudo ln -sf $SOURCEDIR/Protocol-Adapter-IEC61850/osgp-protocol-adapter-iec61850/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-protocol-iec61850-logback.xml
sudo ln -sf $SOURCEDIR/Protocol-Adapter-OSLP/osgp-adapter-protocol-oslp/src/main/resources/osgp-adapter-protocol-oslp.properties $TARGETDIR
sudo ln -sf $SOURCEDIR/Protocol-Adapter-OSLP/osgp-adapter-protocol-oslp/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-protocol-oslp-logback.xml
sudo ln -sf $SOURCEDIR/Protocol-Adapter-OSLP/osgp-adapter-protocol-oslp-elster/src/main/resources/osgp-adapter-protocol-oslp-elster.properties $TARGETDIR
sudo ln -sf $SOURCEDIR/Protocol-Adapter-OSLP/osgp-adapter-protocol-oslp-elster/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-protocol-oslp-elster-logback.xml
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-ws-admin/src/main/resources/osgp-adapter-ws-admin.properties $TARGETDIR
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-ws-admin/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-ws-admin-logback.xml
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-ws-core/src/main/resources/osgp-adapter-ws-core.properties $TARGETDIR
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-ws-core/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-ws-core-logback.xml
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-ws-microgrids/src/main/resources/osgp-adapter-ws-microgrids.properties $TARGETDIR
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-ws-microgrids/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-ws-microgrids-logback.xml
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-ws-publiclighting/src/main/resources/osgp-adapter-ws-publiclighting.properties $TARGETDIR
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-ws-publiclighting/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-ws-publiclighting-logback.xml
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-ws-smartmetering/src/main/resources/osgp-adapter-ws-smartmetering.properties $TARGETDIR
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-ws-smartmetering/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-ws-smartmetering-logback.xml
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-ws-tariffswitching/src/main/resources/osgp-adapter-ws-tariffswitching.properties $TARGETDIR
sudo ln -sf $SOURCEDIR/Platform/osgp-adapter-ws-tariffswitching/src/main/resources/logback.xml $TARGETDIR/osgp-adapter-ws-tariffswitching-logback.xml
sudo ln -sf $SOURCEDIR/Platform/osgp-core/src/main/resources/osgp-core.properties $TARGETDIR
sudo ln -sf $SOURCEDIR/Platform/osgp-core/src/main/resources/logback.xml $TARGETDIR/osgp-core-logback.xml
sudo ln -sf $SOURCEDIR/Platform/osgp-logging/src/main/resources/osgp-logging.properties $TARGETDIR
sudo ln -sf $SOURCEDIR/Platform/osgp-logging/src/main/resources/logback.xml $TARGETDIR/osgp-logging-logback.xml
sudo ln -sf $SOURCEDIR/Protocol-Adapter-OSLP/signing-server/src/main/resources/signing-server.properties $TARGETDIR
sudo ln -sf $SOURCEDIR/Protocol-Adapter-OSLP/signing-server/src/main/resources/logback.xml $TARGETDIR/signing-server-logback.xml
sudo ln -sf $SOURCEDIR/Protocol-Adapter-OSLP/web-device-simulator/src/main/resources/web-device-simulator.properties $TARGETDIR
sudo ln -sf $SOURCEDIR/Protocol-Adapter-OSLP/web-device-simulator/src/main/resources/logback.xml $TARGETDIR/web-device-simulator-logback.xml
sudo ln -sf $SOURCEDIR/Protocol-Adapter-OSLP/osgp-core-db-api/src/main/resources/osgp-core-db-api.properties $TARGETDIR
sudo ln -sf $SOURCEDIR/Protocol-Adapter-IEC61850/osgp-core-db-api-iec61850/src/main/resources/osgp-core-db-api-iec61850.properties $TARGETDIR
sudo ln -sf $SOURCEDIR/Protocol-Adapter-DLMS/osgp-jasper-interface/src/main/resources/jasper-interface.properties $TARGETDIR
sudo ln -sf $SOURCEDIR/Platform/osgp-domain-logging/src/main/resources/osgp-domain-logging.properties $TARGETDIR

# Create symlinks to device simulator ECDSA keypair.
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/oslp/oslp_sim_ecdsa_private.der /etc/ssl/certs
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/oslp/oslp_sim_ecdsa_public.der /etc/ssl/certs

# Create symlinks to platform ECDSA keypair.
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/oslp/oslp_test_ecdsa_private.der /etc/ssl/certs
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/oslp/oslp_test_ecdsa_public.der /etc/ssl/certs

# Create symlinks to secret.aes.
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/oslp/secret.aes /etc/ssl/certs

# Create symlink to CA certificate.
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/osgp-ca/certs/cacert.cer /etc/ssl/certs

# Create symlink to server certificate.
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/osgp-ca/certs/localhost.cert.pem /etc/ssl/certs

# Create symlink to organization certificate and personal information exchange.
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/osgp-ca/certs/test-org.cert.pem /etc/ssl/certs
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/osgp-ca/certs/test-org.pfx /etc/ssl/certs

# Create symlink to server private key.
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/osgp-ca/private/localhost.key.pem /etc/ssl/private

# Create symlink to organization private key.
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/osgp-ca/private/test-org.key.pem /etc/ssl/private

# Create symlink to keystore.
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/trust.jks /etc/ssl/certs

# Create symlink to apache vhost and remove the link to the 000-default.conf vhost.
sudo ln -sf /home/dev/Sources/OSGP/Config/apache-httpd/vhost.conf /etc/apache2/sites-enabled
sudo rm -f /etc/apache2/sites-enabled/000-default.conf
sudo service apache2 restart

# Create symlink to Maven settings
sudo mkdir -p /home/dev/.m2
sudo ln -sf /home/dev/Sources/OSGP/Config/maven/settings.xml /home/dev/.m2
sudo chown -R dev:dev /home/dev/.m2

sudo ln -sf /home/dev/Sources/OSGP/Config/scripts/build_osgp_sources.sh /home/dev/Sources/OSGP/b.sh
