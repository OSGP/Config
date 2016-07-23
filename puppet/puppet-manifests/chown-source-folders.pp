#node default { }

node 'dev-box' {

	exec { 'chown /home/vagrant/Sources':
		command => '/bin/chown -R dev.dev /home/vagrant/Sources/*',
	}

}