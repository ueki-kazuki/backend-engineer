#!/bin/sh

[ -f httpd.pid ] && rm httpd.pid
httpd -X -d . -f httpd.conf
