#node default { }

node 'dev-box' {

	# Deletes the archives that have been downloaded and unpacked.
	exec { 'delete /home/dev/Downloads/*.tar.gz':
		command => '/bin/rm /home/dev/Downloads/*.tar.gz',
		before => Exec['chown /home/dev/Downloads'],
	}

	# Deletes the package files that have been downloaded and installed.
	exec { 'delete /home/dev/Downloads/*.deb':
		command => '/bin/rm /home/dev/Downloads/*.deb',
		before => Exec['chown /home/dev/Downloads'],
	}

	# Changes the permissions for the unpacked archive folders to dev user.
	exec { 'chown /home/dev/Downloads':
		command => '/bin/chown -R dev:dev /home/dev/Downloads/*',
	}

}