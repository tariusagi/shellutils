#!/bin/bash
# Use this script as a skeleton for your Bash script. It has basic variables, command line arguments processing and
# usage printing. This script requires Bash.

# Version of this script. Use in usage statements and version tracking.
VERSION=0.2
# This script's full path name.
SCRIPT_FULLPATH="$(readlink -f $0)"
# This script's absolute directory (without trailing slash).
SCRIPT_DIR="$(dirname $SCRIPT_FULLPATH)"
# This script's base name (file name only, without directory).
SCRIPT_NAME="$(basename $SCRIPT_FULLPATH)"

# Include the ansilib.sh to support color output.
ANSILIB_PATH=/usr/local/lib/ansilib.sh
if [ -f $ANSILIB_PATH ]; then
	export ANSILIB=yes
	. $ANSILIB_PATH
fi

# A fuction to print usage statements. Usage statements might be printed more
# than once, so it's better to make it a function.
print_usage () {
	# Usage statements, use heredoc. Put all statements between "USAGE" lines.
	cat <<-ENDOFUSAGE
		$SCRIPT_NAME version $VERSION.
		Say hello to given name and print out all given command line arguments.
		Syntax: $SCRIPT_NAME [options] [...]
		Options:
		-c              Output ANSI color texts.
		-h              Print this usage.
		-n name         A name to say hello to.
		-v              Print this program version.
		ENDOFUSAGE
}

print_color_usage () {
	# Usage statements, use heredoc. Put all statements between "USAGE" lines.
	cat <<-ENDOFUSAGE
		$(ugreen $SCRIPT_NAME) version $(red $(yellow_bg $VERSION)).
		Say hello to given name and print out all given command line arguments.
		Syntax: $(green $SCRIPT_NAME) $(yellow [options])
		$(yellow Options:)
		-c              Output ANSI color texts.
		-h              Print this usage.
		-n name         A name to say hello to.
		-v              Print this program version.
		ENDOFUSAGE
}

# Check the number of given command line arguments.
if [[ $# -eq 0 ]]; then
	# No argument? Print a reminder.
	echo Nothing to do. Run with \"-h\" for usage.
	exit
fi

# Now handle command line arguments based on predefined list. Refer to "getopts"
# document to understand this code.
while getopts "chn:v" opt; do
	case ${opt} in
	c)
		if [ -n "$ANSILIB" ]; then
			color=yes
		else
			>&2 echo WARN: $ANSILIB_PATH not found. Color is not supported.
		fi
		;;
	h)
		if [ -n "$ANSILIB" ]; then
			print_color_usage
		else
			print_usage
		fi
		exit
		;;
	n)
		name=$OPTARG
		;;
	v)
		echo $SCRIPT_NAME version $VERSION.
		exit
		;;
	\?)
		echo "Invalid option \"$OPTARG\""
		exit
		;;
	:)
		echo "Option \"$OPTARG\" requires an argument."
		exit
		;;
	esac
done

# Say hello and introduce myself if a name was given.
if [ -n "$name" ]; then
	if [ -n "$color" ]; then
		# Greeting in color.
		echo Hello $(yellow $name), how are you today?
		echo My name is $(green \"$SCRIPT_NAME\")
		echo I live in $(blue \"$SCRIPT_DIR\")
		echo My full address is $(uyellow $(blue_bg \"$SCRIPT_FULLPATH\"))
	else
		echo Hello $name, how are you today?
		echo My name is \"$SCRIPT_NAME\"
		echo I live in \"$SCRIPT_DIR\"
		echo My full address is \"$SCRIPT_FULLPATH\"
	fi
fi

# Remove processed arguments.
shift $((OPTIND-1))
echo There are $# remaining arguments:
n=0
for a in $@; do
	let n=n+1
	echo "  Argument $n: \"$a\""
done

echo "All done, good bye!"
