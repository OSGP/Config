include apt
include git

class git::git() {

	apt::ppa { 'ppa:git-core/ppa': }

	apt::update { 'apt-update':
		require => Package['ppa:git-core/ppa']
	}

	package { 'git': 
		require => Package['apt-update']
	}
}


