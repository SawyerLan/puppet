class mutt {
	package { "mutt": }
	package { "msmtp": }

	file { "/root/.muttrc":
		content => template("mutt/muttrc.erb"),
		require => Package["mutt"],
	}
	file { "/root/.msmtprc":
		content => template("mutt/msmtprc.erb"),
		mode => 0600,
		require => Package["msmtp"],
	}

	file { "/home/$app_user/.muttrc":
		owner => "$app_user",
		content => template("mutt/muttrc.erb"),
		require => [Package["mutt"], Class["user"]],
	}
	file { "/home/$app_user/.msmtprc":
		owner => "$app_user",
		content => template("mutt/msmtprc.erb"),
		mode => 0600,
		require => [Package["mutt"], Class["user"]],
	}
}
