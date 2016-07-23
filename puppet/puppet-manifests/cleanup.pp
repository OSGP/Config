#node default { }

node 'dev-box' {

	# Deletes the archives that have been downloaded and unpacked.
	exec { 'delete /home/vagrant/Downloads/*.tar.gz':
		command => '/bin/rm /home/vagrant/Downloads/*.tar.gz',
		before => Exec['chown /home/vagrant/Downloads'],
	}

	# Deletes the package files that have been downloaded and installed.
	exec { 'delete /home/vagrant/Downloads/*.deb':
		command => '/bin/rm /home/vagrant/Downloads/*.deb',
		before => Exec['chown /home/vagrant/Downloads'],
	}

	# Changes the permissions for the unpacked archive folders to dev user.
	exec { 'chown /home/vagrant/Downloads':
		command => '/bin/chown -R vagrant:vagrant /home/vagrant/Downloads/*',
	}

}