#!/bin/bash

echo "Extending OSGP development environment for OSGP & SSS development ..."

if [ $HOME ]
then
    SOURCEDIR=$HOME/Sources/SmartSocietyServices
    echo "HOME dir was set, source directory is $SOURCEDIR"
else
    SOURCEDIR=/home/dev/Sources/SmartSocietyServices
    echo "HOME dir was not set, source directory is $SOURCEDIR"
fi
TARGETDIR=/etc/osp/

echo "- copying the automatic tests files to $TARGETDIR/test ..."
cp -f $SOURCEDIR/Smart-Meter-Integration/cucumber-integration-tests/src/test/resources/sm-integration-cucumber.properties $TARGETDIR/samples/test/
cp -f $SOURCEDIR/Integration-Tests/cucumber-tests-webapps-web-core/src/test/resources/cucumber-webapps.properties $TARGETDIR/samples/test/

echo "- copying the SSS configuration files to $TARGETDIR/samples and extending them with .sample ..."
cp -f $SOURCEDIR/Smart-Meter-Integration/sm-integration/src/main/resources/sm-integration.properties $TARGETDIR/samples/sm-integration.properties.sample
cp -f $SOURCEDIR/Smart-Meter-Integration/sm-integration/src/main/resources/logback.xml $TARGETDIR/samples/sm-integration-logback.xml.sample
cp -f $SOURCEDIR/Webapps/web-owner/src/main/resources/web-owner.properties $TARGETDIR/samples/web-owner.properties.sample
cp -f $SOURCEDIR/Webapps/web-owner/src/main/resources/logback.xml $TARGETDIR/samples/web-owner-logback.xml.sample
cp -f $SOURCEDIR/Webapps/web-operator/src/main/resources/web-operator.properties $TARGETDIR/samples/web-operator.properties.sample
cp -f $SOURCEDIR/Webapps/web-operator/src/main/resources/logback.xml $TARGETDIR/samples/web-operator-logback.xml.sample
cp -f $SOURCEDIR/Webapps/proxy-server/src/main/resources/proxy-server.properties $TARGETDIR/samples/proxy-server.properties.sample
cp -f $SOURCEDIR/Webapps/proxy-server/src/main/resources/logback.xml $TARGETDIR/samples/proxy-server-logback.xml.sample
cp -f $SOURCEDIR/Webapps/osgp-webservice-client/src/main/resources/osgp-webservice-client.properties $TARGETDIR/samples/osgp-webservice-client.properties.sample
cp -f $SOURCEDIR/Webapps/web-api-user-management/src/main/resources/web-api-user-management.properties $TARGETDIR/samples/web-api-user-management.properties.sample
cp -f $SOURCEDIR/Webapps/web-api-user-management/src/main/resources/logback.xml $TARGETDIR/samples/web-api-user-management-logback.xml.sample
cp -f $SOURCEDIR/Webapps/web-api-net-management/src/main/resources/web-api-net-management.properties $TARGETDIR/samples/web-api-net-management.properties.sample
cp -f $SOURCEDIR/Webapps/web-api-net-management/src/main/resources/logback.xml $TARGETDIR/samples/web-api-net-management-logback.xml.sample
cp -f $SOURCEDIR/Webapps/web-api-installation/src/main/resources/web-api-installation.properties $TARGETDIR/samples/web-api-installation.properties.sample
cp -f $SOURCEDIR/Webapps/web-api-installation/src/main/resources/logback.xml $TARGETDIR/samples/web-api-installation-logback.xml.sample
cp -f $SOURCEDIR/Webapps/osgp-simulator-dlms-triggered/src/main/resources/logback.xml $TARGETDIR/samples/osgp-simulator-dlms-triggered-logback.xml.sample

