class updates::install {
	package { ["openssl", "bash", "glibc"]:
		ensure => latest,
	}
}

class updates {
	include updates::install
}
