#node default { }

node 'dev-box' {

	# Will install the default JDK. On 20.04 this will install java-11-openjdk.
	#package { 'default-jdk':
	#	ensure => installed,
	#}

	#exec { 'java17':
	#	command => '/usr/bin/apt-get install -y openjdk-17-jdk openjdk-17-jre',
	#	timeout => 1800
	#}

	file_line { 'export sdkman folder':
		ensure => present,
		line => "SDKMAN_DIR=/usr/local/sdkman",
		path => "/etc/environment"
	}

	exec { 'install sdkman':
		command => '/usr/bin/curl -s "https://get.sdkman.io" | bash',
		#require => File_line['export sdkman folder']
	}

	#exec { 'source sdkman init script':
	#	command => '/bin/bash -c "source /usr/local/sdkman/bin/sdkman-init.sh"',
	#	returns => [0],
	#	require => Exec['install sdkman']
	#}

	exec { 'java17':
		command => '/usr/local/sdk version && /usr/local/sdk install java 17.0.5-tem < /dev/null',
		timeout => 1800,
		require => Exec['install sdkman']
	}

	# Enable the SunPKCS11 security provider.
	exec { 'Add NSS library to java.security':
		command => '/bin/sed -i "s/security.provider.12=SunPKCS11/security.provider.12=SunPKCS11 \/usr\/lib\/jvm\/java-17-openjdk-amd64\/conf\/security\/nss.cfg/g" /usr/lib/jvm/java-17-openjdk-amd64/conf/security/java.security',
		onlyif => '/usr/bin/test $(/bin/grep -c security.provider.12 /usr/lib/jvm/java-17-openjdk-amd64/conf/security/java.security) -eq 1',
		require => Exec['java17']
	}

	#exec { 'Fix NSS library dir':
	#	command => '/bin/sed -i "s/@NSS_LIBDIR@/\/usr\/lib64/g" /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/nss.cfg',
	#	onlyif => '/usr/bin/test -f /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/nss.cfg',
	#	require => Exec['Add NSS library to java.security'],
	#}
	file_line { 'NSS library dir':
		path => '/etc/java-17-openjdk/security/nss.cfg',
		line => 'nssLibraryDirectory = /usr/lib/x86_64-linux-gnu'
	}

}
