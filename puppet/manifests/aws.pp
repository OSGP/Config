node 'dev-box' {

	$homedir="/home/dev"

	package { 'awscli':
		ensure => present
	}

	class { 'python':
		pip => true
	}

	package { 'pip':
		ensure   => latest,
		provider => 'pip',
		require  => Class['python']
	}

	package { 'awsudo':
		ensure => present,
		provider => 'pip',
		require => Package['pip']
	}

	exec { "Add awsudo to path in ${homedir}.profile":
		command => "/bin/sed -i 's/:\$PATH/:\\/home\\/dev\\/.local\\/bin:\$PATH/g' ${homedir}/.profile",
		unless => "/bin/grep PATH= /.profile | /bin/grep .local\\/bin",
		require => Package['awsudo'],
	}
}
