#node default { }

node 'dev-box' {

	exec { 'Platform repo':
		command => '/bin/sh -c "cd /home/dev/Sources/Platform; /usr/bin/git submodule update --init --recursive"',
		returns => [0,128],
	}

	exec { 'Protocol-Adapter-OSLP repo':
		command => '/bin/sh -c "cd /home/dev/Sources/Protocol-Adapter-OSLP; /usr/bin/git update --init --recursive"',
		returns => [0,128],
	}

}
