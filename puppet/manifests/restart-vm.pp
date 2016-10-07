node 'dev-box' {

	exec { 'Restart': 
		command => '/sbin/shutdown -r +1',
		require => Exec['Restarting VM  in 1min to activate several settings']
	}
}


