#!/bin/bash
#
# Run this script as your user, not as root!
# The script will prompt for root password (for the first sudo command) and will prompt if you want to continue with installation of packages (for the apt-get install command).

echo "downloading puppet.deb file to ~/Downloads folder";
wget -q -P ~/Downloads - https://apt.puppetlabs.com/puppetlabs-release-trusty.deb

echo "preparing puppet.deb file";
sudo dpkg -i ~/Downloads/puppetlabs-release-trusty.deb

echo "running apt-get update";
sudo apt-get update

echo "installing puppet";
sudo apt-get install -y puppet

echo "running puppet --version";
echo $(puppet --version)

echo "removing templatedir setting from puppet.conf";
sudo sed -i '/^templatedir/d' /etc/puppet/puppet.conf

exit 0;
