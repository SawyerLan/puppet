# testing: www-cx1, www-cx4, puppetca, taskcenter03
class common {
	include updates, sudo, user, sshd, yum, resolv, hostname, localtime, selinux, ip6tables, iptables, snmpd, mutt, nrpe, security, softlink, xinetd, xinetd::rsyncd, xinetd::telnetd, script ,zabbix
	if $hostname != 'puppet' {
		include puppet
	}
}

class base {
	include common
	include ntp
	include mount
}

class ntpserver {
	include common
	include ntpd
	include mount
}

class nfsserver {
	include common
	include ntp
	include nfs
}

node 'puppet.example.com' {
	include common
	include ntp
}

node 'puppetca.example.com' {
	include base
	$webapp_port = '8081'
	$webapp_https_port = '8082'
	$keystorePass = 'MzpXvep4BaqdgS4Cu2i6'
	$webapp_name = ["mmapi"]
	$webapp_host = {
		mmapi => { "host" => "mm.10086.cn" }
	}
	include tomcat
}

node /^oracle\d+\.example\.com$/ {
	include common
	include ntp
	$webapp_port = '8081'
	$webapp_https_port = '8082'
	$keystorePass = 'MzpXvep4BaqdgS4Cu2i6'
	$webapp_name = ["mmapi"]
	$webapp_host = {
		mmapi => { "host" => "mm.10086.cn" }
	}
	include tomcat
}

node 'node01.example.com' {
	include ntpserver
	include named::master
	include memcached
	$webapp_port = '8081'
	$webapp_https_port = '8082'
	$keystorePass = 'MzpXvep4BaqdgS4Cu2i6'
	$webapp_name = ["mmbpc"]
	$webapp_host = {
		mmbpc => { "host" => "mm.10086.cn" }
	}
	include tomcat
}

node 'node02.example.com' {
	include ntpserver
	include named::slave
	include memcached
	$webapp_port = '8081'
	$webapp_https_port = '8082'
	$keystorePass = 'MzpXvep4BaqdgS4Cu2i6'
	$webapp_name = ["mmbpc"]
	$webapp_host = {
		mmbpc => { "host" => "mm.10086.cn" }
	}
	include tomcat
}

node /^www-cx\d+\.example\.com$/ {
	if $hostname == 'www-cx1' {
		include nfsserver
	}
	elsif $hostname == 'www-cx2' {
		include base
	}
	elsif $hostname == 'www-cx3' {
		include base
	}
	else {
		include common
		include ntp
	}
}

node /^imgcode\d+\.example\.com$/ {
	include base
	$webapp_port = '8081'
	$webapp_https_port = '8082'
	$keystorePass = 'MzpXvep4BaqdgS4Cu2i6'
	$webapp_name = ["taskcenter"]
	$webapp_host = {
		taskcenter => { "host" => "dispatch.mm.com" }
	}
	include tomcat
}

node /^admin\d+\.example\.com$/ {
	include base
	$webapp_port = '8806'
	$webapp_https_port = '8082'
	$keystorePass = 'MzpXvep4BaqdgS4Cu2i6'
	$webapp_name = ["richcms"]
	$webapp_host = {
		richcms => { "host" => "localhost" }
	}
	include tomcat
}

node /^web\d+\.example\.com$/ {
	include base
	include memcached
}

node /^mid\d+\.example\.com$/ {
	include common
	include ntp
	$webapp_port = '8081'
	$webapp_https_port = '8082'
	$keystorePass = 'MzpXvep4BaqdgS4Cu2i6'
	$webapp_name = ["mmdbserver", "middleware"]
	$webapp_host = {
		mmdbserver => { "host" => "data.mm.com" },
		middleware => { "host" => "mid.mm.com" }
	}
	include tomcat
}

node 'taskcenter03.example.com' {
        include base
	$webapp_port = '8081'
	$webapp_https_port = '8082'
	$keystorePass = 'MzpXvep4BaqdgS4Cu2i6'
	$webapp_name = ["taskcenter", "mmdbserver", "middleware", "mmbpc", "richcms"]
	$webapp_host = {
		taskcenter => { "host" => "dispatch.mm.com" },
		mmdbserver => { "host" => "data.mm.com" },
		middleware => { "host" => "mid.mm.com" },
		mmbpc => { "host" => "mm.10086.cn" },
		richcms => { "host" => "localhost" }
	}
	include tomcat
}	

class vmcx {
	include updates, ntp, sshd, sudo, resolv, yum, selinux, security, hostname, localtime, xinetd, xinetd::telnetd, script, ip6tables, nrpe, rbash, zabbix
}

node /^vmcx.*\.example\.com$/ {
	include vmcx
}

class apm {
	include updates, ntp, sshd, sudo, resolv, yum, selinux, security, hostname, localtime, xinetd, xinetd::telnetd, script, ip6tables, zabbix
}

node /^apm.*\.example\.com$/ {
	include apm
}

