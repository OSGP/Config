#node default { }

node 'dev-box' {

	$homedir = "/home/dev"
	$version = "7.0.79"

	# Tomcat7 is used as application server.
	exec { 'wget tomcat7':
		command => "/usr/bin/wget -q -P ${homedir}/Downloads/osgp - http://archive.apache.org/dist/tomcat/tomcat-7/v${version}/bin/apache-tomcat-${version}.tar.gz",
		creates => "${homedir}/Downloads/osgp/apache-tomcat-${version}.tar.gz",
		before => Exec['wget postgresql jdbc','unpack tomcat7'],	
		returns => [0, 4]
	}

	exec { 'unpack tomcat7':
		command => "/bin/tar xzf ${homedir}/Downloads/osgp/apache-tomcat-${version}.tar.gz -C ${homedir}/Tools",
		before => Exec['wget postgresql jdbc']
	}

	file { 'create tomcat link':
		path => "${homedir}/Tools/tomcat",
		ensure => link,
		target => "${homedir}/Tools/apache-tomcat-${version}",
		require => Exec['unpack tomcat7']
	}

	file { 'create tomcat7 link':
		path => "${homedir}/Tools/tomcat7",
		ensure => link,
		target => "${homedir}/Tools/apache-tomcat-${version}",
		require => Exec['unpack tomcat7']
	}

	# A JDBC is needed by Tomcat7 to connect to PostgreSQL.
	exec { 'wget postgresql jdbc':
		command => "/usr/bin/wget -q -P ${homedir}/Tools/apache-tomcat-${version}/lib - https://jdbc.postgresql.org/download/postgresql-9.4.1208.jre7.jar",
		returns => [0, 4],
	}

	exec { 'Add copyXML="true" to server.xml':
		command => "/bin/sed -i 's|autoDeploy=\"true\">|autoDeploy=\"true\" copyXML=\"true\">|g' ${homedir}/Tools/tomcat/conf/server.xml",
		require => File['create tomcat link']
	}
}
