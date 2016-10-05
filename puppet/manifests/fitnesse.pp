node 'dev-box' {

	exec { 'Create fitnesse directory':
		command => '/bin/mkdir -p /home/dev/Tools/fitnesse-20160618/',
		before => Exec['Download fitnesse 20160618']
	}

	exec { 'Download fitnesse 20160618':
		command => '/usr/bin/wget -q http://search.maven.org/remotecontent?filepath=org/fitnesse/fitnesse/20160618/fitnesse-20160618.jar -O /home/dev/Tools/fitnesse-20160618/fitnesse.jar'
	}
	
	file { 'Create fitnesse link':
		ensure => link,
		target => '/home/dev/Tools/fitnesse-20160618/',
		path => '/home/dev/Tools/fitnesse',
		require => Exec['Create fitnesse directory']
	}
}
