# Disk Space Troubleshooting in Linux

## 1. Objective

Investigate disk usage in an Ubuntu Linux environment, identify directories consuming storage, and determine whether cleanup is necessary.

## 2. Environment

- Operating System: Ubuntu 22.04 LTS
- Platform: WSL2 on Windows
- Shell: Bash
- Project: Linux Server Troubleshooting

## 3. Check Filesystem Usage

**Command:**

```bash
df -h
```

**Key results from the actual terminal output:**

| Filesystem | Size | Used | Available | Usage | Mount point |
|---|---:|---:|---:|---:|---|
| `/dev/sdd` | 251G | 5.2G | 233G | 3% | `/` |
| `C:\` | 475G | 227G | 248G | 48% | `/mnt/c` |
| `/dev/sdb` | 97M | 97M | 0 | 100% | `/usr/lib/linux-tools/6.18.54.1-microsoft-standard-WSL2` |

**Finding:** The main Linux root filesystem was only 3% used. The Windows C: drive was 48% used. The `/dev/sdb` filesystem showed 100% usage, so its mount details were investigated separately.

## 4. Investigate the 100% Filesystem

**Command:**

```bash
findmnt -T /usr/lib/linux-tools/6.18.54.1-microsoft-standard-WSL2
```

**Actual output:**

```text
TARGET                    SOURCE
/usr/lib/linux-tools/6.18.54.1-microsoft-standard-WSL2
                          /dev/sdb[/6.18.54.1-microsoft-standard-WSL2/perf]

FSTYPE                    OPTIONS
ext4                      ro,rela
```

**Finding:** The filesystem was mounted read-only (`ro`). A filesystem reporting 100% usage does not automatically mean the main Linux filesystem is running out of space. Mount type and purpose should be investigated before taking action.

## 5. Identify Directories Using Disk Space

**Command:**

```bash
sudo du -xhd1 / 2>/dev/null
```

**Actual output:**

```text
300K    /home
4.0K    /srv
4.9M    /etc
4.0K    /opt
2.6G    /root
4.0K    /mnt
1.3G    /usr
4.0K    /media
4.0K    /boot
32K     /snap
1.4G    /var
16K     /lost+found
5.2G    /
```

**Finding:** `/root`, `/usr`, and `/var` were the largest directories in this scan.

The `-x` option keeps the scan on the same filesystem, `-h` displays human-readable sizes, and `-d1` limits output to one directory level.

## 6. Investigate `/root` and `/var`

**Command:**

```bash
sudo du -xhd1 /root /var 2>/dev/null
```

**Actual output:**

```text
8.0K    /root/.nv
12K     /root/.conda
12K     /root/.cache
309M    /root/ngs
40K     /root/.java
12K     /root/.config
8.0K    /root/projects
2.2G    /root/miniconda3
2.6G    /root
16K     /var/spool
4.0K    /var/crash
1.2M    /var/backups
4.0K    /var/opt
952M    /var/lib
245M    /var/cache
76K     /var/snap
36K     /var/tmp
4.0K    /var/local
141M    /var/log
4.0K    /var/mail
1.4G    /var
```

**Findings:**

- `/root/miniconda3` used approximately 2.2 GB.
- `/root/ngs` used approximately 309 MB.
- `/var/lib` used approximately 952 MB.
- `/var/cache` used approximately 245 MB.
- `/var/log` used approximately 141 MB.

The data under `/root` was not part of this project's cleanup. It was left untouched because its purpose had not been established.

## 7. Inspect Package Data, Cache, and Logs

**Command:**

```bash
sudo du -xhd1 /var/lib /var/cache /var/log 2>/dev/null
```

**Key findings from the actual output:**

| Directory | Approximate size |
|---|---:|
| `/var/lib/apt` | 318 MB |
| `/var/lib/snapd` | 584 MB |
| `/var/cache/apt` | 237 MB |
| `/var/log/journal` | 137 MB |
| `/var/log` | 141 MB |

These results helped identify which subdirectories contributed to the overall storage usage.

## 8. Verify System Journal Usage

**Command:**

```bash
sudo journalctl --disk-usage
```

**Actual output:**

```text
Archived and active journals take up 136.0M in the file system.
```

**Finding:** The system journal used 136.0 MB, consistent with the approximately 137 MB reported for `/var/log/journal`.

This second command independently confirmed the journal's storage usage.

## 9. Resolution and Conclusion

No cleanup was performed because the main Linux filesystem had only 3% usage and no immediate disk-space shortage was identified.

The investigation demonstrated the following troubleshooting workflow:

1. Check filesystem capacity with `df -h`.
2. Investigate unusual filesystem usage with `findmnt`.
3. Identify large directories with `du`.
4. Drill down into directories consuming space.
5. Verify specific findings with a dedicated command such as `journalctl --disk-usage`.
6. Avoid deleting files until their purpose and the need for cleanup are understood.

**Final result:** The disk-usage investigation was completed, relevant storage consumers were identified, and journal usage was verified. No files were deleted.

## 10. Safety Note

This exercise was performed in a local Ubuntu WSL2 environment. No production servers were accessed, and no files were deleted as part of the investigation.
