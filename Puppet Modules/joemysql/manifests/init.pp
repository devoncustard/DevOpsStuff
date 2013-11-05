class joemysql {
	$password = "letmein"
	package {'mysql-server': ensure => installed }
	service {'mysqld': ensure => running, enable => true }
	exec { "Sleep for a few":
		command => "sleep 15",
		path => "/usr/bin:/bin",
		
	}
	exec { "Set MySQL root password":
		unless => "mysqladmin -uroot -p$password status",
		path => "/bin:/usr/bin",
		command => "mysqladmin -u root password $password",
		require => service['mysqld'],
	}
}
