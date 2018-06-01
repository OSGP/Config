node 'dev-box' {

	$homedir="/home/dev"

        package { 'awscli':
                ensure => present
        }

	class { 'python':
		pip => present	
	}

	exec { '/usr/local/bin/pip install --upgrade pip':
		require => Class['python'] 
        }

        exec { 'Install awsudo':
		command => '/usr/local/bin/pip install --user git+https://github.com/paperg/awsudo.git',
		user => 'dev',
		require => Exec['/usr/local/bin/pip install --upgrade pip'] 
        }

        exec { "Add awsudo to path in ${homedir}.profile":
                command => "/bin/sed -i 's/:\$PATH/:\\/home\\/dev\\/.local\\/bin:\$PATH/g' ${homedir}/.profile",
		unless => "/bin/grep PATH= /.profile | /bin/grep .local\\/bin", 
		require => Exec['Install awsudo'], 
        }
}

