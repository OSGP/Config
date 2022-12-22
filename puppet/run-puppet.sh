#!/bin/bash
#
# Pass 'something' as argument to the script to use --noop.
#
# ./run-puppet.sh bla --> runs the script using --noop.
# ./run-puppet.sh     --> runs the script for real!
#
if [ $1 ] ;
	then
		echo "using puppet apply --noop"
		NOOP=--noop
	else
		echo "using puppet apply"
		NOOP=''
fi

# Choose the warning level for ruby.
#
# -W[level]       set warning level; 0=silence, 1=medium, 2=verbose (default)
RUBY_WARNING_LEVEL='RUBYOPT=-W0'

echo "##############################################################"
echo "## Installing puppet modules                                ##"
echo "##############################################################"
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/modules.pp

echo "##############################################################"
echo "## Update system                                            ##"
echo "##############################################################"
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/vm-corrections.pp

echo "##############################################################"
echo "## Adding 'dev' user                                        ##"
echo "##############################################################"
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/add-dev-user.pp

echo "##############################################################"
echo "## Installing JDK                                           ##"
echo "##############################################################"
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/install-java.pp

echo "##############################################################"
echo "## Installing Dev. Env.                                     ##"
echo "##############################################################"
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/create-download-folder.pp
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/create-tools-folder.pp
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/install-dev-env.pp

echo "##############################################################"
echo "## Installing GEDIT                                         ##"
echo "##############################################################"
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/gedit.pp

echo "##############################################################"
echo "## Installing git                                           ##"
echo "##############################################################"
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/git.pp

echo "##############################################################"
echo "## Cloning GitHub repositories                              ##"
echo "##############################################################"
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/create-source-code-folder.pp
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/clone-repositories.pp
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/repositories-checkout-development-branch.pp

echo "##############################################################"
echo "## Installing apache2                                       ##"
echo "##############################################################"
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/apache2.pp

echo "##############################################################"
echo "## Installing postgresql                                    ##"
echo "##############################################################"
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/postgresql.pp

echo "##############################################################"
echo "## Installing tomcat                                        ##"
echo "##############################################################"
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/tomcat8.5.pp
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/tomcat9.0.pp

echo "##############################################################"
echo "## Installing activemq                                      ##"
echo "##############################################################"
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/activemq.pp
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/activemq-development.pp

echo "##############################################################"
echo "## Installing eclipse                                       ##"
echo "##############################################################"
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/eclipse.pp
# Disabled sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/configure-eclipse.pp

# Disabled echo "##############################################################"
# Disabled echo "## Installing python/pip and AWS CLI                        ##"
# Disabled echo "##############################################################"
# Disabled sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/python.pp
# Disabled sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/aws.pp

echo "##############################################################"
echo "## Installing soapui                                        ##"
echo "##############################################################"
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/soapui.pp

echo "##############################################################"
echo "## Holding packages                                         ##"
echo "##############################################################"
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/hold-protobuf-packages.pp

echo "##############################################################"
echo "## Creating config and loggin folders                       ##"
echo "##############################################################"
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/create-logging-folder.pp
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/create-config-folder.pp
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/create-firmware-folder.pp

#echo "##############################################################"
#echo "## Setting JAVA_HOME environment variable                   ##"
#echo "##############################################################"
#sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/set-java-home-env-var.pp

echo "##############################################################"
echo "## Create symlinks                                          ##"
echo "##############################################################"
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/create-symlinks.pp
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/configure-osgp.pp

echo "##############################################################"
echo "## Init DB                                                  ##"
echo "##############################################################"
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/init-db.pp

echo "##############################################################"
echo "## Personalize desktop                                      ##"
echo "##############################################################"
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/personalize-desktop.pp

# Disabled echo "##############################################################"
# Disabled echo "## Installing intellij                                      ##"
# Disabled echo "##############################################################"
# Disabled sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/intellij.pp

# Disabled echo "##############################################################"
# Disabled echo "## Installing ansible                                       ##"
# Disabled echo "##############################################################"
# Disabled sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/ansible.pp

echo "##############################################################"
echo "## Installing lombok                                        ##"
echo "##############################################################"
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/lombok.pp

echo "##############################################################"
echo "## Cleanup                                                  ##"
echo "##############################################################"
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/cleanup.pp

sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/fix_owner.pp

echo "##############################################################"
echo "## Restart VM in order to apply various settings            ##"
echo "##############################################################"
sudo $RUBY_WARNING_LEVEL puppet apply $NOOP ./manifests/restart-vm.pp

echo ""
echo "DONE"
echo ""
