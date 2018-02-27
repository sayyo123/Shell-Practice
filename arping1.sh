#!/bin/bash
if [ "$#" -ne 1 ]; then
 echo "usage  ./arping.sh [interface]"
 echo "example ./arping.sh eth0"
 echo "example will perform an ARP scan of the local subnet to which etho is assigned"
 exit
fi
	
interface=$1
prefix=$(ifconfig $interface | grep 'inet ' | cut -d'e' -f 2 | cut -d't' -f 2 | cut -d'n' -f 1 | cut -d'.' -f 1-3 | cut -d' ' -f 2)
for addr in $(seq 1 254); do
 arping -c 1 $prefix.$addr | grep "reply" | cut -d" " -f 4
done




