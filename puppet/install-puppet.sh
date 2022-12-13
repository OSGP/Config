#!/bin/bash
#
# Run this script as your user, not as root!
# The script will prompt for root password (for the first sudo command) and will prompt if you want to continue with installation of packages (for the apt-get install command).

sudo apt-get install facter ruby-augeas hiera ruby ruby-deep-merge ruby-shadow ruby-sorted-set

echo "downloading puppet.deb file to ~/Downloads folder";
wget -q -P ~/Downloads - http://archive.ubuntu.com/ubuntu/pool/universe/p/puppet/puppet_5.5.22-4_all.deb

echo "preparing puppet.deb file";
sudo dpkg -i ~/Downloads/puppet_5.5.22-4_all.deb

#echo "running apt-get update";
#sudo DEBIAN_FRONTEND=noninteractive apt-get -o DPkg::Options::=--force-confdef update

#echo "installing puppet";
#sudo DEBIAN_FRONTEND=noninteractive apt-get -o DPkg::Options::=--force-confdef install -y puppet puppet-common

echo "running puppet --version";
echo $(puppet --version)

echo "Create empty hiera.yml to prevent 'Warning'"
sudo touch /etc/puppet/hiera.yaml

echo "removing templatedir setting from puppet.conf";
sudo sed -i '/^templatedir/d' /etc/puppet/puppet.conf

exit 0;
