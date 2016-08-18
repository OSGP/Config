#node default { }

node 'dev-box' {

	# Delete Tomcat in Download dir
	exec { 'delete /home/dev/Downloads/apache-tomcat-7.0.62.tar.gz':
		command => '/bin/rm /home/dev/Downloads/apache-tomcat-7.0.62.tar.gz',
	}
	
	# Delete Eclipse in Download dir
	exec { 'delete /home/dev/Downloads/eclipse-jee-luna-SR2-linux-gtk-x86_64.tar.gz':
		command => '/bin/rm /home/dev/Downloads/eclipse-jee-luna-SR2-linux-gtk-x86_64.tar.gz',
	}
	
	# Delete ActiveMQ in Download dir
	exec { 'delete /home/dev/Downloads/apache-activemq-5.11.1-bin.tar.gz':	
		command => '/bin/rm /home/dev/Downloads/apache-activemq-5.11.1-bin.tar.gz',
	}
	
	# Delete SoapUi
	exec { 'delete /home/dev/Downloads/SoapUI-5.2.1-linux-bin.tar.gz':
		command => '/bin/rm /home/dev/Downloads/SoapUI-5.2.1-linux-bin.tar.gz',
	}
	
	# Delete protobuf-compiler
	exec { 'delete /home/dev/Downloads/protobuf-compiler_2.4.1-3ubuntu2_amd64.deb':
		command => '/bin/rm /home/dev/Downloads/protobuf-compiler_2.4.1-3ubuntu2_amd64.deb',
	}
	
	# Delete libprotoc7
	exec { 'delete /home/dev/Downloads/libprotoc7_2.4.1-3ubuntu2_amd64.deb':
		command => '/bin/rm /home/dev/Downloads/libprotoc7_2.4.1-3ubuntu2_amd64.deb',
	}
	
	# Delete libprotobuf7
	exec { 'delete /home/dev/Downloads/libprotobuf7_2.4.1-3ubuntu2_amd64.deb':
		command => '/bin/rm /home/dev/Downloads/libprotobuf7_2.4.1-3ubuntu2_amd64.deb',
	}
	
	# Changes the permissions for the unpacked archive folders to dev user.
	exec { 'chown /home/dev/Tools':
		command => '/bin/chown -R dev:dev /home/dev/Tools/*',
	}
}