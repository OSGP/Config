#node default { }

node 'dev-box' {

        $major="neon";
        $version="2";

	# Eclipse EE for Webdevelopers, Luna.
	exec { 'wget eclipse':
		command => "/usr/bin/wget -q -O /home/dev/Downloads/osgp/eclipse-${major}-${version}.tar.gz http://ftp.acc.umu.se/mirror/eclipse.org/technology/epp/downloads/release/${major}/${version}/eclipse-jee-${major}-${version}-linux-gtk-x86_64.tar.gz",
		creates => "/home/dev/Downloads/osgp/eclipse-${major}-${version}.tar.gz",
		timeout => 1800,		
		returns => [0, 4],
	}

	exec { 'unpack eclipse':
		command => "/bin/mkdir -p /home/dev/Tools/eclipse-${major}-${version} && /bin/tar xzf /home/dev/Downloads/osgp/eclipse-${major}-${version}.tar.gz -C /home/dev/Tools/eclipse-${major}-${version}",
		onlyif => "/usr/bin/test ! -d /home/dev/Tools/eclipse-${major}-${version}",
		require => Exec['wget eclipse'], 
	}

        exec { 'move inner eclipse dir':
		command => "/bin/mv /home/dev/Tools/eclipse-${major}-${version}/eclipse /home/dev/Tools/eclipse-${major}-${version}/eclipse_old && /bin/mv /home/dev/Tools/eclipse-${major}-${version}/eclipse_old/* /home/dev/Tools/eclipse-${major}-${version}/ && /bin/rm -rf /home/dev/Tools/eclipse-${major}-${version}/eclipse_old",
		onlyif => "/usr/bin/test -d /home/dev/Tools/eclipse-${major}-${version}/eclipse",
		require => Exec['unpack eclipse']
	}

	file { 'create eclipse link':
		ensure => link,
		path => '/home/dev/Tools/eclipse',
		target => "/home/dev/Tools/eclipse-${major}-${version}",
		require => Exec['move inner eclipse dir']
	}

	exec { 'install cucumber-eclipse plugin':
		command => '/home/dev/Tools/eclipse/eclipse -application org.eclipse.equinox.p2.director -nosplash -repository http://cucumber.github.io/cucumber-eclipse/update-site -installIUs cucumber.eclipse.feature.feature.group',
		require => File['create eclipse link']
	}

	exec { 'update m2eclipse-mavenarchiver':
		command => '/home/dev/Tools/eclipse/eclipse -application org.eclipse.equinox.p2.director -nosplash -repository https://otto.takari.io/content/sites/m2e.extras/m2eclipse-mavenarchiver/0.17.2/N/LATEST/ -installIUs org.sonatype.m2e.mavenarchiver.feature.feature.group',
		require => File['create eclipse link']
	}

	exec { 'install checkstyle plugin':
		command => '/home/dev/Tools/eclipse/eclipse -application org.eclipse.equinox.p2.director -nosplash -repository http://eclipse-cs.sourceforge.net/update -installIUs net.sf.eclipsecs.feature.group',
		require => File['create eclipse link']
	}

	exec { 'install findbugs plugin':
		command => '/home/dev/Tools/eclipse/eclipse -application org.eclipse.equinox.p2.director -nosplash -repository http://findbugs.cs.umd.edu/eclipse -installIUs edu.umd.cs.findbugs.plugin.eclipse.feature.group',
		require => File['create eclipse link']
	}

#	exec { 'install sonarlint plugin':
#		command => '/home/dev/Tools/eclipse/eclipse -application org.eclipse.equinox.p2.director -nosplash -repository http://www.sonarlint.org/eclipse -installIUs org.sonarlint.eclipse.feature.feature.group',
#		require => File['create eclipse link']
#	}

	exec { 'install M2E Connector for jaxws-maven-plugin plugin':
		command => '/home/dev/Tools/eclipse/eclipse -application org.eclipse.equinox.p2.director -nosplash -repository http://coderplus.com/m2e-update-sites/jaxws-maven-plugin/ -installIUs com.coderplus.m2e.jaxwscore',
		require => File['create eclipse link']
	}

	exec { 'install m2e connector for build-helper-maven-plugin plugin':
		command => '/home/dev/Tools/eclipse/eclipse -application org.eclipse.equinox.p2.director -nosplash -repository https://repository.sonatype.org/content/repositories/forge-sites/m2e-extras/0.15.0/N/0.15.0.201206251206/ -installIUs org.sonatype.m2e.buildhelper',
		require => File['create eclipse link']
	}

        exec { 'install Ansi Console plugin':
		command => '/home/dev/Tools/eclipse/eclipse -application org.eclipse.equinox.p2.director -nosplash -repository http://www.mihai-nita.net/eclipse -installIUs net.mihai-nita.ansicon.feature.group',
		require => File['create eclipse link']
	}
}

