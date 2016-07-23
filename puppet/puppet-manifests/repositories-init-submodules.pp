#node default { }

node 'dev-box' {

	exec { 'Platform repo':
		command => '/bin/sh -c "cd /home/vagrant/Sources/Platform; /usr/bin/git submodule update --init --recursive"',
		returns => [0,1,128],
	}

	exec { 'Protocol-Adapter-OSLP repo':
		command => '/bin/sh -c "cd /home/vagrant/Sources/Protocol-Adapter-OSLP; /usr/bin/git submodule update --init --recursive"',
		returns => [0,1,128],
	}

	exec { 'Protocol-Adapter-DLMS repo':
		command => '/bin/sh -c "cd /home/vagrant/Sources/Protocol-Adapter-DLMS; /usr/bin/git submodule update --init --recursive"',
		returns => [0,1,128],
	}

}
