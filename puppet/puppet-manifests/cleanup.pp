#node default { }

node 'dev-box' {

	# Deletes the files that have been downloaded.
	exec { 'delete /home/dev/Downloads':
		command => '/bin/rm /home/dev/Downloads/*',
	}

	# Changes the permissions for the unpacked archive folders to dev user.
	exec { 'chown /home/dev/Tools':
		command => '/bin/chown -R dev:dev /home/dev/Tools/*',
	}
}