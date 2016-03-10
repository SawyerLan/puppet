#Use grub-md5-crypt to Encrypt a password in MD5 format

class user {
	user { "root":
		password => '$1$LX7iK$.55AAn9frT9q6xtfIW2GT.',
	}

	user { "$sudo_user":
		uid => $sudo_user_uid,
		gid => "users",
		groups => ["wheel"],
		shell => "/bin/bash",
		managehome => true,
		comment => "Sudo User",
		password => '$1$Hnk1V$exLBHzUtJUbx.M.puB74N/',
	}

	user { "$app_user":
		uid => $app_user_uid,
		shell => "/bin/bash",
		managehome => true,
		comment => "Application User",
		password => '$1$wlU0W$BjdTmUlgj7qllJ//yA.mq1',
	}
}
