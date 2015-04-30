#node default { }

node 'dev-box' {

	exec { 'hold libprotobuf7':
		command => '/usr/lib/echo libprotobuf7 hold | sudo /usr/lib/dpkg --set-selections',
	}

	exec { 'hold libprotoc7':
		command => '/usr/lib/echo libprotoc7 hold | sudo /usr/lib/dpkg --set-selections',
	}

	exec { 'hold protobuf-compiler':
		command => '/usr/lib/echo protobuf-compiler hold | sudo /usr/lib/dpkg --set-selections',
	}
}
