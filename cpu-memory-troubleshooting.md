# CPU, Memory, and System Load Troubleshooting

## 1. Objective

Inspect CPU activity, memory availability, running processes, and system load to understand whether a Linux system shows signs of resource pressure.

## 2. Environment

- Operating System: Ubuntu 22.04 LTS
- Platform: WSL2 on Windows
- Shell: Bash
- Project: Linux Server Troubleshooting

## 3. Monitor Running Processes

**Command:**

```bash
top
```

**Purpose:** Displays running processes and live system resource statistics, including CPU and memory usage.

**Observation:** In the captured process list, most visible processes showed 0.0% CPU usage, while one process showed 0.3%.

**Finding:** The visible processes showed low CPU activity at the time of observation. The complete CPU summary was not captured, so overall CPU utilization could not be confirmed from this output alone.

Press `q` to exit `top`.

## 4. Check Memory and Swap Usage

**Command:**

```bash
free -h
```

**Actual output:**

```text
               total        used        free      shared  buff/cache   available
Mem:           2.8Gi       478Mi       1.9Gi       4.0Mi       391Mi       2.2Gi
Swap:          1.0Gi       0.0Ki       1.0Gi
```

**Findings:**

- Total memory: 2.8 GiB
- Used memory: 478 MiB
- Free memory: 1.9 GiB
- Available memory: 2.2 GiB
- Total swap: 1.0 GiB
- Used swap: 0.0 KiB

**Interpretation:** Approximately 2.2 GiB of memory was available to applications. Swap usage was zero at the time of the check. These results did not indicate an obvious memory shortage.

The `available` column is generally more useful than the `free` column alone when assessing whether applications may need additional memory.

## 5. Check System Uptime and Load Average

**Command:**

```bash
uptime
```

**Actual output:**

```text
01:27:04 up  3:41,  2 users,  load average: 0.04, 0.02, 0.00
```

**Findings:**

- Uptime: 3 hours and 41 minutes
- Reported user sessions: 2
- 1-minute load average: 0.04
- 5-minute load average: 0.02
- 15-minute load average: 0.00

**Interpretation:** The reported load averages were very low at the time of observation. This did not suggest excessive system load in that snapshot.

Load average represents the average number of tasks running or waiting for CPU time, along with tasks in certain uninterruptible states. Interpret it in the context of the available CPU cores and workload.

## 6. Troubleshooting Workflow

When investigating slow applications or suspected resource problems:

1. Run `top` to inspect processes and live resource activity.
2. Run `free -h` to check memory availability and swap usage.
3. Run `uptime` to inspect system uptime and load averages.
4. Compare the results and investigate further if the symptoms persist.
5. Collect additional evidence before stopping processes or changing system settings.

## 7. Resolution and Conclusion

The captured results showed low CPU activity among the visible processes, 2.2 GiB of available memory, no swap usage, and very low load averages.

No resource-related changes were made because the available evidence did not show an immediate CPU or memory shortage.

**Final result:** The basic CPU, memory, and system load checks were completed and documented using actual terminal outputs.

## 8. Safety Note

This exercise was performed in a local Ubuntu WSL2 environment. No production servers were accessed, and no processes were terminated or system settings changed.
