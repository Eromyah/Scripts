#!/bin/python3

import sys 
import socket
from datetime import datetime

#Define our target
if len(sys.argv) == 2:
    target = socket.gethostbyname(sys.argv[1]) #Translate hostname to IPv4
else:
    print("Invalid amount of arguments.")
    print("Syntax: python3 scanner.py <ip>")

#Banner
print("-" * 50)
print("Scanning target "+ target)
print("Time Started: "+ str(datetime.now()))
print("-" * 50)

try:
    for port in range(50,85):
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM) #Im using ipv4 and a port
        socket.setdefaulttimeout(1) #Attempt to connect for one second and if not move on
        result = s.connect_ex((target,port)) #returns a error indicator
        if result == 0: #if the port is open it will output a 0 if it is not it will output a 1
            print("Port {} is open".format(port))
        s.close()

except  KeyboardInterrupt: #if i hit ctrl c it will exit the program
    print("\nExiting program.")
    sys.exit()

except socket.gaierror: #no host name resolution exit
    print("Hostname could not be resolved.")
    sys.exit()

except socket.error: #if we cant connect it will exit
    print("Could not connect to server.")
    sys.exit()
