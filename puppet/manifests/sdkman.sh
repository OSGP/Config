#!/bin/bash

echo "Switch to dev user..."
sudo -i -u dev bash << EOF

echo "Try to get sdkman..."
/usr/bin/curl -s "https://get.sdkman.io" | bash
echo $?

echo "Source sdkman init script..."
source /home/dev/.sdkman/bin/sdkman-init.sh

echo "Print sdkman version..."
sdk version

echo "Install java 17..."
sdk install java 17.0.5-tem < /dev/null

echo "Print java version"
java --version
EOF

exit 0