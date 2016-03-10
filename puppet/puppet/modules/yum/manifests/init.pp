class yum::install {
	package { "yum": }
	package { "mysql-community-release": }
}

class yum::config_repo {
	yumrepo { base:
		descr => "base - $operatingsystem - $operatingsystemmajrelease - \$basearch",
		baseurl => "http://mirrors.aliyun.com/centos/$operatingsystemmajrelease/os/\$basearch/",
		gpgkey => "http://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-$operatingsystemmajrelease",
		gpgcheck => "1",
		enabled => "1",
	}

	yumrepo { updates:
		descr => "updates - $operatingsystem - $operatingsystemmajrelease - \$basearch",
		baseurl => "http://mirrors.aliyun.com/centos/$operatingsystemmajrelease/updates/\$basearch/",
		gpgkey => "http://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-$operatingsystemmajrelease",
		gpgcheck => "1",
		enabled => "1",
	}

	yumrepo { epel:
		descr => "epel - $operatingsystem - $operatingsystemmajrelease - \$basearch",
		baseurl => "http://mirrors.aliyun.com/epel/$operatingsystemmajrelease/\$basearch/",
		gpgkey => "http://mirrors.aliyun.com/epel/RPM-GPG-KEY-EPEL-$operatingsystemmajrelease",
		gpgcheck => "1",
		enabled => "1",
	}

	yumrepo { nginx:
		descr => "nginx - $operatingsystem - $operatingsystemmajrelease - \$basearch",
		baseurl => "http://nginx.org/packages/centos/$operatingsystemmajrelease/\$basearch/",
		gpgkey => "http://nginx.org/packages/keys/nginx_signing.key",
		gpgcheck => "1",
		enabled => "1",
	}

	yumrepo { puppetlabs-products:
		descr => "puppetlabs-products - $operatingsystem - $operatingsystemmajrelease - \$basearch",
		baseurl => "http://yum.puppetlabs.com/el/$operatingsystemmajrelease/products/\$basearch/",
		gpgkey => "http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs",
		gpgcheck => "1",
		enabled => "1",
	}

	yumrepo { puppetlabs-deps:
		descr => "puppetlabs-deps - $operatingsystem - $operatingsystemmajrelease - \$basearch",
		baseurl => "http://yum.puppetlabs.com/el/$operatingsystemmajrelease/dependencies/\$basearch/",
		gpgkey => "http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs",
		gpgcheck => "1",
		enabled => "1",
	}

	yumrepo { local:
		descr => "local - $operatingsystem - $operatingsystemmajrelease - \$basearch",
		baseurl => "http://ftp.example.com/pub/rpms/el$operatingsystemmajrelease/",
		gpgcheck => "0",
		enabled => "1",
	}

	if $operatingsystemmajrelease == "7" {
		yumrepo { docker:
			descr => "docker - $operatingsystem - $operatingsystemmajrelease - \$basearch",
			baseurl => "https://yum.dockerproject.org/repo/main/centos/$releasever/",
			gpgkey => "https://yum.dockerproject.org/gpg",
			gpgcheck => "1",
			enabled => "1",
		}
	}
}

class yum {
	include yum::install, yum::config_repo
}
