#!env perl
#Author: autoCreated
my $para_num = "2";
my $template_time = "2015-01-07 14:48:28";
my %para;
@array_pre_flag = ();
@array_appendix_flag = ();

$para{Linux_su_user} = $ARGV[1];
$para{Linux_su_password} = $ARGV[2];


$pre_cmd{12848} = "cat \"/etc/security/limits.conf\"";
$pre_cmd{19188} = "ls -al /etc/inetd.conf";
$pre_cmd{21369} = "ls -al /etc/rc6.d/";
$pre_cmd{21182} = "ls -al /etc/rc5.d/";
$pre_cmd{21921} = "ls -al /etc/rc4.d/";
$pre_cmd{19297} = "ls -al /etc/shadow";
$pre_cmd{19816} = "ls -al /etc/passwd";
$pre_cmd{21234} = "ls -al /tmp";
$pre_cmd{13945} = "cat \"/etc/ssh/sshd_config\"";
$pre_cmd{12448} = "cat \"/etc/security/limits.conf\"";
$pre_cmd{32078} = "if [ -s /etc/pam.d/system-auth ];then cat /etc/pam.d/system-auth|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/common-password ];then cat /etc/pam.d/common-password|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/passwd ];then cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\";fi";
$pre_cmd{32452} = "if [ -s /etc/pam.d/system-auth ];then cat /etc/pam.d/system-auth|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/common-password ];then cat /etc/pam.d/common-password|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/passwd ];then cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\";fi";
$pre_cmd{27888} = "netstat -an | grep \"[\\:\\.]23\\b\"";
$pre_cmd{27526} = "ps -ef | grep ssh";
$pre_cmd{62738} = "unset ret_1 ret_2;
if [ -f /etc/ssh/sshd_config ];then ret_1=`cat /etc/ssh/sshd_config | grep -v \"^[[:space:]]*#\" | grep \"Protocol\" | grep \"1\"`;if [ -z \"\$ret_1\" ];then ret_2=`cat /etc/ssh/sshd_config | grep -v \"^[[:space:]]*#\" | grep \"PermitRootLogin\" | grep -E \"no|NO\"`;if [ -n \"\$ret_2\" ];then echo \"ret:valid\";else echo \"ret:PermitRootLogin invalid\";fi;else echo \"ret:Protocol invalid\";fi;elif [ -f /etc/ssh2/sshd2_config ];then ret_1=`cat /etc/ssh/sshd_config | grep -v \"^[[:space:]]*#\" | grep \"Protocol\" | grep \"1\"`;if [ -z \"\$ret_1\" ];then ret_2=`cat /etc/ssh/sshd_config | grep -v \"^[[:space:]]*#\" | grep \"PermitRootLogin\" | grep -E \"no|NO\"`;if [ -n \"\$ret_2\" ];then echo \"ret:valid\";else echo \"ret:PermitRootLogin invalid\";fi;else echo \"ret:Protocol invalid\";fi;else echo \"ret:valid\";fi
unset ret_1 ret_2;";
$pre_cmd{20520} = "cat /etc/profile | grep -v \"^[[:space:]]*#\" | grep \"TMOUT[[:space:]]*=[[:space:]]*[0-9]*\" | grep -v \"export\" | sed 's/[^0-9]//g'
cat /etc/profile | grep -v \"^[[:space:]]*#\" | grep \"export[[:space:]]*TMOUT[[:space:]]*=[[:space:]]*[0-9]*\" | sed 's/[^0-9]//g'";
$pre_cmd{32465} = "if [ -s /etc/pam.d/system-auth ];then cat /etc/pam.d/system-auth|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/common-password ];then cat /etc/pam.d/common-password|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/passwd ];then cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\";fi";
$pre_cmd{32529} = "if [ -s /etc/pam.d/system-auth ];then cat /etc/pam.d/system-auth|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/common-password ];then cat /etc/pam.d/common-password|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/passwd ];then cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\";fi";
$pre_cmd{13192} = "cat \"/etc/pam.d/login\"";
$pre_cmd{30294} = "if [ -f /etc/syslog.conf ];then cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | grep -E '[[:space:]]*.+@.+';fi";
$pre_cmd{63398} = "if [ -s /etc/syslog-ng/syslog-ng.conf ];then ret_1=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"port(514)\"`;if [ -n \"\$ret_1\" ];then ret_2=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"destination(logserver)\"`;fi;fi
if [ -n \"\$ret_2\" ];then echo \"ret:set\";else echo \"ret:none\";fi";
$pre_cmd{19998} = "if [ -f /etc/rsyslog.conf ];then cat /etc/rsyslog.conf | grep -v \"[[:space:]]*#\" | grep -E '[[:space:]]*.+@.+';fi";
$pre_cmd{32629} = "find / -maxdepth 3 -name .netrc 2>/dev/null";
$pre_cmd{32468} = "find / -maxdepth 3 -name .rhosts 2>/dev/null";
$pre_cmd{38719} = "if [ -s /etc/pam.d/system-auth ];then red_ret=`cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep \"auth[[:space:]]*required[[:space:]]*pam_tally.so[[:space:]]*deny=10[[:space:]]*unlock_time=[0-9]*\"`;fi
if [ -s /etc/pam.d/system-auth ];then red_ret2=`cat /etc/pam.d/system-auth | grep -v \"[[:space:]]*#\" | grep \"account[[:space:]]*required[[:space:]]*pam_tally.so\"`;fi
if [ -s /etc/pam.d/common-password ];then suse_ret=`cat /etc/pam.d/common-password | grep -v \"[[:space:]]*#\" | grep \"auth[[:space:]]*required[[:space:]]*pam_tally.so[[:space:]]*deny=10[[:space:]]*unlock_time=[0-9]*\"`;fi
if [ -s /etc/pam.d/common-password ];then suse_ret2=`cat /etc/pam.d/common-password | grep -v \"[[:space:]]*#\" | grep \"account[[:space:]]*required[[:space:]]*pam_tally.so\"`;fi
if [ -s /etc/pam.d/passwd ];then suse_ret3=`cat /etc/pam.d/passwd | grep -v \"[[:space:]]*#\" | grep \"auth[[:space:]]*required[[:space:]]*pam_tally.so[[:space:]]*deny=10[[:space:]]*unlock_time=[0-9]*\"`;fi
if [ -s /etc/pam.d/passwd ];then suse_ret4=`cat /etc/pam.d/passwd | grep -v \"[[:space:]]*#\" | grep \"account[[:space:]]*required[[:space:]]*pam_tally.so\"`;fi
if [[ -n \"\$red_ret\" && -n \"\$red_ret2\" ]];then echo \"redhat:valid\";elif [[ -n \"\$suse_ret\" && -n \"\$suse_ret2\" ]];then echo \"suse:valid\";elif [[ -n \"\$suse_ret3\" && -n \"suse_ret4\" ]];then echo \"suse2:valid\";else echo \"not value\";fi";
$pre_cmd{41242} = "unset red_ret suse_ret suse_ret2 suse_ret3;
if [ -s /etc/syslog.conf ];then red_ret=`cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | grep \"authpriv.\\*[[:space:]]*.*\"`;fi
if [ -s /etc/rsyslog.conf ];then red_ret2=`cat /etc/rsyslog.conf | grep  -v \"^[[:space:]]*#\" | grep \"authpriv.\\*[[:space:]]*.*\"`;fi
if [ -s /etc/syslog-ng/syslog-ng.conf ];then suse_ret=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"facility(authpriv)\" | grep \"filter\" | grep \"f_secure\" | awk '{print \$2}'`;if [ -n \"\$suse_ret\" ];then suse_ret2=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"destination\" | grep \"/var/log/secure\"`; if [ -n \"\$suse_ret2\" ];then suse_ret3=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"log\" | grep \"\$suse_ret\"`;fi;fi;fi
if [ -n \"\$red_ret\" ];then echo \"redhat-suse:valid\";elif [ -n \"\$red_ret2\" ];then echo \"red-hat6:valid\";elif [ -n \"\$suse_ret3\" ];then echo \"suse:valid\";else echo \"ret:no value\";fi
unset red_ret suse_ret suse_ret2 suse_ret3;";
$pre_cmd{48436} = "ps ax | grep -E 'chargen-dgram|daytime-stream|echo-streamklogin|tcpmux-server|chargen-stream|discard-dgram|eklogin|krb5-telnet|tftp|cvs|discard-stream|ekrb5-telnet|kshell|time-dgram|daytime-dgram|echo-dgram|gssftp|rsync|time-stream' | grep -v \"grep -E chargen-dgram|daytime-stream\"";
$pre_cmd{51974} = "unset ret;
ret=`find /usr/bin/chage /usr/bin/gpasswd /usr/bin/wall /usr/bin/chfn /usr/bin/chsh /usr/bin/newgrp /usr/bin/write /usr/sbin/usernetctl /usr/sbin/traceroute /bin/mount /bin/umount /bin/ping /sbin/netreport -type f -perm +6000 2>/dev/null`;
echo \$ret;
if [ -n \"\$ret\" ];then echo \"ret:exist invalid files\";else echo \"ret:all files valid\";fi;
unset ret;";
$pre_cmd{21415} = "ls -al /etc/rc2.d/";
$pre_cmd{21999} = "ls -al /etc/rc3.d/";
$pre_cmd{19841} = "ls -al /etc/ssh/ssh_host_rsa_key";
$pre_cmd{19805} = "ls -al /etc/ssh/ssh_host_dsa_key";
$pre_cmd{19249} = "ls -al /etc/group";
$pre_cmd{19179} = "ls -al /etc/services";
$pre_cmd{21157} = "ls -al /etc/rc0.d/";
$pre_cmd{21554} = "ls -al /etc/rc1.d/";
$pre_cmd{21249} = "ls -al /etc/";
$pre_cmd{21574} = "ls -al /etc/rc.d/init.d/";
$pre_cmd{1049} = "cat \"/etc/login.defs\"";
$pre_cmd{3346} = "cat \"/etc/login.defs\"";
$pre_cmd{4482} = "cat \"/etc/login.defs\"";
$pre_cmd{5243} = "cat /etc/shadow | awk 'BEGIN{FS=\":\";ORS=\",\"}{if(\$2==\"\")print \$1};' | more";
$pre_cmd{6954} = "cat /etc/passwd | awk 'BEGIN{FS=\":\";ORS=\",\"}{if(\$1~/^[[:space:]]*[^#]/)if(\$1!=\"root\")if(\$3==\"0\")print \$1}'";
$pre_cmd{7991} = "echo \$PATH";
$pre_cmd{10924} = "cat /etc/profile | grep -v \"^[[:space:]]*#\"";
$pre_cmd{10436} = "cat /etc/csh.login | grep -v \"^[[:space:]]*#\"";
$pre_cmd{10348} = "cat /etc/csh.cshrc | grep -v \"^[[:space:]]*#\"";
$pre_cmd{10890} = "if [ -s /etc/bashrc ];then cat /etc/bashrc | grep -v \"[[:space:]]*#\";elif [ -s /etc/bash.bashrc ];then cat /etc/bash.bashrc | grep -v \"[[:space:]]*#\";fi";

push(@array_pre_flag, 12848);
push(@array_pre_flag, 19188);
push(@array_pre_flag, 21369);
push(@array_pre_flag, 21182);
push(@array_pre_flag, 21921);
push(@array_pre_flag, 19297);
push(@array_pre_flag, 19816);
push(@array_pre_flag, 21234);
push(@array_pre_flag, 13945);
push(@array_pre_flag, 12448);
push(@array_pre_flag, 32078);
push(@array_pre_flag, 32452);
push(@array_pre_flag, 27888);
push(@array_pre_flag, 27526);
push(@array_pre_flag, 62738);
push(@array_pre_flag, 20520);
push(@array_pre_flag, 32465);
push(@array_pre_flag, 32529);
push(@array_pre_flag, 13192);
push(@array_pre_flag, 30294);
push(@array_pre_flag, 63398);
push(@array_pre_flag, 19998);
push(@array_pre_flag, 32629);
push(@array_pre_flag, 32468);
push(@array_pre_flag, 38719);
push(@array_pre_flag, 41242);
push(@array_pre_flag, 48436);
push(@array_pre_flag, 51974);
push(@array_pre_flag, 21415);
push(@array_pre_flag, 21999);
push(@array_pre_flag, 19841);
push(@array_pre_flag, 19805);
push(@array_pre_flag, 19249);
push(@array_pre_flag, 19179);
push(@array_pre_flag, 21157);
push(@array_pre_flag, 21554);
push(@array_pre_flag, 21249);
push(@array_pre_flag, 21574);
push(@array_pre_flag, 1049);
push(@array_pre_flag, 3346);
push(@array_pre_flag, 4482);
push(@array_pre_flag, 5243);
push(@array_pre_flag, 6954);
push(@array_pre_flag, 7991);
push(@array_pre_flag, 10924);
push(@array_pre_flag, 10436);
push(@array_pre_flag, 10348);
push(@array_pre_flag, 10890);


$appendix_cmd{11} = "lastb -100 2>/dev/null";$appendix_cmd{6} = "chkconfig --list | head -50";$appendix_cmd{17} = "cat /etc/vsftpd/chroot_list 2>/dev/null | grep \"^[[:space:]]*[^#]\" | head -300";$appendix_cmd{10} = "df -m 2>/dev/null";$appendix_cmd{7} = "ifconfig -a 2>/dev/null";$appendix_cmd{8} = "last -100 2>/dev/null";$appendix_cmd{12} = "(head -20 /var/log/syslog;head -20 /var/log/messages) 2>/dev/null";$appendix_cmd{21} = "rpm -qa | head -100";$appendix_cmd{0} = "uname -a 2>/dev/null";$appendix_cmd{1} = "cat /etc/passwd 2>/dev/null | head -300";$appendix_cmd{9} = "if [ -f /etc/syslog.conf ];then cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | head -300;elif [ -f /etc/syslog-ng/syslog-ng.conf ];then cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\"  | head -300;elif [ -f /etc/rsyslog.conf ];then cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\"  | head -300;fi";$appendix_cmd{16} = "cat /etc/vsftpd/vsftpd.conf 2>/dev/null | grep \"^[[:space:]]*ftpd_banner\" | head -300";$appendix_cmd{22} = "version=`lsb_release -a 2>/dev/null | grep \"Description\" | awk -F: '{print \$2}'`;if [ -n \"\$version\" ];then echo \$version;else if [ -z \"\$version\" ]; then echo \"\";else cat /etc/SuSE-release | grep -v \"VERSION\" | grep -v \"PATCHLEVEL\";fi;fi";$appendix_cmd{3} = "cat  /etc/shadow 2>/dev/null | head -300";$appendix_cmd{14} = "netstat -anp 2>/dev/null | head -300";$appendix_cmd{5} = "cat  /etc/securetty 2>/dev/null | head -300";$appendix_cmd{2} = "cat  /etc/group 2>/dev/null | head -300";$appendix_cmd{19} = "cat /etc/ftpaccess 2>/dev/null | grep \"^[[:space:]]*banner[[:space:]]*\\/.*\" | awk '{print \$2}' | while read user; do cat \$user;done | grep -v \"^[[:space:]]*#\" | head -300";$appendix_cmd{20} = "cat /etc/ftpaccess 2>/dev/null | grep -v \"^[[:space:]]*#\" | head -300";$appendix_cmd{15} = "if [ -z $para{Linux_su_password} ];then ps -ef | head -300;else ps -ef |  grep -v $para{Linux_su_password} | head -300;fi";$appendix_cmd{4} = "if [ -f /etc/shadow ];then lsattr /etc/shadow 2>/dev/null;fi;
if [ -f /etc/gshadow ];then lsattr /etc/group 2>/dev/null;fi;
if [ -f /etc/passwd ];then lsattr /etc/passwd 2>/dev/null;fi";
push(@array_appendix_flag, 11);
push(@array_appendix_flag, 6);
push(@array_appendix_flag, 17);
push(@array_appendix_flag, 10);
push(@array_appendix_flag, 7);
push(@array_appendix_flag, 8);
push(@array_appendix_flag, 12);
push(@array_appendix_flag, 21);
push(@array_appendix_flag, 0);
push(@array_appendix_flag, 1);
push(@array_appendix_flag, 9);
push(@array_appendix_flag, 16);
push(@array_appendix_flag, 22);
push(@array_appendix_flag, 3);
push(@array_appendix_flag, 14);
push(@array_appendix_flag, 5);
push(@array_appendix_flag, 2);
push(@array_appendix_flag, 19);
push(@array_appendix_flag, 20);
push(@array_appendix_flag, 15);
push(@array_appendix_flag, 4);

sub get_os_info{
 my %os_info = (
 "hostname"=>"","osname"=>"","osversion"=>"");
 $os_info{"hostname"} = `uname -n`;
 $os_info{"osname"} = `uname -s`;
 $os_info{"osversion"} = `uname -r`;
foreach (%os_info){   chomp;}
return %os_info;}

sub add_item{
 my ($string, $flag, $command, $value)= @_;
 $string .= "\t\t".'<item flag="'.$flag.'">'."\n";
 $string .= "\t\t\t".'<cmd info="'.$date.'">'."\n";
 $string .= "\t\t\t<command><![CDATA[".$command."]]></command>\n";
 $string .= "\t\t\t<value><![CDATA[".$value."]]></value>\n";
 $string .= "\t\t\t</cmd>\n";
 $string .= "\t\t</item>\n";
return $string;}
 sub generate_xml{
 $ARGC = @ARGV;
if($ARGC lt 3){
 print qq{usag:uuid.pl IP  SU用户(SU或高权限用户) SU密码};
exit;}
my %os_info = get_os_info();
 my $os_name = $os_info{"osname"};
 my $host_name = $os_info{"hostname"};
 my $os_version = $os_info{"osversion"};
 my $date = `date +%y-%m-%d`;
 chomp $date;
 my $ipaddr = $ARGV[0];
 my $xml_string = "";
 $xml_string .='<?xml version="1.0" encoding="UTF-8"?>'."\n";
 $xml_string .= '<result uuid= "'.'96c221be-6ab2-ef53-1589-fe16877914ce'.'" ip="'.$ipaddr.'" template_time= "2015-01-07 14:48:28'.'">'."\n";
 $xml_string .= "\t".'<initcmd>'."\n";
 $xml_string .= "\t\t".'<cmd info="'.$date.'">';
 $xml_string .= '</cmd>'."\n";
 $xml_string .= "\t\t\t".'<command><![CDATA[ ]]></command>'."\n";
 $xml_string .= "\t\t\t".'<value><![CDATA[ ]]></value>'."\n";
 $xml_string .= "\t".'</initcmd>'."\n";
 $xml_string .= "\t".'<security type="auto">'."\n";
 foreach $key (@array_pre_flag){
 $value = $pre_cmd{$key};
 my $tmp_result = `$value`;
 chomp $tmp_result;
 $tmp_result =~ s/>/&gt;/g;
 $xml_string = &add_item( $xml_string, $key, $value, $tmp_result );}
 $xml_string .= "\t</security>\n";
 $xml_string .= "\t".'<security type="display">'."\n";
 foreach $key (@array_appendix_flag){
 $value = $appendix_cmd{$key};
 my $tmp_result = `$value`;
 chomp $tmp_result;
 $tmp_result =~ s/>/&gt;/g;
 $xml_string = &add_item( $xml_string, $key, $value, $tmp_result );}
 $xml_string .= "\t"."</security>"."\n";
 $xml_string .= "</result>"."\n";
 $xmlfile = $ipaddr."_"."96c221be-6ab2-ef53-1589-fe16877914ce"."_chk.xml";
 print $xmlfile."\n";
 open XML,">/tmp/".$xmlfile or die "Cannot create ip.xml:$!";
 print XML $xml_string;
 print "end write xml\n";
 print "DONE ALL\n";}
 generate_xml();
