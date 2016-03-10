class ntpd::install {
	package { "ntp": }
}

class ntpd::config {
	file { "/etc/ntp.conf":
		ensure => present,
		owner => 'root',
		group => 'root',
		mode => 0644,
		source => "puppet:///modules/ntpd/ntp.conf",
		require => Class[ntpd::install],
		notify => Class[ntpd::service],
	}
}

class ntpd::service {
	service { "ntpd":
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		enable => true,
		require => Class["ntpd::config"],
	}
}

class ntpd {
	include ntpd::install, ntpd::config, ntpd::service
}
