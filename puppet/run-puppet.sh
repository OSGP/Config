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
echo "## Installing JDK                                           ##"
echo "##############################################################"
sudo puppet apply $NOOP ./puppet-manifests/install-java.pp

echo "##############################################################"
echo "## Adding 'dev' user                                        ##"
echo "##############################################################"
sudo puppet apply $NOOP ./puppet-manifests/add-dev-user.pp

echo "##############################################################"
echo "## Installing Dev. Env.                                     ##"
echo "##############################################################"
sudo puppet apply $NOOP ./puppet-manifests/install-dev-env.pp

echo "##############################################################"
echo "## Holding packages                                         ##"
echo "##############################################################"
sudo puppet apply $NOOP ./puppet-manifests/hold-protobuf-packages.pp

echo "##############################################################"
echo "## Cloning GitHub repositories                              ##"
echo "##############################################################"
sudo puppet apply $NOOP ./puppet-manifests/create-source-code-folder.pp
sudo puppet apply $NOOP ./puppet-manifests/clone-repositories.pp
sudo puppet apply $NOOP ./puppet-manifests/repositories-checkout-development-branch.pp
sudo puppet apply $NOOP ./puppet-manifests/repositories-init-submodules.pp
sudo puppet apply $NOOP ./puppet-manifests/chown-source-folders.pp

echo "##############################################################"
echo "## Creating config and loggin folders                       ##"
echo "##############################################################"
sudo puppet apply $NOOP ./puppet-manifests/create-logging-folder.pp
sudo puppet apply $NOOP ./puppet-manifests/create-config-folder.pp

echo "##############################################################"
echo "## Setting JAVA_HOME environment variable                   ##"
echo "##############################################################"
sudo puppet apply $NOOP ./puppet-manifests/set-java-home-env-var.pp

echo "##############################################################"
echo "## Create symlinks                                          ##"
echo "##############################################################"
sudo puppet apply $NOOP ./puppet-manifests/create-symlinks.pp

echo "##############################################################"
echo "## Init DB                                                  ##"
echo "##############################################################"
sudo puppet apply $NOOP ./puppet-manifests/init-db.pp

echo "##############################################################"
echo "## Cleanup                                                  ##"
echo "##############################################################"
sudo puppet apply $NOOP ./puppet-manifests/cleanup.pp

echo ""
echo "DONE"
echo ""
