#node default { }

node 'dev-box' {

	exec { 'chown /home/vagrant/Sources':
		command => '/bin/chown -R vagrant.vagrant /home/vagrant/Sources/*',
	}

}