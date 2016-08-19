#node default { }

node 'dev-box' {

	exec { 'make dev user default':
		command => '/bin/sed -i "s/vagrant/dev/g" /etc/lightdm/lightdm.conf',
	}
	
	exec { 'add osgp wallpaper':
		command => '/bin/cp -f /home/vagrant/repos/Config/vagrant/OSGP-solar.png /usr/share/backgrounds/warty-final-ubuntu.png',
	}
	
	exec { 'add desktop shortcuts':
		user => 'dev',
		command => '/bin/sh /home/vagrant/repos/Config/scripts/create_desktop_shortcuts.sh',
		before => Exec['chmod create_desktop_shortcuts.sh'],
	}
	
	exec { 'chmod create_desktop_shortcuts.sh':
		user => 'dev',
		command => '/bin/chmod u+rwx /home/vagrant/repos/Config/scripts/create_desktop_shortcuts.sh',
		before => Exec['chown scripts to dev user'],
	}
	
	exec { 'chown scripts to dev user':
		user => 'vagrant',
		command => '/bin/chown dev:dev /home/vagrant/repos/Config/scripts/*',
	}
	

}