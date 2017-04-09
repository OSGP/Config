#node default { }

node 'dev-box' {

	$homedir='/home/dev'

	# Extract OSGP workspace
	exec { 'unpack OSGP eclipse workspace':
		command => "/bin/mkdir -p ${homedir}/workspace && /bin/tar xzf ${homedir}/Sources/OSGP/Config/eclipse/osgp.tar.gz -C ${homedir}/workspace",
		onlyif => "/usr/bin/test ! -d ${homedir}/workspace/OSGP",
	}

}
