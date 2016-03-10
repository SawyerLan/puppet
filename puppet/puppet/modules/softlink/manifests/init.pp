class softlink {
	file { ["/home/$app_user/website", "/home/$app_user/website/static"]:
		ensure => directory,
		owner => "$app_user",
		mode => 0640,
		require => User["$app_user"],
	}

	define linkResource {
		file { "/home/$app_user/website/static/$name":
			ensure => link,
			force => true,
			target => "/home/$app_user/storage/static/$name",
			require => File["/home/$app_user/website/static"],
		}
	}
	$linkName = ["android", "catimagepath", "cydsuploadImage", "default", "feedback", "ios", "ipad", "iphone", "news", "richcms", "tmp", "Tpl", "uploadpath", "user", "qr", "warcraft"]
	linkResource { $linkName: }
}
