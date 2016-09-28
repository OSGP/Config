#node default { }

node 'dev-box' {

	# Soap-UI
	exec { 'wget soap-ui':
		command => '/usr/bin/wget -q -O /home/dev/Downloads/osgp/SoapUI-5.2.1-linux-bin.tar.gz http://cdn01.downloads.smartbear.com/soapui/5.2.1/SoapUI-5.2.1-linux-bin.tar.gz',
		before => Exec['unpack soap-ui'],
		timeout => 1800,		
		returns => [0, 4],
	}

	exec { 'unpack soap-ui':
		command => '/bin/tar xzf /home/dev/Downloads/osgp/SoapUI-5.2.1-linux-bin.tar.gz -C /home/dev/Tools',
	}

}
