#node default { }

node 'dev-box' {

	$mavenVersion="3.8.6"

	# Everybody needs vim.
	package { 'vim':
		ensure => installed,
	}

	# The same goes for htop.
	package { 'htop':
		ensure => installed,
	}

	# GUI tool for PostgreSQL.
	package { 'pgadmin3':
		ensure => installed,
	}

	# Maven is used as dependency management and build tool.
	#package { 'maven':
	#	ensure => installed,
	#}
	exec { 'maven':
		command => "/usr/bin/wget -q -P /home/dev/Tools https://dlcdn.apache.org/maven/maven-3/${mavenVersion}/binaries/apache-maven-${mavenVersion}-bin.tar.gz && /bin/mkdir -p /home/dev/Tools/apache-maven-${mavenVersion} && /bin/tar xzf /home/dev/Tools/apache-maven-${mavenVersion}-bin.tar.gz -C /home/dev/Tools/apache-maven-${mavenVersion} && /bin/ln -s /home/dev/Tools/apache-maven-${mavenVersion}/bin/mvn /usr/bin/mvn",
		returns => [0, 4],
	}

	# Google Protocol Buffers is used to compile OSLP.
	exec { 'wget protobuf-compiler':
		command => '/usr/bin/wget -q -P /home/dev/Downloads/osgp - http://launchpadlibrarian.net/153399587/protobuf-compiler_2.4.1-3ubuntu2_amd64.deb',
		before => Exec['dpkg -i protobuf-compiler'],
		returns => [0, 4],
	}

	exec { 'wget libprotoc7':
		command => '/usr/bin/wget -q -P /home/dev/Downloads/osgp - http://launchpadlibrarian.net/153399584/libprotoc7_2.4.1-3ubuntu2_amd64.deb',
		before => Exec['dpkg -i libprotoc7'],
		returns => [0, 4],
	}

	exec { 'wget libprotobuf7':
		command => '/usr/bin/wget -q -P /home/dev/Downloads/osgp - http://launchpadlibrarian.net/153399581/libprotobuf7_2.4.1-3ubuntu2_amd64.deb',
		before => Exec['dpkg -i protobuf-compiler'],
		returns => [0, 4],
	}

	exec { 'dpkg -i libprotobuf7':
		command => '/usr/bin/dpkg -i /home/dev/Downloads/osgp/libprotobuf7_2.4.1-3ubuntu2_amd64.deb',
		require => Exec['wget libprotobuf7'],
	}

	exec { 'dpkg -i libprotoc7':
		command => '/usr/bin/dpkg -i /home/dev/Downloads/osgp/libprotoc7_2.4.1-3ubuntu2_amd64.deb',
		require => Exec['wget libprotoc7','dpkg -i libprotobuf7'],
	}

	exec { 'dpkg -i protobuf-compiler':
		command => '/usr/bin/dpkg -i /home/dev/Downloads/osgp/protobuf-compiler_2.4.1-3ubuntu2_amd64.deb',
		require => Exec['wget protobuf-compiler','dpkg -i libprotobuf7','dpkg -i libprotoc7'],
	}

}
