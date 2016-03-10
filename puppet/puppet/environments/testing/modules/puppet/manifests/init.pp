class puppet::install {
	package { "puppet": }
	package { "facter": }
}

class puppet::config {
	file { "/etc/puppet/puppet.conf":
		ensure => present,
		content => template("puppet/puppet.conf.erb"),
		require => Class[puppet::install],
		notify => Class[puppet::service],
	}
}

class puppet::service {
	service { "puppet":
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		enable => true,
		require => Class["puppet::config"],
	}
}

class puppet {
	include puppet::install, puppet::config, puppet::service
}
