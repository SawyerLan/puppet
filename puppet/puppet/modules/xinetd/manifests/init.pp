class xinetd::install {
	package { "xinetd": }
}

class xinetd::config {
	file { "/etc/xinetd.conf":
		mode => 0600,
		source => "puppet:///modules/xinetd/xinetd.conf",
		require => Class[xinetd::install],
		notify => Class[xinetd::service],
	}
}

class xinetd::service {
        service { "xinetd":
                ensure => running,
                hasstatus => true,
                hasrestart => true,
                enable => true,
                require => Class["xinetd::config"],
        }
}

class xinetd {
        include xinetd::install, xinetd::config, xinetd::service
}

#rsyncd
class xinetd::rsyncd::install {
	package { "rsync": }
}

class xinetd::rsyncd::config {
	file { "/etc/xinetd.d/rsync":
		source => "puppet:///modules/xinetd/rsync",
		require => Class[xinetd::rsyncd::install],
		notify => Class[xinetd::service],
	}

	file { "/etc/rsyncd.conf":
		source => "puppet:///modules/xinetd/rsyncd.conf",
		require => Class[xinetd::rsyncd::install],
	}

	file { "/etc/rsyncd.scrt":
		mode => 0600,
		source => "puppet:///modules/xinetd/rsyncd.scrt",
		require => Class[xinetd::rsyncd::install],
	}
}

class xinetd::rsyncd {
	include xinetd::rsyncd::install, xinetd::rsyncd::config
}

#telnetd
class xinetd::telnetd::install {
	package { "telnet-server": }
}

class xinetd::telnetd::config {
	file { "/etc/xinetd.d/telnet":
		source => "puppet:///modules/xinetd/telnet",
		require => Class[xinetd::telnetd::install],
		notify => Class[xinetd::service],
	}
}

class xinetd::telnetd {
	include xinetd::telnetd::install, xinetd::telnetd::config
}

