# Linux File and Directory Permissions
## Objective

Practice Linux file and directory permissions, understand permission modes, and verify file ownership and access.

## Environment

- OS: Ubuntu 22.04 running on WSL2
- User: `saalyk`
- Practice directory: `~/permissions-lab`

## 1. Inspect File Permissions

Command:

```bash
ls -l test.txt
```

The long listing displays the file's permissions, owner, group, size, modification time, and filename.

Initial permissions were:

```text
-rw-rw-r-- 1 saalyk saalyk 43 test.txt
```

## 2. Change File Permissions

The `chmod` command changes file or directory permissions.

| Command | Purpose |
|---|---|
| `chmod 600 test.txt` | Owner can read and write |
| `chmod 644 test.txt` | Owner can read and write; group and others can read |
| `chmod 755 test.txt` | Owner has full permissions; group and others have read and execute |
| `chmod u-x test.txt` | Removes execute permission from the owner |
| `chmod o-r test.txt` | Removes read permission from others |
| `chmod 444 test.txt` | Gives read-only permission to owner, group, and others |

After the practice, the file was restored to mode `644`:

```text
-rw-r--r-- 1 saalyk saalyk 43 test.txt
```

**Note:** Mode `755` is commonly suitable for directories and executable files, not ordinary text files.

## 3. Practice Directory Permissions

Created a practice directory:

```bash
mkdir testdir
```

Inspected its permissions:

```bash
ls -ld testdir
```

Changed its permissions:

```bash
chmod 600 testdir
```

The directory became inaccessible for normal traversal because it lacked execute permission. Attempting to enter it returned:

```text
-bash: cd: testdir: Permission denied
```

Restored owner access:

```bash
chmod 700 testdir
```

Finally, restored the directory to mode `755` and verified it:

```text
drwxr-xr-x 2 saalyk saalyk 4096 testdir
```

For directories, execute permission allows users to traverse or access entries within the directory, subject to the relevant permissions.

## 4. Inspect Ownership

Command:

```bash
id saalyk
```

The `id` command displays the user ID (UID), primary group, and supplementary groups.

Observed output:

```text
uid=1000(saalyk) gid=1000(saalyk) groups=1000(saalyk),27(sudo)
```

Practiced setting the file group explicitly:

```bash
chown :saalyk test.txt
```

The file owner and group remained `saalyk`, because the file already belonged to that user and group.


## 5. Read a File

Command:

```bash
cat test.txt
```

Observed output:

```text
This is a Linux permissions practice file.
```

The file remained readable after applying mode `444`. Write permission was subsequently restored using `chmod 644 test.txt`.

## Key Learnings

- Linux permissions are represented by read (`r`), write (`w`), and execute (`x`).
- `chmod` changes permissions.
- `chown` changes file ownership or group.
- `ls -l` displays file details; `ls -ld` displays the directory itself.
- `cat` displays file contents.
- Directory execute permission is required for traversal.
- Permission changes should be verified with inspection commands.

## Safety Note

All permission experiments were performed on practice items inside `~/permissions-lab`, not on system files. The exercise did not require changing permissions on system directories or stopping services.
