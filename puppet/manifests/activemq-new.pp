node 'dev-box' {
	group { 'Group activemq': 
		name => 'activemq',
		ensure => 'present'
	}

	user { 'User activemq':
		ensure => 'present',
		name => 'activemq',
		groups => 'activemq',
		home => '/home/activemq',
		managehome => true,
		shell => '/bin/bash',
		require => Group['Group activemq']
	}

	exec { 'Download activemq 5.11.1':
		command => '/usr/bin/wget -q http://archive.apache.org/dist/activemq/5.11.1/apache-activemq-5.11.1-bin.tar.gz -O /home/dev/Downloads/apache-activemq-5.11.1-bin.tar.gz',
		creates => '/home/dev/Downloads/apache-activemq-5.11.1-bin.tar.gz',
	}

	exec { 'Unpack activemq 5.11.1':
		command => '/bin/tar -xzvf /home/dev/Downloads/apache-activemq-5.11.1-bin.tar.gz -C /home/dev/Downloads/',
		creates => '/home/dev/Downloads/apache-activemq-5.11.1',
		require => Exec['Download activemq 5.11.1']
	}

	file { 'Move activemq':
		ensure => 'directory',
		path => '/opt/apache-activemq-5.11.1',
		source => '/home/dev/Downloads/apache-activemq-5.11.1',
		recurse => true,
		require => Exec['Unpack activemq 5.11.1']
	}

	file { 'Create activemq start link':
		ensure => 'link',
		path => '/etc/init.d/activemq',
		target => '/opt/apache-activemq-5.11.1/bin/linux-x86-64/activemq',
		mode => 755,
		require => File['Move activemq']
	}

	exec { 'Set user for activemq':
		command => "/bin/sed -i 's/^#RUN_AS_USER=$/RUN_AS_USER=activemq/g' /opt/apache-activemq-5.11.1/bin/linux-x86-64/activemq",
		require => File['Move activemq']
	}

        exec { 'Configure activemq':
		command => "/bin/sed -i 's|<broker xmlns=\"http://activemq.apache.org/schema/core\" brokerName=\"localhost\" dataDirectory=\"\${activemq.data}\">|<broker xmlns=\"http://activemq.apache.org/schema/core\" brokerName=\"localhost\" dataDirectory=\"\${activemq.data}\" schedulerSupport=\"true\">|g' /opt/apache-activemq-5.11.1/conf/activemq.xml",
		require => File['Move activemq']
        }

	exec { 'Enable auto start for activemq':
		command => "/usr/sbin/update-rc.d -f activemq defaults",
		require => [Exec['Set user for activemq'], File['Create activemq start link'] ]
	}
}
