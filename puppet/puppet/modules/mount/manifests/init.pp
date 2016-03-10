class mount {
	file { "/home/$app_user/storage":
		ensure => 'directory',
		owner => "$app_user",
		require => User["$app_user"],
	}

	file { "/home/$app_user/storage/data":
		ensure => 'directory',
		owner => "$app_user",
		require => User["$app_user"],
	}

	mount { "/home/$app_user/storage/data":
		ensure  => 'mounted',
		device  => '10.101.1.70:/home/mmport/storage/data',
		dump => '0',
		fstype => 'nfs',
		options => 'defaults',
		pass => '0',
		require => File["/home/$app_user/storage/data"],
	}

	file { "/home/$app_user/storage/static":
		ensure => 'directory',
		owner => "$app_user",
		require => User["$app_user"],
	}

	mount { "/home/$app_user/storage/static":
		ensure  => 'mounted',
		device  => '10.101.1.70:/home/mmport/storage/static',
		dump => '0',
		fstype => 'nfs',
		options => 'defaults',
		pass => '0',
		require => File["/home/$app_user/storage/static"],
	}
}
