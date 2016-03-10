class ip6tables::install {
	package { "iptables-ipv6": }
}

class ip6tables::config {
	file { "/etc/sysconfig/ip6tables":
		mode => 0600,
		source => "puppet:///modules/ip6tables/ip6tables",
		require => Class[ip6tables::install],
		notify => Class[ip6tables::service],
	}
}

class ip6tables::service {
	service { "ip6tables":
		ensure => stopped,
		hasstatus => true,
		hasrestart => true,
		enable => false,
		require => Class["ip6tables::config"],
	}
}

class ip6tables {
	include ip6tables::install, ip6tables::config, ip6tables::service
}
