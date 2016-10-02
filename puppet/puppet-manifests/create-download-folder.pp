#node default { }

node 'dev-box' {

	exec { 'creating osgp download folder':
		command => '/bin/mkdir -p /home/dev/Downloads/osgp',
		before => Exec['chown osgp download folder'],
	}

	exec { 'chown osgp download folder':
		command => '/bin/chown dev:dev /home/dev/Downloads/osgp',
	}

}
