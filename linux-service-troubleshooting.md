# Linux Service Troubleshooting

## Objective

Practice checking Linux service status, reviewing service logs, and identifying error-level events using `systemctl` and `journalctl`.

## Environment

- OS: Ubuntu 22.04 LTS on WSL2
- User: `saalyk`
- Service investigated: `cron.service`

## 1. Check systemd Status

Command:

```bash
systemctl --version
systemctl is-system-running
```

Observed results:

- systemd version: 249
- System state: `running`

This confirmed that systemd was available and running in the WSL environment.

## 2. List Running Services

Command:

```bash
systemctl --type=service --state=running --no-pager
```

Observed result: 17 running service units were listed.

This command helps identify services currently running on the system.

## 3. Inspect Cron Service Status

Command:

```bash
systemctl status cron --no-pager
```

Observed results:

- Service: `cron.service`
- Loaded: `loaded`
- Enabled: `enabled`
- Active state: `active (running)`
- Main PID: `216`
- Reported memory usage: `3.0M`

The service was running when inspected. The status output also displayed a journal permissions warning, so privileged access was used to inspect its logs.

## 4. Review Service Logs

Command:

```bash
sudo journalctl -u cron -n 20 --no-pager
```

The logs showed cron startup messages and scheduled execution of `/etc/cron.hourly`. The displayed entries also included earlier service stop and start events.

These observations alone do not establish a service failure.

## 5. Check Error-Level Logs

Command:

```bash
sudo journalctl -u cron -p err -n 20 --no-pager
```

Observed output:

```text
-- No entries --
```

No matching error-priority entries were returned for the queried journal logs.

This does not guarantee that every possible issue is absent; it describes only the available matching entries.

## Key Learnings

- `systemctl` checks service and system state.
- `journalctl` retrieves logs from the system journal.
- `-u` filters logs by service.
- `-p err` filters for error-priority entries.
- Service status, logs, and error checks should be reviewed together.
- Troubleshooting conclusions should be based on observed evidence.

## Safety Note

This exercise used read-only status and log commands. No services were stopped, restarted, or reconfigured.
