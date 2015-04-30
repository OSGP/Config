#node default { }

node 'dev-box' {

	exec { 'creating osp folder':
		command => '/bin/mkdir /var/log/osp',
		before => Exec['chown logs folder','chmod logs folder','creating logs folder'],
	}

	exec { 'creating logs folder':
		command => '/bin/mkdir /var/log/osp/logs',
		before => Exec['chown logs folder','chmod logs folder'],	
	}

	exec { 'chown logs folder':
		command => '/bin/chown dev:dev /var/log/osp/logs',
	}

	exec { 'chmod logs folder':
		command => '/bin/chmod 755 /var/log/osp/logs',
	}

}
