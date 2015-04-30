#node default { }

node 'dev-box' {

	exec { 'apt-get update':
		command => '/usr/bin/apt-get update',
	}

}
