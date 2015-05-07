#node default { }

node 'dev-box' {

	exec { 'create users and databases':
		command => '/bin/sh -c "sudo -u postgres /usr/bin/psql -p 5432 -f /home/dev/Sources/Config/sql/create-users-and-databases.sql"',
		before => Exec['create logback tables','reload config'],
	}

	exec { 'change pg_hba.conf':
		command => '/bin/sh -c "echo \"local	all	osp_admin		md5\" >> /etc/postgresql/9.3/main/pg_hba.conf"',
		before => Exec['create logback tables','reload config'],
	}

	exec { 'reload config':
		command => '/usr/bin/service postgresql reload',
		before => Exec['create logback tables'],
	}

	# DOESN'T WORK
	#exec { 'create logback tables':
	#	command => '/bin/sh -c "/usr/bin/psql -p 5432 -d osp_logging -U osp_admin -f /home/dev/Sources/Config/sql/create-logback-tables.sql"',
	#}

}
