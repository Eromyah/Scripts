#!/bin/bash

echo -n "[> Enter audit interval (in seconds)]:"
read -r interval

echo "[+] The warden is online"
echo "[+] Audit interval will be $interval seconds."


while sleep $interval; do
	clear
	echo "==========[ Active Connections ]=========="
	echo
	netstat -anop | egrep EST | awk ' { print $7,$6,$4,$5 } '

	echo
	echo "==========[ Auth.log ]=========="
	echo
	tail /var/log/auth.log
done
