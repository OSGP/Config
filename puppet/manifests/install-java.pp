#node default { }

node 'dev-box' {

	# Will install the default JDK. On 16.04 this will install java-8-openjdk. On 14.04 this will install java-7-openjdk
	package { 'default-jdk':
		ensure => installed,
	}

	# If installing a 16.04 system, we need to make sure that openjdk 7 is installed. On that version default java 8 is installed. 
	exec { 'Add repository for openjdk 7':
		command => '/usr/bin/apt-add-repository ppa:openjdk-r/ppa',
		onlyif => '/usr/bin/test ! -d /usr/lib/jvm/java-7-openjdk-amd64'
	}

	exec { 'Update':
		command => '/usr/bin/apt-get update',
		onlyif => '/usr/bin/test ! -d /usr/lib/jvm/java-7-openjdk-amd64',
		require => Exec['Add repository for openjdk 7']
	}

	exec { 'Install openjdk 7':
		command => '/usr/bin/apt-get install -y openjdk-7-jdk',
		onlyif => '/usr/bin/test ! -d /usr/lib/jvm/java-7-openjdk-amd64',
		require => Exec['Update']
	}
}
