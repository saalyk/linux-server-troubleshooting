#!/bin/bash

check_disk_usage() {
    local DISK_USAGE="$1"

    if [ "$DISK_USAGE" -ge 80 ]; then
        echo "WARNING: Disk usage is at ${DISK_USAGE}%"
    else
        echo "OK: Disk usage is at ${DISK_USAGE}%"
    fi
}

echo "Test 1: Disk usage at 3%"
check_disk_usage 3

echo ""
echo "Test 2: Disk usage at 85%"
check_disk_usage 85

echo ""
echo "Test 3: Disk usage at 80%"
check_disk_usage 80
