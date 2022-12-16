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

	#file_line { 'export sdkman folder':
	#	ensure => present,
	#	line => "SDKMAN_DIR=/home/dev/.sdkman",
	#	path => "/etc/environment"
	#}

	exec { 'java17':
		command => '/home/vagrant/repos/OSGP/Config/puppet/manifests/sdkman.sh',
		returns => [0],
		provider => 'shell'
	}

	#exec { 'install sdkman':
	#	command => '/bin/bash -c "/usr/bin/curl -s \"https://get.sdkman.io\" | bash"',
	#	returns => [0],
	#	provider => 'shell',
	#	#require => File_line['export sdkman folder']
	#}

	#exec { 'move sdkman':
	#	command => '/bin/bash -c "/usr/bin/mv /.sdkman /home/dev/.sdkman"',
	#	returns => [0],
	#	provider => 'shell',
	#	require => Exec['install sdkman']
	#}

	#exec { 'source sdkman init script':
	#	command => '/bin/bash -c "/usr/bin/sudo /usr/bin/su dev && source /home/dev/.sdkman/bin/sdkman-init.sh && sdk version && sdk install java 17.0.5-tem < /dev/null"',
	#	returns => [0],
	#	user => 'dev',
	#	provider => 'shell',
	#	require => Exec['move sdkman']
	#}

	#exec { 'java17':
	#	command => '/bin/bash -c "/usr/bin/sudo /usr/bin/su dev && sdk version && sdk install java 17.0.5-tem < /dev/null"',
	#	returns => [0],
	#	timeout => 1800,
	#	user => 'dev',
	#	provider => 'shell',
	#	require => Exec['source sdkman init script']
	#}

	# Enable the SunPKCS11 security provider.
	exec { 'Add NSS library to java.security':
		command => '/bin/sed -i "s/security.provider.12=SunPKCS11/security.provider.12=SunPKCS11 \/home\/dev\/\/.sdkman\/candidates\/java\/current\/lib\/security\/nss.cfg/g" /home/dev//.sdkman/candidates/java/current/conf/security/java.security',
		onlyif => '/usr/bin/test $(/bin/grep -c security.provider.12 /home/dev//.sdkman/candidates/java/current/conf/security/java.security) -eq 1',
		require => Exec['java17']
	}

	#exec { 'Fix NSS library dir':
	#	command => '/bin/sed -i "s/@NSS_LIBDIR@/\/usr\/lib64/g" /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/nss.cfg',
	#	onlyif => '/usr/bin/test -f /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/nss.cfg',
	#	require => Exec['Add NSS library to java.security'],
	#}

	file_line { 'NSS library dir':
		path => '/home/dev//.sdkman/candidates/java/current/lib/security/nss.cfg',
		line => 'nssLibraryDirectory = /usr/lib/x86_64-linux-gnu',
		onlyif => '/usr/bin/test -f /home/dev//.sdkman/candidates/java/current/lib/security/nss.cfg',
		require => Exec['Add NSS library to java.security']
	}

}
