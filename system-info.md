# Linux System Information

## Objective
Collect basic system information to understand the Linux environment before troubleshooting an issue.

## 1. Check Operating System
Command:

```bash
cat /etc/os-release
```

Purpose: Displays the Linux distribution and version.

## 2. Check Kernel Version
Command:

```bash
uname -r
```

Purpose: Displays the running Linux kernel version.

## 3. Check System Uptime
Command:

```bash
uptime
```

Purpose: Shows how long the system has been running, along with load averages.

## 4. Check Current User
Command:

```bash
whoami
```

Purpose: Identifies the current logged-in user.

## 5. Check Memory Usage
Command:

```bash
free -h
```

Purpose: Displays RAM and swap usage in a human-readable format.

## Troubleshooting Notes
- Check the OS and kernel version before investigating compatibility issues.
- Review uptime and load averages when investigating system slowness.
- Check available memory when applications appear slow or unresponsive.

## Environment
Commands are tested in Ubuntu 22.04 LTS running under WSL2.
