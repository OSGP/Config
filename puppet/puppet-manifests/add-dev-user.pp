user { 'dev' : 
    name        		=> 'dev',
    ensure      		=> present, 
    shell       			=> '/bin/bash',
	# Password is dev, hashed using openssl passwd -1
    password   		=> '$1$2x3KeDs1$k60vGVK1n5gSMpCPGElTK1',
    home        		=> '/home/dev/',
	# Makes sure user has uid more than 500, ensure it can login via GUI
    system      		=> false,                 
    managehome  	=> true,
    comment     		=> 'The "dev" user',
	groups				=> ['sudo']
} #end user