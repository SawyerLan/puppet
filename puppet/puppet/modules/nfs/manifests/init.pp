class nfs::install {
	package { "nfs-utils": }
}

class nfs::config {
	file { "/etc/exports":
		source => "puppet:///modules/nfs/exports",
		require => Class[nfs::install],
		notify => Class[nfs::service],
	}

	file { "/etc/sysconfig/nfs":
		source => "puppet:///modules/nfs/nfs",
		require => Class[nfs::install],
		notify => Class[nfs::service],
	}
}

class nfs::service {
	service { "nfs":
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		enable => true,
		require => Class["nfs::config"],
	}
}

class nfs {
	include nfs::install, nfs::config, nfs::service
}
