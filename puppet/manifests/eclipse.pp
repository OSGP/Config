#node default { }

node 'dev-box' {

	# Eclipse EE for Webdevelopers, Luna.
	exec { 'wget eclipse':
		command => '/usr/bin/wget -q -O /home/dev/Downloads/osgp/eclipse-jee-luna-SR2-linux-gtk-x86_64.tar.gz http://ftp.acc.umu.se/mirror/eclipse.org/technology/epp/downloads/release/luna/SR2/eclipse-jee-luna-SR2-linux-gtk-x86_64.tar.gz',
		before => Exec['unpack eclipse'],
		timeout => 1800,		
		returns => [0, 4],
	}

	exec { 'unpack eclipse':
		command => '/bin/tar xzf /home/dev/Downloads/osgp/eclipse-jee-luna-SR2-linux-gtk-x86_64.tar.gz -C /home/dev/Tools',
	}

	exec { 'install cucumber-eclipse plugin':
		command => '/home/dev/Tools/eclipse/eclipse -application org.eclipse.equinox.p2.director -repository http://cucumber.github.io/cucumber-eclipse/update-site -installIUs cucumber.eclipse.feature.feature.group',
		require => Exec['unpack eclipse']
	}

	exec { 'Update eclipse.ini':
		command => 'echo -startup \
plugins/org.eclipse.equinox.launcher_1.3.0.v20140415-2008.jar \
--launcher.library \
plugins/org.eclipse.equinox.launcher.gtk.linux.x86_64_1.1.200.v20150204-1316 \
-product \
org.eclipse.epp.package.jee.product \
--launcher.defaultAction \
openFile \
-showsplash \
org.eclipse.platform \
--launcher.XXMaxPermSize \
2G \
--launcher.defaultAction \
openFile \
--launcher.appendVmargs \
-vmargs \
-Dosgi.requiredJavaVersion=1.7 \
-XX:MaxPermSize=1G \
-Xms2G \
-Xmx2G \
-server \
-XX:+UseParallelGC \
-Xmn1G \
-Xss1G \
>> /home/dev/Tools/eclipse/eclipse.ini',
		require => Exec['unpack eclipse']
	}

}

