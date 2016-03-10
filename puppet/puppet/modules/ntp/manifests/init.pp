class ntp::install {
	package { "ntp": }
}

class ntp::config {
	file { "/etc/ntp.conf":
		ensure => present,
		owner => 'root',
		group => 'root',
		mode => 0644,
		source => "puppet:///modules/ntp/ntp.conf",
		require => Class[ntp::install],
		notify => Class[ntp::service],
	}
}

class ntp::service {
	service { "ntpd":
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		enable => true,
		require => Class["ntp::config"],
	}
}

class ntp {
	include ntp::install, ntp::config, ntp::service
}
