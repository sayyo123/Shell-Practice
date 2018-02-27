#!/bin/bash
if [ "$#" -ne 1 ]; then
	echo "usage ./dnsbla.sh [xxx.com]"
	echo "example ./arping.sh sina.com"
	exit
fi

k=$1
txt1=$(dpkg -L fierce | grep hosts.txt)
fierce  -dnsserver 8.8.8.8 -dns $k -wordlist $txt1

