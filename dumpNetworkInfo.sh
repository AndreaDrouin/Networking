#This script will print the current date/time, IP, DNS nameserver, and the open ports
#By Andrea Drouin
#3/6/2022
printf "$(date)\n" | tee -a foundNetworkInfo_$(date +%F).txt #prints and appends date and time at top of output
printf "\nIP Address: " | tee -a foundNetworkInfo_$(date +%F).txt #prints and appends label for IP address
ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}' | tee -a foundNetworkInfo_$(date +%F).txt #prints and appends the IP address
printf "\nDNS Information:\n" | tee -a foundNetworkInfo_$(date +%F).txt #prints and appends the label for the DNS info
cat /etc/resolv.conf | grep nameserver | tee -a foundNetworkInfo_$(date +%F).txt #prints and appends the DNS nameservers
printf "\nCurrent Open Ports:\n"| tee -a foundNetworkInfo_$(date +%F).txt #prints and appends the label for current open ports
netstat -tul | grep LISTEN | tee -a foundNetworkInfo_$(date +%F).txt #prints and appends the current open ports


