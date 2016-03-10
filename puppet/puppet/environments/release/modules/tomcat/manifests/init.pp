class tomcat::install {
	package { "jdk": }
	package { "tomcat": }

	exec { "usermod -G tomcat $app_user":
		unless => "groups $app_user|grep -o tomcat > /dev/null",
		require => Class["user"],
	}
}

class tomcat::config {
	$memcached_node = "n1:cache01.example.com:22122,n2:cache02.example.com:22122"
	$db_username = "mmport"
	$db_password = "Hc_3tPa9Ex"
	$db_sid = "mmportal"
	$db_host = {
		rac01 => { "host" => "10.101.10.16", "port" => '1571' },
		rac02 => { "host" => "10.101.10.15", "port" => '1571' }
	}

	$tomcat_lib = ["tomcat-dbcp.jar", "ojdbc6.jar", "asm-3.2.jar", "kryo-1.04.jar", "kryo-serializers-0.11.jar", "memcached-session-manager-1.8.3.jar", "memcached-session-manager-tc7-1.8.3.jar", "minlog-1.2.jar", "msm-kryo-serializer-1.8.3.jar", "reflectasm-1.01.jar", "spymemcached-2.11.1.jar"]

	define libResource {
		file { "/usr/share/java/tomcat/$name":
			source => "puppet:///modules/tomcat/lib/$name",
			require => Class["tomcat::install"],
			notify => Class["tomcat::service"],
		}
	}

	libResource { $tomcat_lib: }

	file { "/etc/logrotate.d/tomcat":
		source => "puppet:///modules/tomcat/logrotate.tomcat",
		require => Class["tomcat::install"],
	}

	file { "/etc/tomcat/server.xml":
		owner => 'tomcat',
		group => 'tomcat',
		mode => 0664,
		content => template("tomcat/server.xml.erb"),
		require => Class["tomcat::install"],
		notify => Class["tomcat::service"],
	}

	file { "/home/$app_user/java_webapp":
		ensure => directory,
		owner => "$app_user",
		group => 'tomcat',
		mode => 0640,
		require => Class["user"],
	}

	define webappResource {
		case $name {
			"richcms":	{ $ignore = ['.svn', 'CVS', '.git', '.*.swp', '.*.swo', 'upload'] }
			default:	{ $ignore = ['.svn', 'CVS', '.git', '.*.swp', '.*.swo'] }
		}

		file { "/home/$app_user/java_webapp/$name":
			ensure => directory,
			recurse => true,
			purge => true,
			force => true,
			owner => "$app_user",
			group => 'tomcat',
			mode => 0640,
			source => "puppet:///modules/tomcat/$name",
			ignore => $ignore,
			require => Class["tomcat::install"],
			notify => Class["tomcat::service"],
		}

		case $name {
			"richcms":	{
				file { "/home/$app_user/java_webapp/$name/upload":
					ensure => link,
					target => "/home/$app_user/website/static",
					require => Class["softlink"], 
				}
			}
		}
	}
	
	webappResource { $webapp_name: }

	file { "/etc/tomcat/tomcat.conf":
		owner => 'tomcat',
		group => 'tomcat',
		mode => 0664,
		source => "puppet:///modules/tomcat/conf/tomcat.conf",
		require => Class["tomcat::install"],
		notify => Class["tomcat::service"],
	}

	file { "/etc/tomcat/web.xml":
		owner => 'tomcat',
		group => 'tomcat',
		mode => 0664,
		source => "puppet:///modules/tomcat/conf/web.xml",
		require => Class["tomcat::install"],
		notify => Class["tomcat::service"],
	}

	file { "/etc/tomcat/server.keystore":
		owner => 'tomcat',
		group => 'tomcat',
		mode => 0640,
		source => "puppet:///modules/tomcat/conf/server.keystore",
		require => Class["tomcat::install"],
		notify => Class["tomcat::service"],
	}

	file { "/etc/tomcat/context.xml":
		owner => 'tomcat',
		group => 'tomcat',
		mode => 0664,
		content => template("tomcat/context.xml.erb"),
		require => Class["tomcat::install"],
		notify => Class["tomcat::service"],
	}
}

class tomcat::service {
	service { "tomcat":
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		enable => true,
		require => Class["tomcat::config"],
	}

	exec { "rm -Rf /var/cache/tomcat/work/* >/dev/null 2>&1":
		refreshonly => true,
	}
}

class tomcat::crontab {
        cron { "gzip old tomcat log files":
                command => "/bin/find /var/log/tomcat/ -type f ! -name \*.gz -mtime +1 -exec /bin/gzip {} \; >/dev/null 2>&1 &",
                user => root,
                minute => 0,
                hour => 2,
                require => Class["tomcat::install"],
        }

	cron { "delete old tomcat log files":
                command => "/bin/find /var/log/tomcat/ -type f -mtime +7 -exec /bin/rm -Rf {} \; >/dev/null 2>&1 &",
                user => root,
                minute => 0,
                hour => 3,
                require => Class["tomcat::install"],
        }
}

class tomcat {
	include tomcat::install, tomcat::config, tomcat::service, tomcat::crontab
}
