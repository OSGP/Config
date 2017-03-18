node 'dev-box' {

	class { 'python':
		pip => present
		
	}

	python::pip { 'awsudo':
		pkgname => 'awsudo',
		ensure => installed,
		url => 'https://github.com/paperg/awsudo'
	}
}
