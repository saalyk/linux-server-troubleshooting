# Cron Service Troubleshooting in Linux (WSL)

## Objective
Check whether the cron service is running correctly and review its recent logs.

## Step 1: Check Failed Services

Command:

`systemctl --failed --no-pager`

Result: No failed services were reported.

## Step 2: List Running Services

Command:

`systemctl list-units --type=service --state=running --no-pager`

Result: 18 running services were listed.

## Step 3: Check Cron Service Status

Command:

`systemctl status cron.service --no-pager`

Findings:
- Service state: active (running)
- Startup configuration: enabled
- Main process ID: 216
- Reported memory usage: 3.0 MB

## Step 4: Review Cron Logs

Command:

`sudo journalctl -u cron.service -n 10 --no-pager`

Findings:
- Cron startup information was present.
- Hourly scheduled jobs were invoked using `/etc/cron.hourly`.
- The displayed cron sessions opened and closed normally.
- No obvious failure was found in the 10 log entries reviewed.

## Conclusion

The cron service was active and running during the check. Recent logs showed hourly job execution without an obvious error in the reviewed entries.

This check does not prove that every scheduled task completed successfully; individual job output may need separate investigation if a problem is reported.

## Skills Practiced

- Linux service monitoring with systemctl
- Identifying failed services
- Reviewing service logs with journalctl
- Basic Linux troubleshooting
- Technical documentation using Markdown
