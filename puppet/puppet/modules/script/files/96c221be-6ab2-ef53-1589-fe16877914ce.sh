#!/bin/sh
[ $# -ne 3 ] && { 
 echo "Usage: sh 96c221be-6ab2-ef53-1589-fe16877914ce.sh IP  SU用户(SU或高权限用户) SU密码";
 exit 1;
}

pathname=`pwd`


perl $pathname/96c221be-6ab2-ef53-1589-fe16877914ce.pl "${1}" "${2}" "${3}"
