#!/bin/bash

echo "### Create Desktop folder if it doesnt excist"
if [ ! -d "/home/dev/Desktop" ]; then
  mkdir /home/dev/Desktop
fi

echo "### Make helper scripts executable"
chmod u+rwx /home/vagrant/repos/Config/scripts/create_application_shortcut.sh
chmod u+rwx /home/vagrant/repos/Config/scripts/create_weblink_shortcut.sh

echo "### Create shortcuts"
/home/vagrant/repos/Config/scripts/create_application_shortcut.sh eclipse false /home/dev/Tools/eclipse/icon.xpm Eclipse /home/dev/Tools/eclipse/eclipse

/home/vagrant/repos/Config/scripts/create_application_shortcut.sh activemq true /usr/share/icons/hicolor/48x48/apps/openjdk-7.png ActiveMQ "/home/dev/Tools/apache-activemq-5.11.1/bin/linux-x86-64/activemq console"

/home/vagrant/repos/Config/scripts/create_application_shortcut.sh soapui false /usr/share/icons/hicolor/icons/scalable/status/account-logged-in.svg SoapUI /home/dev/Tools/SoapUI-5.2.1/bin/soapui.sh

/home/vagrant/repos/Config/scripts/create_weblink_shortcut.sh github "OSGP Github" "http://www.github.com/osgp/"

/home/vagrant/repos/Config/scripts/create_weblink_shortcut.sh documentation "OSGP Documentation" "http://documentation.opensmartgridplatform.org/"

/home/vagrant/repos/Config/scripts/create_weblink_shortcut.sh devicesim "OSLP Device Simulator" "https://localhost/web-device-simulator/devices"

/home/vagrant/repos/Config/scripts/create_weblink_shortcut.sh osgp "Open Smart Grid Platform website" "http://www.opensmartgridplatform.org/"

