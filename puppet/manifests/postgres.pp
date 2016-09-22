#node default { }

node 'dev-box' {

	# PostgreSQL.
	package { 'postgresql-9.3':
		ensure => installed,
	}

	service { 'postgresql':
		ensure => 'running',
		enable => true,
		require => Package['postgresql-9.3'],
	}

	exec { 'Increase connections postgres':
		command => '/bin/sed -i \'s/max_connections = 100 /max_connections = 1000 /\' /etc/postgresql/9.3/main/postgresql.conf',
		returns => [0, 4],
		require => Package['postgresql-9.3'],
		notify => Service['postgresql'],
	}
}
