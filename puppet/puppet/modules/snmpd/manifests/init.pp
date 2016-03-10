class snmpd::install {
	package { "net-snmp": }
	package { "net-snmp-utils": }
	package { "net-snmp-devel": }
}

class snmpd::config {
	file { "/etc/snmp/snmpd.conf":
		content => template("snmpd/snmpd.conf.erb"),
		require => Class[snmpd::install],
		notify => Class[snmpd::service],
	}		
}

class snmpd::service {
	service { "snmpd":
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		enable => true,
		require => Class["snmpd::config"],
	}
}

class snmpd {
	include snmpd::install, snmpd::config, snmpd::service
}
