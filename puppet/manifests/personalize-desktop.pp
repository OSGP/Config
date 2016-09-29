#node default { }

node 'dev-box' {

	exec { 'add osgp wallpaper':
		command => '/bin/cp -f /home/dev/repos/Config/dev/OSGP-solar.png /usr/share/backgrounds/warty-final-ubuntu.png',
	}
	
	exec { 'git cache':
		command => '/usr/bin/git config credential.helper "cache --timeout=86400"',
	}
	
	exec { 'add desktop shortcuts':
		user => 'dev',
		command => '/bin/sh /home/dev/repos/Config/scripts/create_desktop_shortcuts.sh',
		require => Exec['chmod create_desktop_shortcuts.sh','chmod create_application_shortcut.sh','chmod create_weblink_shortcut.sh'],
	}
	
	exec { 'chmod create_desktop_shortcuts.sh':
		command => '/bin/chmod a+rwx /home/dev/repos/Config/scripts/create_desktop_shortcuts.sh',
	}
	
	exec { 'chmod create_application_shortcut.sh':
		command => '/bin/chmod a+rwx /home/dev/repos/Config/scripts/create_application_shortcut.sh',
	}
	
	exec { 'chmod create_weblink_shortcut.sh':
		command => '/bin/chmod a+rwx /home/dev/repos/Config/scripts/create_weblink_shortcut.sh',
	}

}
