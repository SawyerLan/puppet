class rbash::install {
	file { "/etc/shells":
		source => "puppet:///modules/rbash/shells",
	}

	file { "/bin/rbash":
		ensure => link,
		force => true,
		target => "/bin/bash",
	}
}

class rbash::user {
	user { "$query_user":
        	uid => $query_user_uid,
		shell => "/bin/rbash",
		managehome => true,
		comment => "Query User",
		password => '$1$g5W7Q$t/ZqUmwAnt9dV/cRHXUZA1',	
		require => Class["rbash::install"],
	}
}

class rbash::config {
	file { "/home/$query_user/.bashrc":
		source => "puppet:///modules/rbash/bashrc",
		require => Class["rbash::user"],
	}

	file { "/home/$query_user/.bash_logout":
		source => "puppet:///modules/rbash/bash_logout",
		require => Class["rbash::user"],
	}

	file { "/home/$query_user/.bash_profile":
		source => "puppet:///modules/rbash/bash_profile",
		require => Class["rbash::user"],
	}

	file { "/home/$query_user/bin":
		ensure => directory,
		require => Class["rbash::user"],
	}

	define changeMode {
		exec { "chmod g+rx /home/$name":
			onlyif => "id $name > /dev/null 2>&1 && test `stat -c%a /home/$name | cut -b 2` -lt 5",
		}
	}

	define addGroups {
		exec { "usermod -a -G $name $query_user":
			onlyif => "id $name > /dev/null 2>&1 && ! id $query_user | grep '($name)' > /dev/null 2>&1",
			require => Class["rbash::user"],
		}
	}

	$groupsName = ["middle", "weihu"]
	addGroups { $groupsName: }
	changeMode { $groupsName: }

        define bin_linkResource {
                file { "/home/$query_user/bin/$name":
                        ensure => link,
                        force => true,
                        target => "/bin/$name",
                        require => File["/home/$query_user/bin"],
                }
        }

	define usrbin_linkResource {
                file { "/home/$query_user/bin/$name":
                        ensure => link,
                        force => true,
                        target => "/usr/bin/$name",
                        require => File["/home/$query_user/bin"],
                }
        }
	
        $bin_linkName = ["ls", "ps", "netstat", "ping", "df", "cut", "cat", "zcat", "grep", "sort", "more"]
        $usrbin_linkName = ["clear", "reset", "man", "top", "uptime", "id", "w", "who", "whoami", "du", "tree", "find", "awk", "zgrep", "wc", "uniq", "head", "tail"]
        bin_linkResource { $bin_linkName: }
        usrbin_linkResource { $usrbin_linkName: }
}

class rbash {
	include rbash::install, rbash::user, rbash::config
}
