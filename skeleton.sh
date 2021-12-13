#!/bin/bash
# Use this script as a skeleton for your Bash script. It has basic variables,
# command line arguments processing and usage printing. This script requires
# Bash shell.

# Version of this script. Use in usage statements and version tracking.
VERSION=0.2
# This script's full path name.
SCRIPT_FULLPATH="$(readlink -f $0)"
# This script's absolute directory (without trailing slash).
SCRIPT_DIR="$(dirname $SCRIPT_FULLPATH)"
# This script's base name (file name only, without directory).
SCRIPT_NAME="$(basename $SCRIPT_FULLPATH)"

# ANSI COLORS ESCAPE SEQUENCES.
# -----------------------------
# Foreground.
black() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;30m'$s || echo -e '\033[0;31m'$s'\033[0m'; }
red() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;31m'$s || echo -e '\033[0;31m'$s'\033[0m'; }
green() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;32m'$s || echo -e '\033[0;32m'$s'\033[0m'; }
yellow() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;33m'$s || echo -e '\033[0;33m'$s'\033[0m'; }
blue() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;34m'$s || echo -e '\033[0;34m'$s'\033[0m'; }
purple() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;35m'$s || echo -e '\033[0;35m'$s'\033[0m'; }
cyan() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;36m'$s || echo -e '\033[0;36m'$s'\033[0m'; }
white() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;37m'$s || echo -e '\033[0;37m'$s'\033[0m'; }

# Hi-intensive.
hblack() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;90m'$s || echo -e '\033[0;90m'$s'\033[0m'; }
hred() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;91m'$s || echo -e '\033[0;91m'$s'\033[0m'; }
hgreen() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;92m'$s || echo -e '\033[0;92m'$s'\033[0m'; }
hyellow() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;93m'$s || echo -e '\033[0;93m'$s'\033[0m'; }
hblue() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;94m'$s || echo -e '\033[0;94m'$s'\033[0m'; }
hpurple() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;95m'$s || echo -e '\033[0;95m'$s'\033[0m'; }
hcyan() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;96m'$s || echo -e '\033[0;96m'$s'\033[0m'; }
hwhite() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;97m'$s || echo -e '\033[0;97m'$s'\033[0m'; }

# Underline.
ublack() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[4;30m'$s || echo -e '\033[4;30m'$s'\033[0m'; }
ured() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[4;31m'$s || echo -e '\033[4;31m'$s'\033[0m'; }
ugreen() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[4;32m'$s || echo -e '\033[4;32m'$s'\033[0m'; }
uyellow() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[4;33m'$s || echo -e '\033[4;33m'$s'\033[0m'; }
ublue() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[4;34m'$s || echo -e '\033[4;34m'$s'\033[0m'; }
upurple() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[4;35m'$s || echo -e '\033[4;35m'$s'\033[0m'; }
ucyan() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[4;36m'$s || echo -e '\033[4;36m'$s'\033[0m'; }
uwhite() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[4;37m'$s || echo -e '\033[4;37m'$s'\033[0m'; }

# Backgrounds.
black_bg() { echo -e '\033[40m'$*'\033[0m'; }
red_bg() { echo -e '\033[41m'$*'\033[0m'; }
green_bg() { echo -e '\033[42m'$*'\033[0m'; }
yellow_bg() { echo -e '\033[43m'$*'\033[0m'; }
blue_bg() { echo -e '\033[44m'$*'\033[0m'; }
purple_bg() { echo -e '\033[45m'$*'\033[0m'; }
cyan_bg() { echo -e '\033[46m'$*'\033[0m'; }
white_bg() { echo -e '\033[47m'$*'\033[0m'; }

# END OF ANSI COLORS ESCAPE SEQUENCES.
# ------------------------------------

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
		Syntax: $(green $SCRIPT_NAME) $(blue [options])
		$(blue Options:)
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
		color=yes
		;;
	h)
		if [ "$color" == "yes" ]; then
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
