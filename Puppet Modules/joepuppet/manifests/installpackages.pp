class joepuppet::installpackages {
	package { 'puppet-server':
		ensure => installed,
	}
	package { 'puppet-dashboard':
		ensure => installed,
	}
	package { 'httpd':
		ensure => installed,
	}
	package {'httpd-devel':
		ensure => installed,
	}
	package {'mod_ssl':
		ensure => installed,
	}
	package {'ruby-devel':
		ensure => installed,
	}
	package {'rubygems':
		ensure => installed,
	}
	package {'gcc':
		ensure => installed,
	}
	package {'gcc-c++':
		ensure => installed,
	}
	package {'libcurl-devel':
		ensure => installed,
	}
	package {'openssl-devel':
		ensure => installed,
	}
	package {'zlib-devel':
		ensure => installed,
	}
	package {'make':
		ensure => installed,
	}
}
