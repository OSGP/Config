#node default { }

node 'dev-box' {

	# Everybody needs vim.
	package { 'vim':
		ensure => installed,
	}
	
	# The same goes for htop.
	package { 'htop':
		ensure => installed,
	}

	# Tomcat7 is used as application server.
	exec { 'wget tomcat7':
		command => '/usr/bin/wget -q -P /home/dev/Downloads - https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.62/bin/apache-tomcat-7.0.62.tar.gz',
		before => Exec['wget postgresql jdbc','unpack tomcat7','change permissions of tomcat7 conf files'],	
		returns => [0, 4],
	}

	exec { 'unpack tomcat7':
		command => '/bin/tar xzf /home/dev/Downloads/apache-tomcat-7.0.62.tar.gz -C /home/dev/Tools',
		before => Exec['wget postgresql jdbc','change permissions of tomcat7 conf files'],
	}

	exec { 'change permissions of tomcat7 conf files':
		command => '/bin/chmod 644 /home/dev/Tools/apache-tomcat-7.0.62/conf/*',
	}

	# A JDBC is needed by Tomcat7 to connect to PostgreSQL.
	exec { 'wget postgresql jdbc':
		command => '/usr/bin/wget -q -P /home/dev/Tools/apache-tomcat-7.0.62/lib - https://jdbc.postgresql.org/download/postgresql-9.4.1208.jre7.jar',
		returns => [0, 4],
	}

	# PostgreSQL.
	package { 'postgresql-9.3':
		ensure => installed,
	}

	# GUI tool for PostgreSQL.
	package { 'pgadmin3':
		ensure => installed,
	}

	# ActiveMQ is used as message broker.
	exec { 'wget activemq':
		command => '/usr/bin/wget -q -P /home/dev/Downloads - https://archive.apache.org/dist/activemq/5.11.1/apache-activemq-5.11.1-bin.tar.gz',
		before => Exec['unpack activemq'],	
		returns => [0, 4],
	}

	exec { 'unpack activemq':
		command => '/bin/tar xzf /home/dev/Downloads/apache-activemq-5.11.1-bin.tar.gz -C /home/dev/Tools',
	}

	# Git.
	package { 'git':
		ensure => installed,
	}

	# Eclipse EE for Webdevelopers, Luna.
	exec { 'wget eclipse':
		command => '/usr/bin/wget -q -O /home/dev/Downloads/eclipse-jee-luna-SR2-linux-gtk-x86_64.tar.gz http://ftp.acc.umu.se/mirror/eclipse.org/technology/epp/downloads/release/luna/SR2/eclipse-jee-luna-SR2-linux-gtk-x86_64.tar.gz',
		before => Exec['unpack eclipse'],
		timeout => 1800,		
		returns => [0, 4],
	}

	exec { 'unpack eclipse':
		command => '/bin/tar xzf /home/dev/Downloads/eclipse-jee-luna-SR2-linux-gtk-x86_64.tar.gz -C /home/dev/Tools',
	}

	# Soap-UI
	exec { 'wget soap-ui':
		command => '/usr/bin/wget -q -O /home/dev/Downloads/SoapUI-5.2.1-linux-bin.tar.gz http://cdn01.downloads.smartbear.com/soapui/5.2.1/SoapUI-5.2.1-linux-bin.tar.gz',
		before => Exec['unpack soap-ui'],
		timeout => 1800,		
		returns => [0, 4],
	}

	exec { 'unpack soap-ui':
		command => '/bin/tar xzf /home/dev/Downloads/SoapUI-5.2.1-linux-bin.tar.gz -C /home/dev/Tools',
	}

	# Maven is used as dependency management and build tool.
	package { 'maven':
		ensure => installed,
	}

	# Google Protocol Buffers is used to compile OSLP.
	exec { 'wget protobuf-compiler':
		command => '/usr/bin/wget -q -P /home/dev/Downloads - http://launchpadlibrarian.net/153399587/protobuf-compiler_2.4.1-3ubuntu2_amd64.deb',
		before => Exec['dpkg -i protobuf-compiler'],
		returns => [0, 4],
	}

	exec { 'wget libprotoc7':
		command => '/usr/bin/wget -q -P /home/dev/Downloads - http://launchpadlibrarian.net/153399584/libprotoc7_2.4.1-3ubuntu2_amd64.deb',
		before => Exec['dpkg -i libprotoc7'],
		returns => [0, 4],
	}

	exec { 'wget libprotobuf7':
		command => '/usr/bin/wget -q -P /home/dev/Downloads - http://launchpadlibrarian.net/153399581/libprotobuf7_2.4.1-3ubuntu2_amd64.deb',
		before => Exec['dpkg -i protobuf-compiler'],
		returns => [0, 4],
	}

	exec { 'dpkg -i libprotobuf7':
		command => '/usr/bin/dpkg -i /home/dev/Downloads/libprotobuf7_2.4.1-3ubuntu2_amd64.deb',
		require => Exec['wget libprotobuf7'],
	}

	exec { 'dpkg -i libprotoc7':
		command => '/usr/bin/dpkg -i /home/dev/Downloads/libprotoc7_2.4.1-3ubuntu2_amd64.deb',
		require => Exec['wget libprotoc7','dpkg -i libprotobuf7'],
	}

	exec { 'dpkg -i protobuf-compiler':
		command => '/usr/bin/dpkg -i /home/dev/Downloads/protobuf-compiler_2.4.1-3ubuntu2_amd64.deb',
		require => Exec['wget protobuf-compiler','dpkg -i libprotobuf7','dpkg -i libprotoc7'],
	}

	# Apache HTTPD is used as webserver with SSL and AJP.
	package { 'apache2':
		ensure => installed,
		before => Exec['enable mod_ssl','enable proxy_ajp'],
	}

	exec { 'enable mod_ssl':
		command => '/usr/sbin/a2enmod ssl',
	}

	exec { 'enable proxy_ajp':
		command => '/usr/sbin/a2enmod proxy proxy_ajp',
	}

}
