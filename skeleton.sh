#!/bin/bash
# Use this script as a skeleton for your Bash script. It has basic variables,
# command line arguments processing and usage printing. This script requires
# Bash shell.

# Version of this script. Use in usage statements and version tracking.
VERSION=0.1
# This script's full path name.
SCRIPT=$(readlink -f $0)
# This script's absolute directory (without trailing slash).
SCRIPT_DIR="$(dirname $SCRIPT)"
# This script's base name (file name only, without directory).
SCRIPT_NAME=$(basename $SCRIPT)

# A fuction to print usage statements. Usage statements might be printed more
# than once, so it's better to make it a function.
print_usage () {
    # Usage statements, use heredoc. Put all statements between "USAGE" lines.
    cat <<USAGE
$SCRIPT_NAME version $VERSION.
Say hello to given name and print out all given command line arguments.
Syntax: $SCRIPT_NAME [options] [...]
Options:
-h              Print this usage.
-u name         A name to say hello to.
-v              Print this program version.
USAGE
}

# Check the number of given command line arguments.
if [ $# -eq 0 ]; then
    # If there's no argument, print the usage statements then exit immediately.
    print_usage
    exit
fi

# Now handle command line arguments based on predefined list. Refer to "getopts"
# document to understand this code.
while getopts "hu:v" opt; do
    case ${opt} in
    h ) print_usage
        exit
        ;;
    u ) name=$OPTARG
        ;;
    v ) echo $SCRIPT_NAME version $VERSION.
		exit
        ;;
    \? )echo "Invalid option \"$OPTARG\""
        exit
        ;;
    : ) echo "Option \"$OPTARG\" requires an argument."
        exit
        ;;
    esac
done

if [ "$name" == "" ]; then
	echo "Please give me your name. Use -h option for usage."
	exit
fi

echo "Hello $name, how are you today?"
echo My base name is \"$SCRIPT_NAME\"
echo My directory is \"$SCRIPT_DIR\"
echo My full path name is \"$SCRIPT\"

# Remove processed arguments.
shift $((OPTIND-1))

echo There are $# remaining arguments:
n=0
for a in $@; do
	let n=n+1
	echo "  Argument $n: \"$a\""
done

echo "All done, good bye!"

