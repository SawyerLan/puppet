class memcached::params {
	$memcached_port = '22122'
	$memcached_user = "memcached"
	$memcached_maxconn = '2048'
	$memcached_cachesize = '1024'
}

class memcached::install {
	package { "memcached": }
}

class memcached::config {
	include memcached::params
	$memcached_port = $memcached::params::memcached_port
	$memcached_user = $memcached::params::memcached_user
	$memcached_maxconn = $memcached::params::memcached_maxconn
	$memcached_cachesize = $memcached::params::memcached_cachesize

        file { "/etc/sysconfig/memcached":
		content => template("memcached/memcached.erb"),
		require => Class[memcached::install],
		notify => Class[memcached::service],
	}
}

class memcached::service {
	service { "memcached":
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		enable => true,
		require => Class["memcached::config"],
	}
}

class memcached {
	include memcached::install, memcached::config, memcached::service
}
