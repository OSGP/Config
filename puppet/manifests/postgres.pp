#node default { }

node 'dev-box' {

	# PostgreSQL.
	package { 'postgresql':
		ensure => installed,
	}

	service { 'postgresql':
		ensure => 'running',
		enable => true,
		require => Package['postgresql'],
	}

	exec { 'Increase connections postgres':
		command => '/bin/sed -i \'s/max_connections = .*$/max_connections = 1000 /\' /etc/postgresql/9.*/main/postgresql.conf',
		returns => [0, 4],
		require => Package['postgresql'],
		notify => Service['postgresql'],
	}
}
