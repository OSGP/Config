node 'dev-box' {
	
	exec { 'wget lombok':
		command => "/usr/bin/wget -q -O /home/dev/Downloads/osgp/lombok.jar https://projectlombok.org/downloads/lombok.jar",
		creates => "/home/dev/Downloads/osgp/lombok.jar",
		timeout => 1800,
		returns => [0, 4],
	}

	exec { 'cp lombok':
		command => "/bin/cp /home/dev/Downloads/osgp/lombok.jar /home/dev/Tools/eclipse/",
		onlyif => "/usr/bin/test -L /home/dev/Tools/eclipse",
		require => Exec["wget lombok"],
	}

	
}
