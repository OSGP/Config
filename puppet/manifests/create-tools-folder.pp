#node default { }

node 'dev-box' {

	exec { 'creating tools folder':
		command => '/bin/mkdir -p /home/dev/Tools',
		before => Exec['chown tools folder'],
	}

	exec { 'chown tools folder':
		command => '/bin/chown -R dev:dev /home/dev/Tools',
	}

}
