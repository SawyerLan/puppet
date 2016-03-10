class sshd::install {
        package { "openssh-server":
		ensure => latest,
	}
}

class sshd::config {
	if $operatingsystemmajrelease == "5" {
		$configfilename = "sshd_config_el5"
	} else {
		$configfilename = "sshd_config_el6"
	}

	file { "/etc/ssh/sshd_config":
		mode => 0600,
		source => "puppet:///modules/sshd/$configfilename",
		require => Class["sshd::install"],
		notify => Class["sshd::service"],
	}

	file { "/etc/ssh_banner":
		owner => 'bin',
		group => 'bin',
		mode => 0644,
		source => "puppet:///modules/sshd/ssh_banner",
		require => Class["sshd::install"],
	}
}

class sshd::service {
	service { "sshd":
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		enable => true,
		require => Class["sshd::config"],
	}
}

class sshd {
	include sshd::install, sshd::config, sshd::service
}
