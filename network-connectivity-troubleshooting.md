# Network Connectivity Troubleshooting in WSL

## Problem
WSL system logs showed this error:

`CheckConnection: getaddrinfo() failed: -5`

## Tests Performed

### 1. Check System Logs
Command: `sudo journalctl -p err -n 10 --no-pager`

Reviewed recent system error messages.

### 2. Check DNS Resolution
Command: `getent hosts github.com`

Result: GitHub's hostname resolved successfully.

### 3. Check HTTPS Connectivity
Command: `curl -I --max-time 10 https://github.com`

Result: Received `HTTP/2 200`, confirming successful connectivity to GitHub during testing.

## Conclusion
The initial error was not reproduced during follow-up tests. DNS resolution and HTTPS connectivity to GitHub were working during testing. The original error's exact cause remains unconfirmed.

## Skills Practiced
- Linux log analysis
- DNS troubleshooting
- HTTPS connectivity testing
- Technical documentation
