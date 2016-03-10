#!/bin/bash
#check ss estab
#usage: check_ss_estab.sh WARN_VALUE CRIT_VALUE
WARN=$1
CRIT=$2
/usr/sbin/ss -o state established | /usr/bin/wc -l | awk -v WARN=$WARN -v CRIT=$CRIT 'BEGIN{printf "ESTAB "}{if($1>=WARN&&$1<CRIT){printf "Warning"}else if($1>=CRIT){printf "Critical"}else{printf "OK"}}END{print ":",$1,"established"}'
