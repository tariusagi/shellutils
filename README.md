# shellutils

Various shell utilities for Linux-based OSes and Windows. All utilities are in `./bin` directory.

# Shell prorgamming tips

See [Bash tips](https://github.com/tariusagi/productivity-tips/tree/main/bash).

# Install

Clone this project, enter its directory and run `makelinks` (requires root/sudo). It will create links to all project's scripts inside `/usr/local/bin` so you can run them anywhere.

# List of scripts

All scripts reside in `bin` or `lib` directory.

## ansilib.sh

A Bash library, which can be sourced, to provde ANSI color output supports and some usefull functions and aliases, currently include:

```txt
Miscs:
------
timestamp: output timestamp in 2022-02-27 12:34:01 format.
ansi_colors_table: output all supported text and background colors. Execute ansilib.sh (not sourcing it) will run this function.

Text output
--------------
printc: print a color text message if supported, otherwise print without color.
printb: print a color text message on color background if supported, otherwise print without color.

Logging
-------
info, which calls info_msg function: output an info message with timestamp.
warn, which calls warn_msg function: output a color warning with timestamp.
error, which calls error_msg function: output a color error message with caller line number.
fatail, which calls fatal_msg function: output a color fatal message with caller line number and terminate the running script with the given exit code at the first argument.

Colors output (h = hight, u = underline, bg = background)
---------------------------------------------------------
black black_bg blue blue_bg cyan cyan_bg green green_bg hblack hblue hcyan
hgreen hpurple hred hwhite hyellow purple purple_bg red red_bg ublack ublue
ucyan ugreen upurple ured uwhite uyellow white white_bg yellow yellow_bg
```

## gitgraph

Show a Git's repository revisions log as a graph in CLI.

## imgmount

```txt
Mount/unmount disk/partition image.
Syntax: imgmount [options] [<image dir>]
Options:
image           Path to the image.
dir             Mount point (a directory).
-d              Interactively detach and unmount existing loop back.
-D              Detach and unmount all existing loop back devices.
-h              Print this usage.
-p n            Mount the "n"th partition in the image. Default is 1.
-r              Mount in read-only mode.
-v              Print this program version.
```

## sdbak

```txt
Syntax: sdbak [options] DEV DIR
Create a backup of DEV (such as /dev/mmcblk0) and put it into DIR. The backup can be shrinked using pishrink.sh and compressed with pigz.
Options:
-c         Compress backup image.
-d         Use default setting: purge, shrink, compress, use current hostname, and ignore all other options.
-e n       Add an extra n (default 100) megabytes to the shrunk image.
-h         Print this usage.
-f <name>  Name of the backup image. Default is the current hostname.
-k         Keep original image after shrinking or compressing.
-l n       Limit size to expand the rootfs during first boot. See "size" argument of the size2fs command. Ex: "-l 4.5G".
-n         Don't expand filesystem when image is booted the first time
-p         Purge redudant files (logs, apt archives, temp...) and then shrink.
-s         Shrink backup image.
-v         Print this program version.
NOTE:
- This script requires root/sudo privilege.
- This script requires pishrink.sh from https://github.com/tariusagi/PiShrink.git. Download and put it in root's PATH (such as /usr/local/bin/) before running this script.
- Timestamp will be appended to backup file name automatically.
```

## sendalarm

```txt
Send an alarm signal to lcdserver and/or alarmserver. The IPs and ports of the
servers must be set in the envar LCD_SERVER and BUZZER_SERVER before calling
this program, for example: "export LCD_SERVER="192.168.1.2 1234".

Syntax: sendalarm [signal] [message]

where:
- signal: one of "on", "off", "info", "ok", "warn", "error", which turns on or
off the buzzer, or make different sounds.
- message: will be displayed on the LCD. It must start with a LCD line number.

Example:
sendalarm info line1 Backup started
sendalarm warn line2 DB err, fixing
sendalarm error line2 DB fix failed
sendalarm ok line1 Backup done
```

## svclist

List system services using `systemctl` or `service` command (require root/sudo). Other possible listing options are "active", "inactive", "running".

## sysinfo

```txt
Syntax: sysinfo [OPTIONS]
Print system info one by one and optionally show on a LCD.
Options:
-h            Print this usage.
-i sec        Seconds between metrics. Default none or 1 if show on a LCD.
-m dir        Add mount point dir to list of disk usage report.
-n name       Name of the system. Default is the hostname.
-N            Disable showing system name.
-r            Repeat.
-s host       Address of a LCD server.
-p port       Port of a LCD server. Default is 1234.
-t list       List of target info to show, separated by commas. Supported
targets are up (means uptime), load, temp, mem, ip, disk. If
              this option is omitted, all targets will be shown.
-l num        Line to be printed on the LCD.
```

## usbmount & usbumount

Interactively mount or un-mount USB storage (require root/sudo). Default mode works with removable media only (such as USB flash drives). Use "all" option to include non-removable media, such as external USB hard drives.

