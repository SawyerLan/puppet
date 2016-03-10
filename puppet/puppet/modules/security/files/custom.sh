# Managed by class security
# Do NOT modify this file directly, THx.
umask 027
TMOUT=600
HISTSIZE=50
HISTTIMEFORMAT='%F %T '
HISTFILESIZE=50

if [ $USER = "root" ]; then
	umask 022
fi

if [ $USER = "oracle" ] || [ $USER = "grid" ]; then
    if [ $SHELL = "/bin/ksh" ]; then
        ulimit -p 16384
        ulimit -n 65536
    else
        ulimit -u 16384 -n 65536
    fi
    umask 022
fi
