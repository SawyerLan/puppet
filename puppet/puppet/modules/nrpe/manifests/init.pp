class nrpe::install {
	package { "nrpe": ensure => latest, }
	package { "nagios-plugins-all": ensure => latest, }
}

class nrpe::config {
	file { "/etc/nagios/nrpe.cfg":
		source => "puppet:///modules/nrpe/nrpe.cfg",
		require => Class[nrpe::install],
		notify => Class[nrpe::service],
	}

	file { "/etc/nagios/libexec":
		ensure => directory,
		recurse => true,
		purge => true,
		force => true,
		owner => 'nrpe',
		group => 'nrpe',
		mode => 0744,
		source => "puppet:///modules/nrpe/libexec",
		require => Class[nrpe::install],
	}
}

class nrpe::service {
	service { "nrpe":
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		enable => true,
		require => Class["nrpe::config"],
	}
}

class nrpe {
	include nrpe::install, nrpe::config, nrpe::service
}
