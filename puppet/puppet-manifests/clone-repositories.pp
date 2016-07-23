#node default { }

node 'dev-box' {

	exec { 'cloning Config repo':
		command => '/usr/bin/git clone https://github.com/OSGP/Config.git /home/vagrant/Sources/Config',
	}

	exec { 'cloning Shared repo':
		command => '/usr/bin/git clone https://github.com/OSGP/Shared.git /home/vagrant/Sources/Shared',
	}

	exec { 'cloning Platform repo':
		command => '/usr/bin/git clone https://github.com/OSGP/Platform.git /home/vagrant/Sources/Platform',
	}

	exec { 'cloning Protocol-Adapter-OSLP repo':
		command => '/usr/bin/git clone https://github.com/OSGP/Protocol-Adapter-OSLP.git /home/vagrant/Sources/Protocol-Adapter-OSLP',
	}

	exec { 'cloning Protocol-Adapter-DLMS repo':
		command => '/usr/bin/git clone https://github.com/OSGP/Protocol-Adapter-DLMS.git /home/vagrant/Sources/Protocol-Adapter-DLMS',
	}

}
