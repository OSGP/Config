node 'dev-box' {

        package { 'ansible':
                ensure => present
        }

	class { 'python':
		pip => present	
	}

	exec { '/usr/bin/pip install --upgrade pip':
		require => Class['python'] 
        }

        exec { 'Install ansible-lint':
		command => '/usr/bin/pip install ansible-lint',
		user => 'dev',
		require => Exec['/usr/bin/pip install --upgrade pip'] 
        }

}

