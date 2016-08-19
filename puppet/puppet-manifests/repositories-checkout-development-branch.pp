#node default { }

node 'dev-box' {

	exec { 'Config repo':
		command => '/bin/sh -c "cd /home/dev/Sources/OSGP/Config; /usr/bin/git checkout development"',
		returns => [0,128],
	}

	exec { 'Shared repo':
		command => '/bin/sh -c "cd /home/dev/Sources/OSGP/Shared; /usr/bin/git checkout development"',
		returns => [0,128],
	}

	exec { 'Platform repo':
		command => '/bin/sh -c "cd /home/dev/Sources/OSGP/Platform; /usr/bin/git checkout  development"',
		returns => [0,128],
	}

	exec { 'Protocol-Adapter-OSLP repo':
		command => '/bin/sh -c "cd /home/dev/Sources/OSGP/Protocol-Adapter-OSLP; /usr/bin/git checkout development"',
		returns => [0,128],
	}

	exec { 'Protocol-Adapter-DLMS repo':
		command => '/bin/sh -c "cd /home/dev/Sources/OSGP/Protocol-Adapter-DLMS; /usr/bin/git checkout development"',
		returns => [0,128],
	}

}
