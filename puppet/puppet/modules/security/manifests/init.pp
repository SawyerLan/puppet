class security::config {
	file { "/etc/security/limits.conf":
		source => "puppet:///modules/security/limits.conf",
	}

	file { "/etc/security/limits.d/90-nproc.conf":
		source => "puppet:///modules/security/90-nproc.conf",
	}

	file { "/etc/login.defs":
		source => "puppet:///modules/security/login.defs",
	}

	file { "/etc/csh.cshrc":
		source => "puppet:///modules/security/csh.cshrc",
	}

	file { "/etc/services":
		source => "puppet:///modules/security/services",
	}

	file { "/etc/profile.d/custom.sh":
		source => "puppet:///modules/security/custom.sh",
	}

	file { "/etc/pam.d/su":
		source => "puppet:///modules/security/su",
	}

	file { "/etc/pam.d/system-auth-ac":
		source => "puppet:///modules/security/system-auth-ac",
	}

	file { "/etc/pam.d/sshd":
		source => "puppet:///modules/security/sshd_el$operatingsystemmajrelease",
	}

	file { "/var/log/pacct":
		source => "puppet:///modules/security/pacct",
	}
}

class security {
	include security::config
}
