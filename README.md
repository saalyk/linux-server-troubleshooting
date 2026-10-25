This project documents practical Linux administration commands and troubleshooting procedures for common server issues.

## Objectives
- Practice essential Linux commands.
- Understand system resource monitoring.
- Investigate disk space and memory usage.
- Learn basic service and network troubleshooting.
- Document problems, diagnostic steps, and solutions.

## Environment
- OS: Ubuntu 22.04 LTS
- Platform: WSL2 on Windows
- Shell: Bash

## Topics Covered
1. System information and uptime
2. CPU and memory usage
3. Disk space troubleshooting
4. File and directory permissions
5. Process management
6. Network connectivity checks
7. Service troubleshooting

## Disclaimer
All exercises are performed in a local learning environment. No production systems are modified.

## Progress
This project is under active development. Each topic will include commands, sample outputs, and troubleshooting notes.

## Bash Automation: System Health Check

Created a Bash script to automate basic Linux system health checks.

### Information Collected
- Current date and time
- Root filesystem disk usage
- Memory and swap usage
- System uptime and load average
- Running systemd services

### How to Run

```bash
chmod +x system-health-check.sh
./system-health-check.sh
```

### Skills Practiced
- Bash scripting
- Linux system monitoring
- Command-line automation
- Git and GitHub version control

## Bash Automation: Disk Usage Monitor

Created a Bash script to monitor root filesystem disk usage and log warnings when usage reaches or exceeds 80%.

### Features
- Checks root filesystem disk usage.
- Uses an 80% warning threshold.
- Displays a warning with a timestamp when the threshold is reached.
- Appends warnings to `disk-usage.log` for later review.

### How to Run

```bash
chmod +x disk-usage-monitor.sh
./disk-usage-monitor.sh


```

### Skills Practiced
- Bash scripting and conditional logic
- Linux disk monitoring
- Log file management
- Testing warning conditions
