node 'dev-box' {

	exec { 'Update APT':
		command => '/usr/bin/apt-get update'
	}

	package { 'software-properties-common':
		ensure => latest,
		require => Exec['Update APT']
	}

	exec { 'install-ppa-ansible':
		command => '/usr/bin/apt-add-repository ppa:ansible/ansible',
		require => Package['software-properties-common']
	}

	exec { 'Update PPA':
		command => '/usr/bin/apt-get update',
		require => Exec['install-ppa-ansible']
	}

    package { 'ansible':
        ensure => latest,
		require => 'Exec[Update PPA]'
    }

	class { 'python':
		pip => latest,
		require => Package['ansible']
	}

	package { 'python-lxml':
		ensure => latest,
		require => Class['python']
	}

	exec { 'install-pip':
		command => '/usr/local/bin/pip install --upgrade pip',
		require => Package['python-lxml']
    }

    exec { 'Install ansible-lint':
		command => '/usr/local/bin/pip install ansible-lint',
		require => Exec['install-pip']
	}

    exec { 'Install boto3':
		command => '/usr/local/bin/pip install boto3',
		require => Exec['install-pip']
	}
}
