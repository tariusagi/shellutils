#!/bin/bash
# A skeleton of a system service.
# See sample.service in the same directory to know how to create a systemd
# service with this script.

reload=
stop=
# Trap SIGHUP and SIGNTERM to reload and stop service.
trap "reload=yes" HUP
trap "stop=yes" TERM

# Main service loop.
echo Service started

while true; do
	# Handle service commands.
	if [ -n "$stop" ]; then
		echo Stop command received
		# TODO: perform stop operation.
		break
	fi

	if [ -n "$reload" ]; then
		echo Reload command received
		reload=
		# TODO: perform reload operation.
	fi

	# Do something.
	echo A normal message
	>&2 echo An error message
	sleep 1
done

echo Service stopped
