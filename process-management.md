# Linux Process Management and Troubleshooting

## Objective

Investigate running Linux processes, review their resource usage, identify parent processes, and inspect a running service without making unnecessary system changes.

## Environment

- OS: Ubuntu 22.04 LTS
- Platform: WSL2 on Windows
- Shell: Bash

## 1. List Processes by CPU Usage

Command:

```bash
ps aux --sort=-%cpu | head -10
```

Purpose:
- Lists running processes.
- Sorts processes by CPU usage in descending order.
- Displays the first 10 lines for a quick overview.

## 2. Inspect Specific Processes

Command:

```bash
ps -p 229,319 -o pid,ppid,user,stat,%cpu,%mem,etime,args --width 200
```

Purpose:
- Checks selected process IDs.
- Displays parent process IDs, ownership, state, CPU and memory usage, elapsed time, and command details.

## 3. Identify a Parent Process

Command:

```bash
ps -p 242 -o pid,ppid,user,stat,etime,args --width 200
```

Purpose:

Identifies the parent process associated with the investigated application.

## 4. Find Related Processes

Command:

```bash
ps -ef | grep -E 'subiquity|ubuntu-desktop-installer' | grep -v grep
```

Purpose:

Lists processes whose command lines match the specified installer-related terms.

## 5. Check Process Start Time

Command:

```bash
ps -p 242,319 -o pid,lstart,etime,stat,cmd --width 200
```

Purpose:

Displays process start times, elapsed time, and process states.

## 6. Inspect Service Status

Command:

```bash
snap services ubuntu-desktop-installer
```

Observed result:

The `ubuntu-desktop-installer.subiquity-server` service was reported as `enabled` and `active`.

## 7. Inspect Package Information

Command:

```bash
snap info ubuntu-desktop-installer
```

Observations:
- Publisher: Canonical
- Installed version: `0+git.0057491b`
- Installed revision: `1286`
- Tracking channel: `latest/edge`

## 8. Verify the Virtualization Environment

Command:

```bash
systemd-detect-virt
```

Observed result:

```text
wsl
```

This confirmed that the current Linux environment was detected as WSL.

## Troubleshooting Findings

- The investigated installer-related processes had low CPU usage in the captured process listing.
- The installer service was enabled and active.
- The package information identified Canonical as the publisher.
- The environment was detected as WSL.
- The reason for the installer service running in this WSL environment was not conclusively established.

## Conclusion

This exercise demonstrated process inspection, parent-process identification, service-status checks, package inspection, and environment verification.

No processes were terminated, and the service was not stopped or uninstalled because no confirmed issue requiring intervention had been established.

## Safety Note

Process termination and package removal should only be performed after understanding the process purpose, dependencies, and impact. A running service or a high resource value alone does not automatically justify stopping or removing it.
