echo "CPU Usage: CURRENT"
top -b -n 2 -d 1 | grep '^%Cpu' | tail -1 | awk '{print 100 - $8 "%"}'
echo "CPU Usage: FROM BOOT"
top -b -n 1 | grep '^%Cpu' | awk '{print 100 - $8 "%"}'