#node default { }

node 'dev-box' {

        $version="2016.3.5"

        # IntellIJ
	exec { 'Download IntellIJ':
		command => "/usr/bin/wget -q -O /home/dev/Downloads/osgp/ideaIC-${version}.tar.gz https://download.jetbrains.com/idea/ideaIC-${version}.tar.gz",
		creates => "/home/dev/Downloads/osgp/ideaIC-${version}.tar.gz",
		timeout => 1800,		
		returns => [0, 4],
	}

	exec { 'Extract IntellIJ':
		command => "/bin/mkdir -p /home/dev/Tools/ideaIC-${version} && /bin/tar xzf /home/dev/Downloads/osgp/ideaIC-${version}.tar.gz -C /home/dev/Tools/ideaIC-${version}",
		onlyif => "/usr/bin/test ! -d /home/dev/Tools/ideaIC-${version}",
		require => Exec['Download IntellIJ'], 
	}

        exec { 'Move inner idea-IC dir':
		command => "/bin/mv /home/dev/Tools/ideaIC-${version}/idea-IC-*/* /home/dev/Tools/ideaIC-${version} && /bin/rm -rf /home/dev/Tools/ideaIC-${version}/idea-IC-*",
		onlyif => "/usr/bin/test -d /home/dev/Tools/ideaIC-${version}/idea-IC-*",
		require => Exec['Extract IntellIJ']
	}

	file { 'Create IntellIJ link':
		ensure => link,
		path => '/home/dev/Tools/ideaIC',
		target => "/home/dev/Tools/ideaIC-${version}",
		require => Exec['Move inner idea-IC dir']
	}

        file { 'Create destop link':
                path => '/home/dev/Desktop/intellij.desktop',
                ensure => present,
                mode => 755,
                content => '[Desktop Entry]
Type=Application
Terminal=false
Icon=/home/dev/Tools/ideaIC/bin/idea.png
Name=IntellIJ
Exec=/home/dev/Tools/ideaIC/bin/idea.sh
Categories=Utility;
'
        }

}

