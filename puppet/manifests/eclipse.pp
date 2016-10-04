#node default { }

node 'dev-box' {

	# Eclipse EE for Webdevelopers, Luna.
	exec { 'wget eclipse':
		command => '/usr/bin/wget -q -O /home/dev/Downloads/osgp/eclipse-jee-mars-2-linux-gtk-x86_64.tar.gz http://ftp.acc.umu.se/mirror/eclipse.org/technology/epp/downloads/release/mars/2/eclipse-jee-mars-2-linux-gtk-x86_64.tar.gz',
		onlyif => '/usr/bin/test ! -d /home/dev/Tools/eclipse',
		timeout => 1800,		
		returns => [0, 4],
	}

	exec { 'unpack eclipse':
		command => '/bin/tar xzf /home/dev/Downloads/osgp/eclipse-jee-mars-2-linux-gtk-x86_64.tar.gz -C /home/dev/Tools',
		onlyif => '/usr/bin/test ! -d /home/dev/Tools/eclipse',
		require => Exec['wget eclipse'], 
	}

	exec { 'install cucumber-eclipse plugin':
		command => '/home/dev/Tools/eclipse/eclipse -application org.eclipse.equinox.p2.director -nosplash -repository http://cucumber.github.io/cucumber-eclipse/update-site -installIUs cucumber.eclipse.feature.feature.group',
		require => Exec['unpack eclipse']
	}

	exec { 'update m2eclipse-mavenarchiver':
		command => '/home/dev/Tools/eclipse/eclipse -application org.eclipse.equinox.p2.director -nosplash -repository https://otto.takari.io/content/sites/m2e.extras/m2eclipse-mavenarchiver/0.17.2/N/LATEST/ -installIUs org.sonatype.m2e.mavenarchiver.feature.feature.group',
		require => Exec['unpack eclipse']
	}

	exec { 'install checkstyle plugin':
		command => '/home/dev/Tools/eclipse/eclipse -application org.eclipse.equinox.p2.director -nosplash -repository http://eclipse-cs.sourceforge.net/update -installIUs net.sf.eclipsecs.feature.group',
		require => Exec['unpack eclipse']
	}

	exec { 'install findbugs plugin':
		command => '/home/dev/Tools/eclipse/eclipse -application org.eclipse.equinox.p2.director -nosplash -repository http://findbugs.cs.umd.edu/eclipse -installIUs edu.umd.cs.findbugs.plugin.eclipse.feature.group',
		require => Exec['unpack eclipse']
	}

	exec { 'install sonarlint plugin':
		command => '/home/dev/Tools/eclipse/eclipse -application org.eclipse.equinox.p2.director -nosplash -repository http://www.sonarlint.org/eclipse -installIUs org.sonarlint.eclipse.feature.feature.group',
		require => Exec['unpack eclipse']
	}

	file { 'Update eclipse.ini':
		path => '/home/dev/Tools/eclipse/eclipse.ini',
		content => template('/home/dev/Sources/OSGP/Config/puppet/manifests/eclipse.ini.tpl'),
		require => Exec['unpack eclipse']
	}

}

