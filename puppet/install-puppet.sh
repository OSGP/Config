#!/bin/bash
#
# Run this script as your user, not as root!
# The script will prompt for root password (for the first sudo command) and will prompt if you want to continue with installation of packages (for the apt-get install command).

echo "downloading puppet.deb file to ~/Downloads folder";
wget -q -P ~/Downloads - https://apt.puppetlabs.com/puppet-release-xenial.deb

echo "preparing puppet.deb file";
sudo dpkg -i ~/Downloads/puppet-release-xenial.deb

echo "running apt-get update";
sudo apt-get -o DPkg::Options::=--force-confdef update

echo "installing puppet";
sudo apt-get -o DPkg::Options::=--force-confdef install -y puppet-common
sudo apt-get -o DPkg::Options::=--force-confdef install -y puppet

echo "running puppet --version";
echo $(puppet --version)

echo "removing templatedir setting from puppet.conf";
sudo sed -i '/^templatedir/d' /etc/puppet/puppet.conf

exit 0;
