#node default { }

node 'dev-box' {

	$version = "8.5.8"

	# Tomcat7 is used as application server.
	exec { 'wget tomcat 8.5':
		command => "/usr/bin/wget -q -P /home/dev/Downloads/osgp - http://apache.mirrors.spacedump.net/tomcat/tomcat-8/v$version/bin/apache-tomcat-$version.tar.gz",
		before => Exec['wget postgresql jdbc','unpack tomcat','change permissions of tomcat conf files'],	
		returns => [0, 4],
	}

	exec { 'unpack tomcat':
		command => "/bin/tar xzf /home/dev/Downloads/osgp/apache-tomcat-$version.tar.gz -C /home/dev/Tools",
		before => Exec['wget postgresql jdbc','change permissions of tomcat conf files'],
	}

	exec { 'change permissions of tomcat conf files':
		command => "/bin/chmod 644 /home/dev/Tools/apache-tomcat-$version/conf/*",
	}

	file { 'create tomcat link in tools':
		path => '/home/dev/Tools/tomcat',
		ensure => link,
		target => "/home/dev/Tools/apache-tomcat-$version"
	}

	# A JDBC is needed by Tomcat to connect to PostgreSQL.
	exec { 'wget postgresql jdbc':
		command => '/usr/bin/wget -q -P /home/dev/Tools/tomcat/lib - https://jdbc.postgresql.org/download/postgresql-9.4.1208.jre7.jar',
		returns => [0, 4],
		require => File['create tomcat link in tools']
	}
}
