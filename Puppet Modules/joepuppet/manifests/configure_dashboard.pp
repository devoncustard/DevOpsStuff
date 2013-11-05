class joepuppet::configure_dashboard {
        $password = "letmein" 

	file { ["/usr/share/puppet/rack", 
		"/usr/share/puppet/rack/puppetmasterd",
		"/usr/share/puppet/rack/puppetmasterd/public" , 
		"/usr/share/puppet/rack/puppetmasterd/tmp" ]:
		ensure => "directory",
	}

	file { '/tmp/configure-dashboard.sql':
		source => 'puppet:///modules/joepuppet/configure-dashboard.sql',
	}

        package {'mysql-server': ensure => installed } 

        service {'mysqld': ensure => running, enable => true,require => package ['mysql-server'] }

        exec { "Set MySQL root password":
                unless => "mysqladmin -uroot -p$password status",
                path => "/bin:/usr/bin",
                command => "mysqladmin -u root password $password",
                require	=> service['mysqld'],
        } 

        exec { "Configure dashboard database":
		require => exec ['Set MySQL root password'],	
		path => "/bin:/usr/bin",
		command => "mysql -uroot -p$password </tmp/configure-dashboard.sql",
	}

}


