#node default { }

node 'dev-box' {

	exec { 'creating source code folder':
		command => '/bin/mkdir /home/vagrant/Sources',
		before => Exec['chown source code folder'],	
	}

	exec { 'chown source code folder':
		command => '/bin/chown dev:dev /home/vagrant/Sources',
	}

}
