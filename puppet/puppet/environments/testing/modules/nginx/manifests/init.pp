class nginx::install {
	package { "nginx16": }
	package { "php56": }
}

class nginx::config {
	file { "/usr/local/nginx/conf/nginx.conf":
		source => "puppet:///modules/nginx/nginx/nginx.conf",
		require => Class["nginx::install"],
		notify => Class["nginx::service::nginx"],
	}

	file { "/usr/local/nginx/conf/conf.d":
		ensure => directory,
		recurse => true,
		purge => true,
		force => true,
		source => "puppet:///modules/nginx/nginx/conf.d",
		require => Class["nginx::install"],
		notify => Class["nginx::service::nginx"],
	}

	file { "/usr/local/php/lib/php.ini":
		source => "puppet:///modules/nginx/php/php.ini",
		require => Class["nginx::install"],
		notify => Class["nginx::service::php"],
	}

	file { "/usr/local/php/etc/php-fpm.conf":
		source => "puppet:///modules/nginx/php/php-fpm.conf",
		require => Class["nginx::install"],
		notify => Class["nginx::service::php"],
	}
}

class nginx::service::nginx {
	service { "nginx":
		ensure => running,
		hasstatus => false,
		pattern => "/usr/local/nginx/sbin/nginx",
		hasrestart => false,
		start => "/usr/local/nginx/sbin/nginx",
		stop => "/usr/local/nginx/sbin/nginx -s stop",
		restart => "/usr/local/nginx/sbin/nginx -s reload",
		require => Class["nginx::config"],
        }
}

class nginx::service::php {
	service { "php-fpm":
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		enable => true,
		require => Class["nginx::config"],
        }
}

class nginx::runtime_clean {
	exec { "/bin/rm -Rf /home/$app_user/website/~runtime/* >/dev/null 2>&1":
		refreshonly => true,
	}
}

class nginx::webroot {
	file { "/home/$app_user/website":
		ensure => directory,	
		recurse => true,
		links => follow,
		purge => false,
		force => false,
		owner => "$app_user",
		mode => 0640,
		source => "puppet:///modules/nginx/webroot",
		require => Class["user"],
		notify => Class["nginx::runtime_clean"],
	}
}

class nginx {
	include nginx::install, nginx::config, nginx::service::nginx, nginx::service::php, nginx::runtime_clean, nginx::webroot
}
