for ip in $(seq 1 5); do
        ping -c 1 172.18.0.$ip > /dev/null & echo "Online: 172.18.0.$ip";
done

#what this does is it will ping the ip address and if it recevies a error it will not reach the & but if it does not error it will continue on and print out a success
#replace my 172.18.0 with your correct subnet address
