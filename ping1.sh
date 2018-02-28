#!/bin/bash
if [ "$#" -ne 1 ]; then
 echo "usage  ./ping1.sh networkd address"
 echo "example ./ping1.sh 192.168.10.0"
 echo "example will perform an ARP scan of the local subnet to which etho is assigned"
 exit
fi
	
interface=$1
prefix=$(echo $1 | cut -d '.' -f 1-3)
for addr in $(seq 1 254); do
	ping -c 1 $prefix.$addr  | grep from | cut -d " " -f 4 | cut -d":" -f 1
done




