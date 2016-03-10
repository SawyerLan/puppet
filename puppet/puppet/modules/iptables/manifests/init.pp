class iptables::install {
	package { "iptables": }
	if $operatingsystemmajrelease == "7" {
		package { "iptables-services": }
	}
}

class iptables::config {
	file { "/etc/sysconfig/iptables":
		mode => 0600,
		source => "puppet:///modules/iptables/iptables",
		require => Class[iptables::install],
		notify => Class[iptables::service],
	}
}

class iptables::service {
	service { "iptables":
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		enable => true,
		require => Class["iptables::config"],
	}
}

class iptables {
	include iptables::install, iptables::config, iptables::service
}
