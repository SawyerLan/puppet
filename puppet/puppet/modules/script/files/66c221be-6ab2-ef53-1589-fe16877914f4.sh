#!/bin/sh
[ $# -ne 3 ] && { 
 echo "Usage: sh 66c221be-6ab2-ef53-1589-fe16877914f4.sh IP  SU用户(SU或高权限用户) SU密码";
 exit 1;
}

pathname=`pwd`


echo "touch /tmp/nsfocus_mod_tmp;">/tmp/nsfocus_grub_tmp
echo "chmod 777 /tmp/nsfocus_mod_tmp;">>/tmp/nsfocus_grub_tmp
echo "if [ -f \"/etc/grub.conf\" ];then">>/tmp/nsfocus_grub_tmp
echo "    grub_mod=\`ls -l /etc/grub.conf | grep 'l[r-][w-][x-]'\`;">>/tmp/nsfocus_grub_tmp
echo "    if [ -z \"\$grub_mod\" ];then">>/tmp/nsfocus_grub_tmp
echo "        grub_mod=\`ls -l /etc/grub.conf\`;">>/tmp/nsfocus_grub_tmp
echo "        chmod --reference=/etc/grub.conf /tmp/nsfocus_mod_tmp;">>/tmp/nsfocus_grub_tmp
echo "    else">>/tmp/nsfocus_grub_tmp
echo "        grub_mod=\`ls -l /boot/grub/grub.conf\`;">>/tmp/nsfocus_grub_tmp
echo "        chmod --reference=/boot/grub/grub.conf /tmp/nsfocus_mod_tmp;">>/tmp/nsfocus_grub_tmp
echo "    fi">>/tmp/nsfocus_grub_tmp
echo "elif [ -f \"/boot/grub/grub.conf\" ];then">>/tmp/nsfocus_grub_tmp
echo "    grub_mod=\`ls -l /boot/grub/grub.conf\`;">>/tmp/nsfocus_grub_tmp
echo "    chmod --reference=/boot/grub/grub.conf /tmp/nsfocus_mod_tmp;">>/tmp/nsfocus_grub_tmp
echo "elif [ -f \"/etc/lilo.conf\" ];then">>/tmp/nsfocus_grub_tmp
echo "    grub_mod=\`ls -l /etc/lilo.conf\`;">>/tmp/nsfocus_grub_tmp
echo "    chmod --reference=/etc/lilo.conf /tmp/nsfocus_mod_tmp;">>/tmp/nsfocus_grub_tmp
echo "fi">>/tmp/nsfocus_grub_tmp
sh /tmp/nsfocus_grub_tmp
perl $pathname/66c221be-6ab2-ef53-1589-fe16877914f4.pl "${1}" "${2}" "${3}"
