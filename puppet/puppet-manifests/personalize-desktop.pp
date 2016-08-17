#node default { }

node 'dev-box' {

	exec { 'copy wallpaper to user dir':
		command => '/bin/cp /home/dev/Sources/Config/vagrant/OSGP-solar.jpg /home/dev/Pictures/',
		before  => Exec['add osgp wallpaper'],
	}
	
	exec { 'make dev user default':
		command => '/bin/sed -i 's/vagrant/dev/s' /etc/lightdm/lightdm.conf',
	}

	
	exec { 'add osgp wallpaper':
		user	=> 'dev',
		command => '/usr/bin/gettings org.gnome.desktop.background picture-uri file://home/dev/Pictures/OSGP-solar.jpg',
	}
	

}