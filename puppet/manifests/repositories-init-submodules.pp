#node default { }

node 'dev-box' {

	exec { 'Platform repo':
		command => '/bin/sh -c "cd /home/dev/Sources/OSGP/Platform; /usr/bin/git submodule update --init --recursive"',
		returns => [0,1,128],
	}

	exec { 'Protocol-Adapter-OSLP repo':
		command => '/bin/sh -c "cd /home/dev/Sources/OSGP/Protocol-Adapter-OSLP; /usr/bin/git submodule update --init --recursive"',
		returns => [0,1,128],
	}

	exec { 'Protocol-Adapter-DLMS repo':
		command => '/bin/sh -c "cd /home/dev/Sources/OSGP/Protocol-Adapter-DLMS; /usr/bin/git submodule update --init --recursive"',
		returns => [0,1,128],
	}

	exec { 'Protocol-Adapter-IEC61850 repo':
		command => '/bin/sh -c "cd /home/dev/Sources/OSGP/Protocol-Adapter-IEC61850; /usr/bin/git submodule update --init --recursive"',
		returns => [0,1,128],
	}

        exec { 'Integration-Tests repo':
                command => '/bin/sh -c "cd /home/dev/Sources/OSGP/Integration-Tests; /usr/bin/git submodule update --init --recursive"',
                returns => [0,1,128],
        }

}
