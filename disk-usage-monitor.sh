#!/bin/bash

THRESHOLD=80
LOG_FILE="$HOME/projects/linux-server-troubleshooting/disk-usage.log"

# Check disk usage
DISK_OUTPUT=$(df /) || {
    echo "ERROR: Unable to retrieve disk usage."
    exit 1
}

DISK_USAGE=$(awk 'NR==2 {gsub("%","",$5); print $5}' <<< "$DISK_OUTPUT")

# Validate disk usage
if [[ ! "$DISK_USAGE" =~ ^[0-9]+$ ]]; then
    echo "ERROR: Invalid disk usage value."
    exit 1
fi

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

echo "Root filesystem usage: ${DISK_USAGE}%"

# Check threshold
if (( DISK_USAGE >= THRESHOLD )); then
    WARNING="$TIMESTAMP WARNING: Root filesystem usage is ${DISK_USAGE}% (threshold: ${THRESHOLD}%)"

    echo "$WARNING"

    if ! echo "$WARNING" >> "$LOG_FILE"; then
        echo "ERROR: Unable to write to log file."
        exit 1
    fi
else
    echo "OK: Disk usage is below ${THRESHOLD}%."
fi

exit 0
