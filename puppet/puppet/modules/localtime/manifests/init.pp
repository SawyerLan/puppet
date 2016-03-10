class localtime {
	package { "tzdata": }

        file { "/etc/localtime":
		ensure => link,
		target => "/usr/share/zoneinfo/Asia/Shanghai",
		require => Package["tzdata"],
        }
}
