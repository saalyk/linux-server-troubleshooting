
#!/bin/bash

THRESHOLD=80
LOG_FILE="$HOME/projects/linux-server-troubleshooting/disk-usage.log"

DISK_USAGE=$(df / | awk 'NR==2 {gsub("%","",$5); print $5}')
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

echo "Root filesystem usage: ${DISK_USAGE}%"

if [ "$DISK_USAGE" -ge "$THRESHOLD" ]; then
    WARNING="$TIMESTAMP WARNING: Root filesystem usage is ${DISK_USAGE}% (threshold: ${THRESHOLD}%)"
    echo "$WARNING"
    echo "$WARNING" >> "$LOG_FILE"
else
    echo "OK: Disk usage is below ${THRESHOLD}%."
fi
