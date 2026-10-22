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

echo ""
echo "3. MEMORY USAGE"
free -h

echo ""
echo "4. SYSTEM UPTIME"
uptime

echo ""
echo "5. RUNNING SERVICES"
systemctl --type=service --state=running --no-pager
