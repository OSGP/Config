node 'dev-box' {

        $version = "5.15.0"

	# ActiveMQ is used as message broker.
	exec { 'wget activemq':
		command => "/usr/bin/wget -q -P /home/dev/Downloads/osgp - http://archive.apache.org/dist/activemq/${version}/apache-activemq-${version}-bin.tar.gz",
		onlyif => '/usr/bin/test ! -f /home/dev/Tools/activemq',
		before => Exec['unpack activemq'],
		returns => [0, 4],
	}

	exec { 'unpack activemq':
		command => "/bin/tar xzf /home/dev/Downloads/osgp/apache-activemq-${version}-bin.tar.gz -C /home/dev/Tools",
		creates => "/home/dev/Tools/apache-activemq-${version}",
		onlyif => '/usr/bin/test ! -f /home/dev/Tools/activemq',
		require => Exec['wget activemq']
	}

	file { 'create activemq link':
		ensure => link,
		path => '/home/dev/Tools/activemq',
		target => "/home/dev/Tools/apache-activemq-${version}",
		require => Exec['unpack activemq']
	}

	exec { 'Configure broker definition':
		command => "/bin/sed -i 's|<broker xmlns=\"http://activemq.apache.org/schema/core\" brokerName=\"localhost\" dataDirectory=\"\${activemq.data}\">|<broker xmlns=\"http://activemq.apache.org/schema/core\" brokerName=\"localhost\" dataDirectory=\"\${activemq.data}\" schedulerSupport=\"true\">|g' /home/dev/Tools/activemq/conf/activemq.xml",
		require => File['create activemq link']
	}

	exec { 'Configure openwire transport connector':
		command => "/bin/sed -s 's|tcp://0.0.0.0:61616?maximumConnections=1000\&amp;wireFormat.maxFrameSize=104857600|tcp://0.0.0.0:61616?maximumConnections=1000\&amp;wireFormat.maxFrameSize=104857600\&amp;wireFormat.maxInactivityDuration=0\&amp;transport.useInactivityMonitor=false\&amp;transport.useKeepAlive=true|g' /home/dev/Tools/activemq/conf/activemq.xml",
		require => File['Configure broker definition']
	}
}
