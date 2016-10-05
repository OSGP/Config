#node default { }

node 'dev-box' {

	# PostgreSQL.
	package { 'postgresql':
		ensure => installed,
	}

	exec { 'Create latest postgresql link':
		command => '/bin/ln -sf `ls -td -- /etc/postgresql/*` /etc/postgresql/latest',
		require => Package['postgresql'],
		onlyif => '/usr/bin/test ! -f /etc/postgresql/latest'
	}


	service { 'postgresql':
		ensure => 'running',
		enable => true,
		require => Package['postgresql'],
	}

	exec { 'Increase connections postgres':
		command => '/bin/sed -i \'s/max_connections = .*$/max_connections = 1000 /\' /etc/postgresql/latest/main/postgresql.conf',
		returns => [0, 4],
		require => [Package['postgresql'], Exec['Create latest postgresql link']],
		notify => Service['postgresql'],
	}
}
