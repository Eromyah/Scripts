import requests

domain = input("[>] Enter domain to check: ")
print(requests.get("http://api.hackertarget.com/hostsearch/?q="+domain).text)
