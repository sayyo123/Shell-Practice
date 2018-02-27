#!/bin/bash
if [ "$#" -ne 1 ]; then
	echo "usage ./arping2.sh [xx.txt]"
	echo "example ./arping2.sh /root/Desktop/addr.txt"
	exit
fi

file=$1
for addr in $(cat $file); do
	arping -c 1 $addr | grep "reply" | cut -d" " -f 4
done	
