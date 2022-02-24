#node default { }

node 'dev-box' {

	# Will install the default JDK. On 20.04 this will install java-11-openjdk.
	package { 'default-jdk':
		ensure => installed,
	}

	# Enable the SunPKCS11 security provider.
	exec { 'Add NSS library to java.security':
		command => '/bin/sed -i "s/security.provider.12=SunPKCS11/security.provider.12=SunPKCS11 \/usr\/lib\/jvm\/java-11-openjdk-amd64\/conf\/security\/nss.cfg/g" /usr/lib/jvm/java-11-openjdk-amd64/conf/security/java.security',
		onlyif => '/usr/bin/test $(/bin/grep -c security.provider.12 /usr/lib/jvm/java-11-openjdk-amd64/conf/security/java.security) -eq 1',
		require => Package['default-jdk']
	}

	#exec { 'Fix NSS library dir':
	#	command => '/bin/sed -i "s/@NSS_LIBDIR@/\/usr\/lib64/g" /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/nss.cfg',
	#	onlyif => '/usr/bin/test -f /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/nss.cfg',
	#	require => Exec['Add NSS library to java.security'],
	#}
        file_line { 'NSS library dir':
               path => '/etc/java-11-openjdk/security/nss.cfg',
               line => 'nssLibraryDirectory = /usr/lib/x86_64-linux-gnu'
        }

}
