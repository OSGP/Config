node 'dev-box' {

        package { 'awscli':
                ensure => installed
        }


	class { 'python':
		pip => present
		
	}

        exec { 'awsudo':
                command => '/usr/bin/pip install --user git+https://github.com/paperg/awsudo.git',
		require => Class['python'] 
        }
}
