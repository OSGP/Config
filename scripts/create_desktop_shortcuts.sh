#!/bin/bash

echo "### Create Desktop folder if it doesnt excist"
if [ ! -d "/home/dev/Desktop" ]; then
  mkdir /home/dev/Desktop
fi

echo "### Create shortcuts"
/home/dev/Sources/OSGP/Config/scripts/create_application_shortcut.sh eclipse false /home/dev/Tools/eclipse/icon.xpm Eclipse /home/dev/Tools/eclipse/eclipse

/home/dev/Sources/OSGP/Config/scripts/create_application_shortcut.sh activemq true /home/dev/Tools/activemq/webapps-demo/demo/images/activemq-logo.png ActiveMQ "/home/dev/Tools/activemq/bin/linux-x86-64/activemq console"

/home/dev/Sources/OSGP/Config/scripts/create_application_shortcut.sh soapui false /home/dev/Tools/SoapUI/logo.png SoapUI /home/dev/Tools/SoapUI/bin/soapui.sh

/home/dev/Sources/OSGP/Config/scripts/create_weblink_shortcut.sh github "OSGP Github" "http://www.github.com/osgp/"

/home/dev/Sources/OSGP/Config/scripts/create_weblink_shortcut.sh documentation "OSGP Documentation" "https://documentation.gxf.lfenergy.org/"

/home/dev/Sources/OSGP/Config/scripts/create_weblink_shortcut.sh devicesim "OSLP Device Simulator" "https://localhost/web-device-simulator/devices"

/home/dev/Sources/OSGP/Config/scripts/create_weblink_shortcut.sh osgp "Grid eXchange Fabric website" "https://www.lfenergy.org/projects/gxf/"

