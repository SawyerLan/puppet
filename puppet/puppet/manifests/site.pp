import 'nodes.pp'
import 'custom.pp'
$puppetserver = 'puppet.example.com'

Package {
	allow_virtual => true,
	ensure => present,
}

File {
	ensure => present,
	owner => 'root',
	group => 'root',
	mode => 0644,
	ignore  => ['.svn', 'CVS', '.git', '.*.swp', '.*.swo'],
}

Cron {
	ensure => present,
}

Exec {
	path => "/bin:/sbin:/usr/bin:/usr/sbin",
}

User {
	ensure => present,
}
