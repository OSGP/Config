#node default { }

node 'dev-box' {

        $homedir="/home/dev"
        $product="Terraform"
        $version="0.9.0"

	exec { "Download ${product}":
		command => "/usr/bin/wget -q -O ${homedir}/Downloads/osgp/${product}-${version}.zip https://releases.hashicorp.com/terraform/${version}/terraform_${version}_linux_amd64.zip",
		creates => "${homedir}/Downloads/osgp/${product}-${version}.tar.gz",
		timeout => 1800,		
		returns => [0, 4],
	}

	exec { "Extract ${product}":
		command => "/bin/mkdir -p ${homedir}/Tools/${product}-${version} && /usr/bin/unzip ${homedir}/Downloads/osgp/${product}-${version}.zip -d ${homedir}/Tools/${product}-${version}",
		onlyif => "/usr/bin/test ! -d ${homedir}/Tools/${product}-${version}",
		require => Exec["Download ${product}"], 
	}

	file { "Create ${product} link":
		ensure => link,
		path => "${homedir}/Tools/${product}",
		target => "${homedir}/Tools/${product}-${version}",
		require => Exec["Extract ${product}"]
	}

        exec { "Add ${product} to path in ${homedir}.profile":
                command => "/bin/sed -i 's/:\$PATH/:\\/home\\/dev\\/Tools\\/${product}:\$PATH/g' ${homedir}/.profile",
		unless => "/bin/grep PATH= ${homedir}/.profile | /bin/grep ${product}", 
		require => File["Create ${product} link"], 
        }
}

