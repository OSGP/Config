node 'dev-box' {
	
        exec { 'Configure activemq for development':
		command => "/bin/sed -i 's/<broker xmlns=/<broker deleteAllMessagesOnStartup=\"true\" xmlns=/g' /opt/apache-activemq-5.11.1/conf/activemq.xml"
        }
}
