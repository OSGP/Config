#node default { }

node 'dev-box' {

	file { '/etc/osp':
    ensure => 'directory',
  }
}
