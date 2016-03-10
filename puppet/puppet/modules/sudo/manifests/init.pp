class sudo {
	package { "sudo": }

	if $operatingsystem == "Ubuntu" {
		package { "sudo-ldap":
			ensure => latest,
			require => Package["sudo"],
		}
	}

	file { "/etc/sudoers":
		owner => "root",
		group => "root",
		mode => 0440,
		content => template("sudo/sudoers.erb"),
		require => Package["sudo"],
	}
}
