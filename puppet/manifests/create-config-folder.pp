#node default { }

node 'dev-box' {

	exec { 'creating config folder':
		command => '/bin/mkdir -p /etc/osp',
	}

}
