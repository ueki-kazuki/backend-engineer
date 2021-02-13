#!/bin/sh

export PATH=/usr/bin:/usr/sbin:/bin
[ -f httpd.pid ] && rm httpd.pid
httpd -X -d . -f httpd.conf
