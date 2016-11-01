#node default { }

node 'dev-box' {

	exec { 'chown /home/dev/Sources':
		command => '/bin/chown -R dev:dev /home/dev/Sources/*',
	}

}