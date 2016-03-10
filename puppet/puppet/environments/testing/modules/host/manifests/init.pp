class host {
	file { "/etc/hosts":
		owner => 'root',
		group => 'root',
		mode => 0644,
		content => template("host/hosts.erb"),
	}

        file { "/etc/hosts.allow":
                owner => 'root',
                group => 'root',
                mode => 0644,
                source => "puppet:///modules/host/hosts.allow",
        }

        file { "/etc/hosts.deny":
                owner => 'root',
                group => 'root',
                mode => 0644,
                source => "puppet:///modules/host/hosts.deny",
        }

        file { "/etc/host.conf":
                owner => 'root',
                group => 'root',
                mode => 0644,
                source => "puppet:///modules/host/host.conf",
        }
}
