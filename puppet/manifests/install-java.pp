#node default { }

node 'dev-box' {

	# Will install the default JDK. On 16.04 this will install java-8-openjdk. On 14.04 this will install java-7-openjdk
	package { 'openjdk-8-jdk':
		ensure => '8u111-b14-2ubuntu0.16.04.2',
	}

        exec { 'Fix NSS library dir':
                command => '/bin/sed -i "s/@NSS_LIBDIR@/\/usr\/lib64/g" /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/nss.cfg',
                onlyif => '/usr/bin/test -f /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/nss.cfg',
        }
	
        exec { 'Add NSS library to java.security':
                command => '/bin/sed -i "/SunPCSC/a security.provider.10=sun.security.pkcs11.SunPKCS11 \$\{java.home\}\/lib\/security\/nss.cfg" /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/java.security',
                onlyif => '/usr/bin/test $(/bin/grep -c security.provider.10 /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/java.security) -eq 0',
        }
}
