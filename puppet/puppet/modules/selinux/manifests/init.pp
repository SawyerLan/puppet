class selinux {
        file { "/etc/selinux/config":
                source => "puppet:///modules/selinux/config",
        }

	exec { "setenforce 0":
		onlyif => "test `getenforce` == Enforcing",
	}
}
