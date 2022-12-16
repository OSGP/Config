#node default { }

node 'dev-box' {

	# Get sdkman and install java 17.
	exec { 'java17':
		command => '/home/vagrant/repos/OSGP/Config/puppet/manifests/sdkman.sh',
		returns => [0],
		provider => 'shell'
	}

	# Enable the SunPKCS11 security provider.
	exec { 'Add NSS library to java.security':
		command => '/bin/sed -i "s/security.provider.12=SunPKCS11/security.provider.12=SunPKCS11 \/home\/dev\/\/.sdkman\/candidates\/java\/current\/lib\/security\/nss.cfg/g" /home/dev//.sdkman/candidates/java/current/conf/security/java.security',
		onlyif => '/usr/bin/test $(/bin/grep -c security.provider.12 /home/dev//.sdkman/candidates/java/current/conf/security/java.security) -eq 1',
		require => Exec['java17']
	}

	exec { 'Fix NSS library dir':
		command => '/bin/sed -i "nssLibraryDirectory = /usr/lib/x86_64-linux-gnu" /home/dev//.sdkman/candidates/java/current/lib/security/nss.cfg',
		onlyif => '/usr/bin/test -f /home/dev//.sdkman/candidates/java/current/lib/security/nss.cfg',
		require => Exec['Add NSS library to java.security'],
	}

}
