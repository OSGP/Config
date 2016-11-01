#class base::modules {
node 'dev-box' {

#sudo puppet module install rcoleman/puppet_module
#	module { 'puppetlabs-git':
#		ensure => present
#	}

	exec { 'Installing module puppetlabs-git':
		command => "puppet module install puppetlabs-git",
		unless  => "puppet module list | grep puppetlabs-git",
		path    => ['/bin', '/usr/bin']
	}

	exec { 'Installing module puppetlabs-stdlib':
		command => "puppet module install puppetlabs-stdlib",
		unless  => "puppet module list | grep puppetlabs-stdlib",
		path    => ['/bin', '/usr/bin']
	}

	exec { 'Installing module puppetlabs-activemq':
		command => "puppet module install puppetlabs-activemq",
		unless  => "puppet module list | grep puppetlabs-activemq",
		path    => ['/bin', '/usr/bin']
	}

	exec { 'Installing module puppetlabs-tomcat':
		command => "puppet module install puppetlabs-tomcat",
		unless  => "puppet module list | grep puppetlabs-tomcat",
		path    => ['/bin', '/usr/bin']
	}

        exec { 'Installing module mjanser-eclipse':
		command => "puppet module install mjanser-eclipse",
		unless  => "puppet module list | grep mjanser-eclipse",
		path    => ['/bin', '/usr/bin']
	}
}

