#! /bin/bash
###START
echo '# Managed by class iptables
# Do NOT modify this file directly, THx.
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
#base
-A INPUT -i lo -j ACCEPT
-A INPUT -m state --state INVALID -j DROP
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
-A INPUT -p icmp -m icmp --icmp-type 0 -j ACCEPT
-A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT'

###INNER
echo '#telnetd(tcp23), named(53), portmap(111), ntpd(123), xinetd-rsync(tcp873), oracle(tcp1521), puppet-dashboard(tcp3000), mysqld(tcp3306), puppetmaster(tcp8140)'
INNER_TCP_DPORTS1='23,53,111,123,873,1521,3000,3306,8140'
INNER_UDP_DPORTS1='53,111,123'
echo '#http(tcp80,443), nfs(2049:2052), tomcat(tcp8080:8089), zabbix(tcp10050:10051), pvcsvr(tcp10080:10081), memcached(11210:11212,22122), passive_ftp(tcp50000:50020)'
INNER_TCP_DPORTS2='80,443,2049:2052,8080:8089,10050:10051,10080:10081,11210:11212,22122,50000:50020'
INNER_UDP_DPORTS2='2049:2052,11210:11212'

for inner in `cat INNER`
do
	echo "-A INPUT -p tcp -s $inner -m multiport --dports $INNER_TCP_DPORTS1 -j ACCEPT"
	echo "-A INPUT -p udp -s $inner -m multiport --dports $INNER_UDP_DPORTS1 -j ACCEPT"
	echo "-A INPUT -p tcp -s $inner -m multiport --dports $INNER_TCP_DPORTS2 -j ACCEPT"
	echo "-A INPUT -p udp -s $inner -m multiport --dports $INNER_UDP_DPORTS2 -j ACCEPT"
done

###OUTER
echo '#snmpd(udp161), nrpe(tcp5666)'
OUTER_TCP_DPORTS1='5666'
OUTER_UDP_DPORTS1='161'
for outer in `cat OUTER`
do
	echo "-A INPUT -p tcp -s $outer -m multiport --dports $OUTER_TCP_DPORTS1 -j ACCEPT"
	echo "-A INPUT -p udp -s $outer -m multiport --dports $OUTER_UDP_DPORTS1 -j ACCEPT"
done

###END
echo '#nginx(tcp8800:8809)
-A INPUT -p tcp -m multiport --dports 8800:8809 -j ACCEPT
#reject all
-A INPUT -j REJECT --reject-with icmp-host-prohibited
COMMIT'
