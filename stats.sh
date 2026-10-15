#!/bin/bash

CURRENT=$(top -b -n 2 -d 1 | grep '^%Cpu' | tail -1 | awk '{print 100 - $8 "%"}')
BOOT=$(top -b -n 1 | grep '^%Cpu' | awk '{print 100 - $8 "%"}')

echo "-------------"
echo "| CPU Usage |"
echo "-------------"
echo "Boot: ${BOOT} - Current: ${CURRENT} "

echo "----------"
echo "| Memory |"
echo "----------"
free -h | grep Mem | awk '{print "Used: " $3 " - Available: " $7}'

echo "--------------"
echo "| Disk Usage |"
echo "--------------"
df -h --total | grep total | awk '{print "Used: " $3 " - Available: " $4 " - Percent Available: " $5}'

echo "---------------------------------"
echo "| Top Processes by Memory Usage |"
echo "---------------------------------"
ps aux --sort -%mem | head -n 6 | awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $11}'

echo "------------------------------"
echo "| Top Processes by CPU Usage |"
echo "------------------------------"
ps aux --sort -%cpu | head -n 6 | awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $11}'
