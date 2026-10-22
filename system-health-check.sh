#!/bin/bash

echo "================================"
echo "     LINUX SYSTEM HEALTH CHECK"
echo "================================"

echo ""
echo "1. CURRENT DATE AND TIME"
date

echo ""
echo "2. DISK USAGE"
df -h /

DISK_USAGE=$(df / | awk 'NR==2 {gsub("%","",$5); print $5}')

if [ "$DISK_USAGE" -ge 80 ]; then
    echo "WARNING: Disk usage is at ${DISK_USAGE}%"
else
    echo "OK: Disk usage is at ${DISK_USAGE}%"
fi

echo ""
echo "3. MEMORY USAGE"
free -h

echo ""
echo "4. SYSTEM UPTIME"
uptime

echo ""
echo "5. RUNNING SERVICES"
systemctl --type=service --state=running --no-pager
