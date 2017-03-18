node 'dev-box' {

	python::pip { 'awsudo':
		pkgname => 'awsudo',
		ensure => installed,
		url => 'https://github.com/paperg/awsudo'
	}
}
