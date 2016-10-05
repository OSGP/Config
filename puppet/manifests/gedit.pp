#node default { }

node 'dev-box' {

	package { 'gedit':
		ensure => present
	}

}
