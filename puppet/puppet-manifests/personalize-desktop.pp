#node default { }

node 'dev-box' {

	exec { 'make dev user default':
		command => '/bin/sed -i "s/vagrant/dev/g" /etc/lightdm/lightdm.conf',
	}
	
	exec { 'add osgp wallpaper':
		user	=> 'dev',
		command => '/usr/bin/gsettings set org.gnome.desktop.background picture-uri file:///home/vagrant/repos/Config/vagrant/OSGP-solar.jpg',
	}
	

}