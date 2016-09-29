#node default { }

node 'dev-box' {

	# Soap-UI
	exec { 'wget soap-ui':
		command => '/usr/bin/wget -q -O /home/dev/Downloads/osgp/SoapUI-5.2.1-linux-bin.tar.gz http://cdn01.downloads.smartbear.com/soapui/5.2.1/SoapUI-5.2.1-linux-bin.tar.gz',
		onlyif => '/usr/bin/test ! -f /home/dev/Tools/SoapUI',
		timeout => 1800,		
		returns => [0, 4],
	}

	exec { 'unpack soap-ui':
		command => '/bin/tar xzf /home/dev/Downloads/osgp/SoapUI-5.2.1-linux-bin.tar.gz -C /home/dev/Tools',
		onlyif => '/usr/bin/test ! -f /home/dev/Tools/SoapUI',
		require => Exec['wget soap-ui']
	}

	file { 'create soapui link':
		ensure => link,
		path => '/home/dev/Tools/SoapUI',
		target => '/home/dev/Tools/SoapUI-5.2.1',
		require => Exec['unpack soap-ui']
	}

}
