#!/bin/bash
if [ "$#" -ne 1 ]; then
	echo "usage /ping2.sh [network address]"
	echo "example ./ping2.sh 172.16.33.0"
	exit
fi

prefix=$(echo $1 | cut -d '.' -f 1-3)
for addr in $(seq 1 254); do
	hping3 $prefix.$addr  -c 1 >> temp.txt
done
grep ^len temp.txt | cut -d " " -f 5 | cut -d "=" -f 2 >>output.txt
rm temp.txt
