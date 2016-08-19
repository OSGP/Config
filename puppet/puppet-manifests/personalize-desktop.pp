#node default { }

node 'dev-box' {

	exec { 'make dev user default':
		command => '/bin/sed -i "s/vagrant/dev/g" /etc/lightdm/lightdm.conf',
	}
	
	exec { 'add osgp wallpaper':
		command => '/bin/cp -f /home/vagrant/repos/Config/vagrant/OSGP-solar.png /usr/share/backgrounds/warty-final-ubuntu.png',
	}
	
	exec { 'git cache':
		command => '/usr/bin/git config --global credential.helper "cache --timeout=3600"',
	}
	
	exec { 'add desktop shortcuts':
		user => 'dev',
		command => '/bin/sh /home/vagrant/repos/Config/scripts/create_desktop_shortcuts.sh',
		require => Exec['chmod create_desktop_shortcuts.sh','chmod create_application_shortcut.sh','chmod create_weblink_shortcut.sh'],
	}
	
	exec { 'chmod create_desktop_shortcuts.sh':
		command => '/bin/chmod a+rwx /home/vagrant/repos/Config/scripts/create_desktop_shortcuts.sh',
	}
	
	exec { 'chmod create_application_shortcut.sh':
		command => '/bin/chmod a+rwx /home/vagrant/repos/Config/scripts/create_application_shortcut.sh',
	}
	
	exec { 'chmod create_weblink_shortcut.sh':
		command => '/bin/chmod a+rwx /home/vagrant/repos/Config/scripts/create_weblink_shortcut.sh',
	}

}