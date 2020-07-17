for port in 22 25 80 443 8080 8443; do                                                                             
        (echo scanning > /dev/tcp/172.19.0.3/$port && echo "open - $port") 2> /dev/null                            
done 

#this will scan the specific ports
