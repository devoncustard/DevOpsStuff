class joepuppet::configure_puppetmaster_base {
	file { '/etc/puppet/puppet.conf':
		content => template('joepuppet/puppetmaster.conf.erb'),
	}
	file { '/etc/sysconfig/puppet':
		content => template('joepuppet/etc.sysconfig.puppet.erb'),
	}

}
