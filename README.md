# shellutils
Various utilities write in shell scripting languagues for Linux-based OSes and Windows

# Install
Clone this project, enter its directory and run `./makelinks` (requires root/sudo). It will create links to all project's scripts inside `/usr/local/bin` so you can run them anywhere.

# List of scripts
All scripts reside in `bin` directory.

## sdbak
Backup system SD card in boards such as Raspberry Pi, Orange Pi, Odroid... 

Usage: run `sdbak -h` to learn more.

## svclist
List all system services using `systemctl` command. Other possible listing options are "active", "inactive", "running".
