user { 'dev' : 
    name        		=> 'dev',
    ensure      		=> present, 
    shell       			=> '/bin/bash',
    password   		=> '$1$2x3KeDs1$k60vGVK1n5gSMpCPGElTK1', 	#Password dev, hashed using openssl passwd -1
    home        		=> '/home/dev/',
    system      		=> true,                      #Makes sure user has uid less than 500
    managehome  	=> true,
    comment     		=> 'The "dev" user',
} #end user