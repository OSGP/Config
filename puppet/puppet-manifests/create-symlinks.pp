#node default { }

node 'dev-box' {

	exec { 'create symlinks for apps and logging config files':
		command => '/bin/sh -c "/home/dev/Sources/Config/scripts/create-symlinks.sh"',
	}

}
