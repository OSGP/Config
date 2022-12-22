#node default { }

node 'dev-box' {

	$version='5.7.0'

	# Soap-UI
	exec { 'wget soap-ui':
		command => "/usr/bin/wget -q -O /home/dev/Downloads/osgp/SoapUI-${version}-linux-bin.tar.gz http://s3.amazonaws.com/downloads.eviware/soapuios/${version}/SoapUI-${version}-linux-bin.tar.gz",
		onlyif => '/usr/bin/test ! -f /home/dev/Tools/SoapUI',
		timeout => 1800,
		returns => [0, 4],
	}


	exec { 'unpack soap-ui':
		command => "/bin/tar xzf /home/dev/Downloads/osgp/SoapUI-${version}-linux-bin.tar.gz -C /home/dev/Tools",
		onlyif => '/usr/bin/test ! -f /home/dev/Tools/SoapUI',
		require => Exec['wget soap-ui']
	}

	file { 'create soapui link':
		ensure => link,
		path => '/home/dev/Tools/SoapUI',
		target => "/home/dev/Tools/SoapUI-${version}",
		require => Exec['unpack soap-ui']
	}

	exec { 'wget icon':
		command => "/usr/bin/wget -q -O /home/dev/Tools/SoapUI/logo.png https://symbols.getvecta.com/stencil_25/77_soapui.5113237b76.png",
		onlyif => '/usr/bin/test ! -f /home/dev/Tools/SoapUI/logo.png',
		require => File['create soapui link']
	}

}
