#!/bin/sh
#check jar status
#usage: check_jar_status.sh jarname

jar_status=`ps -ef |grep $1 |grep -v "grep"|grep -v $0|wc -l`

if [ $jar_status -eq 1 ]
then
    echo "$1 OK: $jar_status processes"
elif [ $jar_status -eq 0 ]
then
    echo "$1 Critical: $jar_status processes"
else
    echo "$1 Warning: $jar_status processes"
fi