echo "- configuring proxyserver related files ..."
sudo mkdir -p /etc/ssl/certs/proxy-server/
sudo ln -sf $HOME/Sources/SmartSocietyServices/Configuration/certificates/flexovlca/certs/proxy-server/sign-key.der /etc/ssl/certs/proxy-server/
sudo ln -sf $HOME/Sources/SmartSocietyServices/Configuration/certificates/flexovlca/certs/proxy-server/verify-key.der /etc/ssl/certs/proxy-server/
sudo ln -sf $HOME/Sources/SmartSocietyServices/Configuration/certificates/proxy/proxy-broker.crt /etc/ssl/certs/proxy-server/
sudo ln -sf $HOME/Sources/SmartSocietyServices/Configuration/certificates/proxy/proxy-broker.ks /etc/ssl/certs/proxy-server/
sudo ln -sf $HOME/Sources/SmartSocietyServices/Configuration/certificates/proxy/proxy-broker.ts /etc/ssl/certs/proxy-server/
sudo ln -sf $HOME/Sources/SmartSocietyServices/Configuration/certificates/proxy/proxy-client.crt /etc/ssl/certs/proxy-server/
sudo ln -sf $HOME/Sources/SmartSocietyServices/Configuration/certificates/proxy/proxy-client.ks /etc/ssl/certs/proxy-server/
sudo ln -sf $HOME/Sources/SmartSocietyServices/Configuration/certificates/proxy/proxy-client.ts /etc/ssl/certs/proxy-server/

echo "- create $TARGETDIR/mailtemplates directory and linking files ..."
mkdir -p /etc/osp/mailtemplates/
ln -sf $HOME/Sources/SmartSocietyServices/Configuration/developers/master-template.html /etc/osp/mailtemplates/
dir="$HOME/Sources/SmartSocietyServices/Configuration/developers/mailtemplates"
target="/etc/osp/mailtemplates/"
for f in "$dir"/*; do
  ln -sf "$f" "$target"
done
dir="$HOME/Sources/SmartSocietyServices/Configuration/developers/mailtemplates/web-installation"
for f in "$dir"/*; do
  ln -sf "$f" "$target"
done

mkdir -p /etc/osp/shipment/
mkdir -p /etc/osp/substations/

echo "- create $TARGETDIR/styling directory and linking files ..."
mkdir -p /etc/osp/styling/
dir="$HOME/Sources/SmartSocietyServices/Configuration/developers/css"
target="/etc/osp/styling/"
for f in "$dir"/*; do
  ln -sf "$f" "$target"
done

echo "- create $TARGETDIR/logos directory and linking files ..."
mkdir -p /etc/osp/logos/
dir="$HOME/Sources/SmartSocietyServices/Configuration/developers/logos"
target="/etc/osp/logos/"
for f in "$dir"/*; do
  ln -sf "$f" "$target"
done

echo "- create symlink to apache vhost and remove the link to the 000-default.conf vhost ..."
sudo ln -sf $HOME/Sources/SmartSocietyServices/Configuration/developers/apache2/flexovl-vhost /etc/apache2/sites-enabled/vhost.conf
sudo service apache2 restart

echo "- creating build script for SSS in $HOME/Sources/SmartSocietyServices ..."
ln -sf $HOME/Sources/SmartSocietyServices/Configuration/scripts/build_sss_sources.sh $HOME/Sources/SmartSocietyServices/b.sh

echo "- creating SSS link to $HOME/Sources/SmartSocietyServices ..."
[ ! -L $HOME/Sources/SSS ] && ln -sf $HOME/Sources/SmartSocietyServices/ $HOME/Sources/SSS

echo "- creating links to create backup and restore databases ..."
ln -sf $HOME/Sources/SmartSocietyServices/Configuration/scripts/create_backup_osgp_and_sss_dbs.sh $HOME/scripts/
ln -sf $HOME/Sources/SmartSocietyServices/Configuration/scripts/restore_backup_osgp_and_sss_dbs.sh $HOME/scripts/

echo "Done extending the OSGP development environment for OSGP & SSS development."
