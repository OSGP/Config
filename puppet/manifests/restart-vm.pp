node 'dev-box' {

	exec { 'Restart': 
#		command => '/sbin/shutdown -r +1',
		command => '/sbin/reboot',
	}
}


