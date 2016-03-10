class resolv {
	include named::params
	file { "/etc/resolv.conf":
		owner => "root",
		group => "root",
		mode => 0644,
		content => template("resolv/resolv.conf.erb"),
	}
}
