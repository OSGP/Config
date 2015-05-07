user { 'dev' : 
    name        => 'dev',
    ensure      => present, 
    shell       => '/bin/bash',
    password   => '*',
    home        => '/home/dev/',
    system      => true,                      #Makes sure user has uid less than 500
    managehome  => true,
    comment     => 'The "dev" user',
} #end user