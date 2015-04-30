#node default { }

node 'dev-box' {
	# Will install openjdk-7
	package { 'default-jdk':
		ensure => installed,
	}
}
