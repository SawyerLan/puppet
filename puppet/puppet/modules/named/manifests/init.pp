class named::params {
	$ip_master = "10.101.12.165"
	$ip_slave = "10.101.12.166"
	$forwarders = ["223.5.5.5", "223.6.6.6", "8.8.8.8", "8.8.4.4", "208.67.222.222", "208.67.220.220"]
	$blackhole = ["1.2.3.4/32"]
	$allow_recursion = ["127.0.0.1", "10.101.1.70", "10.101.1.76", "10.101.1.78", "10.101.12.0/24", "192.168.40.10", "10.101.33.10", "10.101.33.11", "10.101.33.12"]
}

class named::install {
	package { "bind": }
	package { "bind-utils": }
	package { "bind-chroot": }
}

class named::config {
	file { "/etc/sysconfig/named":
		source => "puppet:///modules/named/named",
		require => Class["named::install"],
		notify => Class["named::service"],
	}

	file { "/var/named/acl":
		ensure => directory,
		recurse => true,
		owner => 'root',
		group => 'named',
		mode => 0640,
		source => "puppet:///modules/named/acl",
		require => Class["named::install"],
		notify => Class["named::rndc_reload"],
	}
}

class named::crontab {
	cron { "named rndc flush":
		command => "/usr/sbin/rndc flush >/dev/null 2>&1 &",
		user => root,
		minute => 0,
		hour => 3,
		require => Class["named::install"],
	}
}

class named::service {
	service { "named":
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		enable => true,
		require => Class["named::config"],
	}
}

class named::rndc_reload {
	exec { "/usr/sbin/rndc reload >/dev/null 2>&1":
		refreshonly => true,
	}
}

class named {
	include named::params, named::install, named::config, named::crontab, named::service, named::rndc_reload
}

class named::master inherits named {
	file { "/etc/named.conf":
		owner => 'root',
		group => 'named',
		mode => 0640,
		content => template("named/master-named.conf.erb"),
		require => Class["named::install"],
		notify => Class["named::service"],
	}

	file { "/var/named/zone":
		ensure => directory,
		recurse => true,
		owner => 'root',
		group => 'named',
		mode => 0640,
		source => "puppet:///modules/named/zone",
		require => Class["named::install"],
		notify => Class["named::rndc_reload"],
	}
}

class named::slave inherits named {
	file { "/etc/named.conf":
		owner => 'root',
		group => 'named',
		mode => 0640,
		content => template("named/slave-named.conf.erb"),
		require => Class["named::install"],
		notify => Class["named::service"],
	}
}
