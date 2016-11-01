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

echo "##############################################################"
echo "## Installing puppet modules                                ##"
echo "##############################################################"
sudo puppet apply $NOOP ./manifests/modules.pp

echo "##############################################################"
echo "## Update system                                            ##"
echo "##############################################################"
sudo puppet apply $NOOP ./manifests/vm-corrections.pp

echo "##############################################################"
echo "## Installing JDK                                           ##"
echo "##############################################################"
sudo puppet apply $NOOP ./manifests/install-java.pp

echo "##############################################################"
echo "## Adding 'dev' user                                        ##"
echo "##############################################################"
sudo puppet apply $NOOP ./manifests/add-dev-user.pp

echo "##############################################################"
echo "## Installing Dev. Env.                                     ##"
echo "##############################################################"
sudo puppet apply $NOOP ./manifests/create-download-folder.pp
sudo puppet apply $NOOP ./manifests/create-tools-folder.pp
sudo puppet apply $NOOP ./manifests/install-dev-env.pp

echo "##############################################################"
echo "## Installing GEDIT                                         ##"
echo "##############################################################"
sudo puppet apply $NOOP ./manifests/gedit.pp

echo "##############################################################"
echo "## Installing git                                           ##"
echo "##############################################################"
sudo puppet apply $NOOP ./manifests/git.pp

echo "##############################################################"
echo "## Cloning GitHub repositories                              ##"
echo "##############################################################"
sudo puppet apply $NOOP ./manifests/create-source-code-folder.pp
sudo puppet apply $NOOP ./manifests/clone-repositories.pp
sudo puppet apply $NOOP ./manifests/repositories-checkout-development-branch.pp
sudo puppet apply $NOOP ./manifests/repositories-init-submodules.pp
sudo puppet apply $NOOP ./manifests/chown-source-folders.pp

echo "##############################################################"
echo "## Installing apache2                                       ##"
echo "##############################################################"
sudo puppet apply $NOOP ./manifests/apache2.pp

echo "##############################################################"
echo "## Installing postgresql                                    ##"
echo "##############################################################"
sudo puppet apply $NOOP ./manifests/postgresql.pp

echo "##############################################################"
echo "## Installing tomcat7                                       ##"
echo "##############################################################"
sudo puppet apply $NOOP ./manifests/tomcat7.pp

echo "##############################################################"
echo "## Installing activemq                                      ##"
echo "##############################################################"
sudo puppet apply $NOOP ./manifests/activemq.pp
sudo puppet apply $NOOP ./manifests/activemq-development.pp

echo "##############################################################"
echo "## Installing eclipse                                       ##"
echo "##############################################################"
sudo puppet apply $NOOP ./manifests/eclipse.pp

echo "##############################################################"
echo "## Installing soapui                                        ##"
echo "##############################################################"
sudo puppet apply $NOOP ./manifests/soapui.pp

echo "##############################################################"
echo "## Installing fitnesse                                      ##"
echo "##############################################################"
sudo puppet apply $NOOP ./manifests/fitnesse.pp

echo "##############################################################"
echo "## Holding packages                                         ##"
echo "##############################################################"
sudo puppet apply $NOOP ./manifests/hold-protobuf-packages.pp

echo "##############################################################"
echo "## Creating config and loggin folders                       ##"
echo "##############################################################"
sudo puppet apply $NOOP ./manifests/create-logging-folder.pp
sudo puppet apply $NOOP ./manifests/create-config-folder.pp

echo "##############################################################"
echo "## Setting JAVA_HOME environment variable                   ##"
echo "##############################################################"
sudo puppet apply $NOOP ./manifests/set-java-home-env-var.pp

echo "##############################################################"
echo "## Create symlinks                                          ##"
echo "##############################################################"
sudo puppet apply $NOOP ./manifests/create-symlinks.pp

echo "##############################################################"
echo "## Init DB                                                  ##"
echo "##############################################################"
sudo puppet apply $NOOP ./manifests/init-db.pp

echo "##############################################################"
echo "## Personalize desktop                                      ##"
echo "##############################################################"
sudo puppet apply $NOOP ./manifests/personalize-desktop.pp

echo "##############################################################"
echo "## Cleanup                                                  ##"
echo "##############################################################"
sudo puppet apply $NOOP ./manifests/cleanup.pp

echo "##############################################################"
echo "## Restart VM in order to apply various settings            ##"
echo "##############################################################"
sudo puppet apply $NOOP ./manifests/restart-vm.pp

echo ""
echo "DONE"
echo ""
