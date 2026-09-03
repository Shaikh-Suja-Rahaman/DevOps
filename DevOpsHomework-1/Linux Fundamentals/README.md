# Linux Fundamentals Guide

Welcome to the Linux Fundamentals guide! This document covers a few essential concepts and commands that every DevOps engineer and Linux user should know. We will look at file links, user management, and viewing system logs.

## 1. Soft Links vs Hard Links

In Linux, a link is just another way to access a file. There are two main types you will encounter.

### Soft Links (Symbolic Links)
Think of a soft link like a desktop shortcut. It simply points to the path of another file.

How to create one:
```bash
ln -s original.txt softlink.txt
```

If you check your files with `ls -l`, you will see it pointing to the original file:
```text
softlink.txt -> original.txt
```

### Hard Links
A hard link is a bit different. Instead of pointing to a file path, it points directly to the underlying data (the inode) on your hard drive. 

How to create one:
```bash
ln original.txt hardlink.txt
```

### What is the difference?
* **Deletion**: If you delete the original file, a soft link will break because the path it points to is gone. A hard link will still work perfectly fine because it points to the actual data, which remains until all hard links are deleted.
* **Inodes**: A soft link has its own unique inode. A hard link shares the exact same inode as the original file.
* **Limitations**: Soft links can link to directories and span across different filesystems. Hard links generally cannot do either.

## 2. Managing Users: adduser vs useradd

When you need to create a new user, you have two commands that sound very similar but act quite differently.

### useradd (The script-friendly way)
This is a low-level command found on almost all Linux systems. 
```bash
sudo useradd username
```
By default, it just creates the user silently. It won't prompt you for a password, and it might not even create a home directory unless you specifically tell it to (using the `-m` flag). Because it doesn't ask questions, it is perfect for automation and scripts.

### adduser (The human-friendly way)
This is a helpful script commonly used on Ubuntu and Debian systems.
```bash
sudo adduser testuser
```
It is interactive. It will automatically create the home directory, set up a group, and politely ask you to type in a password and other user details. If you are a human typing at a keyboard, this is usually the command you want.

## 3. Viewing Logs with journalctl

When things go wrong on a server, your first step is to check the logs. Modern Linux systems use a tool called systemd to collect logs from the kernel, services, and applications into one big database. You read this database using `journalctl`.

### Basic Commands
* `journalctl` will show you absolutely everything.
* `journalctl -e` jumps straight to the end so you can see the most recent logs.
* `journalctl -f` follows the logs in real time. This is great for watching a live feed while you troubleshoot a problem.

### Checking Specific Services
If your web server goes down, you only care about those specific logs.
```bash
journalctl -u nginx
```
You can also follow them live:
```bash
journalctl -u nginx -f
```

### Filtering by Boot or Time
Sometimes you need to know what happened right before a server crashed.
* `journalctl -b` shows logs since the server was last turned on.
* `journalctl -b -1` shows logs from the previous boot.

You can also filter by time if you know exactly when an issue occurred:
* `journalctl --since today`
* `journalctl --since "1 hour ago"`
* `journalctl --since "2026-09-01 10:00:00" --until "2026-09-01 12:00:00"`

That covers the basics! These tools are essential for navigating and troubleshooting any Linux system.
