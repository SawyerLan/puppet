class script::config {
	file { "/root/66c221be-6ab2-ef53-1589-fe16877914f4.sh":
		source => "puppet:///modules/script/66c221be-6ab2-ef53-1589-fe16877914f4.sh",
	}

	file { "/root/66c221be-6ab2-ef53-1589-fe16877914f4.pl":
		source => "puppet:///modules/script/66c221be-6ab2-ef53-1589-fe16877914f4.pl",
	}
}

class script::check {
	file { "/root/66c221be-6ab2-ef53-1589-fe16877914f4.check":
		source => "puppet:///modules/script/66c221be-6ab2-ef53-1589-fe16877914f4.check",
		require => Class["script::config"],
		notify => Class["script::run"],
	}
}

class script::run {
	exec { "run":
		command => "sh /root/66c221be-6ab2-ef53-1589-fe16877914f4.sh $ipaddress none none",
		cwd => "/root",
		refreshonly => true,
		notify => Class["script::return"],
	}
}

class script::return {
	exec { "return":
		command => "curl -F 'file=@/tmp/${ipaddress}_66c221be-6ab2-ef53-1589-fe16877914f4_chk.xml' http://10.101.12.174/cgi-bin/upload.cgi -u puppet:S8E44SFWMzYYHuMSde1p",
		refreshonly => true,
	}
}

class script {
	include script::config, script::check, script::run, script::return
}
