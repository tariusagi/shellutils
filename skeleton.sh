#!/bin/bash
# Use this script as a skeleton for your Bash script. It has basic variables,
# command line arguments processing and usage printing, with ANSI support from
# the ansilib.sh.

# Version of this script. Use in usage statements and version tracking.
VERSION=0.3
# This script's full path name.
SCRIPT_FULLPATH="$(readlink -f $0)"
# This script's absolute directory (without trailing slash).
SCRIPT_DIR="$(dirname $SCRIPT_FULLPATH)"
# This script's base name (file name only, without directory).
SCRIPT_NAME="$(basename $SCRIPT_FULLPATH)"

# Include ansilib to get colors support.
ANSILIB_PATH=/usr/local/lib/ansilib.sh
if [ -f $ANSILIB_PATH ]; then
	. $ANSILIB_PATH
	if [ $? -ne 0 ]; then
		>&2 echo FATAL: Could not source $ANSILIB_PATH
		exit 1
	fi
else
		>&2 echo FATAL: $ANSILIB_PATH does not exist.
		exit 1
fi

print_usage () {
	# Usage statements, use heredoc. Put all statements between "USAGE" lines.
	cat <<-ENDOFUSAGE
		$(printc ugreen $SCRIPT_NAME) version $(printb red yellow $VERSION).
		Say hello to given name and print the ANSI color table if allowed.
		Syntax: $(printc green $SCRIPT_NAME) $(printc yellow [options])
		$(printc yellow Options:)
		-h              Print this usage.
		-n name         A name to say hello to.
		-v              Print this program version.
		-x              No color.
		ENDOFUSAGE
}

# If no argument was given, print the usage and exit.
# if [[ $# -eq 0 ]]; then
	# print_usage
	# exit
# fi

# Now handle command line arguments based on predefined list. Refer to "getopts"
# document to understand this code.
while getopts ":hn:vx" opt; do
	case ${opt} in
	h) print_usage ;;
	n) name=$OPTARG ;;
	v) printc yellow $SCRIPT_NAME version $VERSION; exit ;;
	x) unset ANSI_COLORS;;
	:) fatal "Option \"$OPTARG\" requires an argument."; exit ;;
	\?) fatal "Invalid option \"$OPTARG\""; exit ;;
	esac
done

if [ -z "$ANSI_COLORS" ]; then
	info Color output was disabled.
else
	info Color output was enabled.
fi

# Remove processed arguments.
shift $((OPTIND-1))
info There are $(printc yellow $#) remaining arguments:
n=0
for a in $@; do
	let n=n+1
	info "  Argument $n: $(printc yellow "$a")"
done

if [ -n "$name" ]; then
	# Say hello if a name was given.
	printc yellow Hello $(printc hblue $name), how are you today?
	printc yellow My name is $(printc ugreen "$SCRIPT_NAME"), version $(printc red $VERSION).
	printc yellow I live in $(printb hblue blue "$SCRIPT_DIR")
	printc yellow My full address is $(printb hblue blue "$SCRIPT_FULLPATH")
	while true; do
		read -rp "$(printc yellow "Would you like to see all ANSI colors [yN]? ")" answer
		case $answer in
			[yY]) 
				ansi_colors_table 
				printc yellow "Is it not amazing?"
				break
				;;
			[nN]) printc yellow What a pity!; break ;; 
			*) error Wrong answer! ;;
		esac
	done
	printc yellow "Nice to meet you! Good bye!"
else
	warn No name was given.
	printc Please tell me your name using '-n' option.
	exit
fi

