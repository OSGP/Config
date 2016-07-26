#node default { }

node 'dev-box' {

	exec { 'set JAVA_HOME environment variable':
		command => '/bin/sh -c "echo \"export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-amd64\" >> /home/dev/.bashrc"',
		returns => [0],
		before => Exec['source .bashrc'],
	}

	exec { 'source .bashrc':
		command => '/bin/bash -c "source /home/dev/.bashrc"',
		returns => [0],
	}

}
