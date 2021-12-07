# shellutils
Various shell utilities for Linux-based OSes and Windows. All utilities are in `./bin` directory.

# Install
Clone this project, enter its directory and run `makelinks` (requires root/sudo). It will create links to all project's scripts inside `/usr/local/bin` so you can run them anywhere.

# List of scripts
All scripts reside in `bin` directory.

## sdbak
Backup system SD card in boards such as Raspberry Pi, Orange Pi, Odroid... 

Usage: run `sdbak -h` to learn more.

## svclist
List system services using `systemctl` or `service` command (require root/sudo). Other possible listing options are "active", "inactive", "running".

## usbmount & usbumount
Mount or un-mount USB storage (require root/sudo). Default mode works with removable media only (such as USB flash drives). Use "all" option to include non-removable media, such as external USB hard drives.
