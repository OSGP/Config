#node default { }

node 'dev-box' {

	# Creates the uses and databases.
	exec { 'create users and databases':
		command => '/bin/sh -c "sudo -u postgres /usr/bin/psql -p 5432 -f /home/dev/Sources/Config/sql/create-users-and-databases.sql"',
		before => Exec['backup pg_hba.conf','change pg_hba.conf','reload config','create logback tables'],
	}
	
	# Creates a backup of the pg_hba.conf file.
	exec { 'backup pg_hba.conf':
		command => '/bin/cp -p /etc/postgresql/9.3/main/pg_hba.conf /etc/postgresql/9.3/main/pg_hba.backup',
		before => Exec['reload config','create logback tables'],
	}

	# Makes sure 'psql' can be used like this example: psql -U osp_admin -d osgp_core  (then enter the password 1234 when prompted).
	exec { 'change pg_hba.conf':
		command => '/bin/sh -c "sed -i \'86i\local      all     osp_admin               md5\' /etc/postgresql/9.3/main/pg_hba.conf"',
		before => Exec['reload config','create logback tables'],
	}

	# Apply the change to pg_hba.conf by reloading the configuration for PostgreSQL.
	exec { 'reload config':
		command => '/usr/bin/service postgresql reload',
		before => Exec['create logback tables'],
	}
	
	# Creates the logback tables.
	exec { 'create logback tables':
		command => '/bin/sh -c "export PGPASSWORD=1234; /usr/bin/psql -p 5432 -d osp_logging -U osp_admin -f /home/dev/Sources/Config/sql/create-logback-tables.sql"',
	}

}
