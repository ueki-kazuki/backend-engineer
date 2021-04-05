#!/bin/sh

export PATH=/usr/local/bin:/usr/bin:/usr/sbin:/bin
[ -f httpd.pid ] && rm httpd.pid
httpd -DNO_DETACH -DFOREGROUND -d . -f httpd.conf