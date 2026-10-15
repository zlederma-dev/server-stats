#!/bin/bash
echo "CPU Usage: CURRENT"
top -b -n 2 -d 1 | grep '^%Cpu' | tail -1 | awk '{print 100 - $8 "%"}'
echo "CPU Usage: FROM BOOT"
top -b -n 1 | grep '^%Cpu' | awk '{print 100 - $8 "%"}'
echo "Memory"
free -h | grep Mem | awk '{print "Used: " $3 " Available: " $7}'
echo "Disk Usage"
df -h --total | grep total | awk '{print "Used: " $3 " | Available: " $4 " | Percent Available: " $5}'
echo "Top 5 Processes by Memory Usage"
ps aux --sort -%mem | head -n 6 | awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $11}'
echo "Top 5 Processes by CPU Usage"
ps aux --sort -%cpu | head -n 6 | awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $11}'
