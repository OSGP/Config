#node default { }

node 'dev-box' {

	exec { 'make dev user default':
		command => '/bin/sed -i "s/vagrant/dev/g" /etc/lightdm/lightdm.conf',
	}
	
	exec { 'add osgp wallpaper':
		user	=> 'dev',
		command => '/bin/cp -f /home/vagrant/repos/Config/vagrant/OSGP-solar.png /usr/share/backgrounds/warty-final-ubuntu.png',
	}
	

}