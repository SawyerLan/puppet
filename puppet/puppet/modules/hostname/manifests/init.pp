class hostname {
	file { "/etc/sysconfig/network":
		content => template("hostname/network.erb"),
	}
}
