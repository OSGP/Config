node 'dev-box' {
	# ActiveMQ is used as message broker.
	exec { 'wget activemq':
		command => '/usr/bin/wget -q -P /home/dev/Downloads/osgp - http://archive.apache.org/dist/activemq/5.14.0/apache-activemq-5.14.0-bin.tar.gz',
		before => Exec['unpack activemq'],
		returns => [0, 4],
	}

	exec { 'unpack activemq':
		command => '/bin/tar xzf /home/dev/Downloads/osgp/apache-activemq-5.14.0-bin.tar.gz -C /home/dev/Tools',
		creates => '/home/dev/Tools/apache-activemq-5.14.0',
		require => Exec['wget activemq']
	}

        exec { 'Configure activemq':
		command => "/bin/sed -i 's|<broker xmlns=\"http://activemq.apache.org/schema/core\" brokerName=\"localhost\" dataDirectory=\"\${activemq.data}\">|<broker xmlns=\"http://activemq.apache.org/schema/core\" brokerName=\"localhost\" dataDirectory=\"\${activemq.data}\" schedulerSupport=\"true\">|g' /home/dev/Tools/apache-activemq-5.14.0/conf/activemq.xml",
		require => Exec['unpack activemq']
        }
}
