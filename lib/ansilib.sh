# ANSI library for shell scripting.
# ---------------------------------
# This is a collection of functions that support outputing ANSI color texts.
# Include this file in your script to use. Ex:
#   source ./ansilib.sh 
# And then call these functions with the text to be colored. Variable substituation supported. For example:
#   red This is a red text
#   hred This is a high intensive red text
#   ured This is an underlined red text
#   red_bg This text has red background.
# To mix foreground and background, put backgrounds as the arguments of the foreground function. For example:
#   red $(yellow_bg A red text on yellow background)
# Output of these functions can be used for other commands just as normal. For example:
#   echo This line has a $(red $(yellow_bg red text on yellow background)) inside it

# Foreground.
black() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;30m'$s || echo -e '\033[0;31m'$s'\033[0m'; }
red() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;31m'$s || echo -e '\033[0;31m'$s'\033[0m'; }
green() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;32m'$s || echo -e '\033[0;32m'$s'\033[0m'; }
yellow() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;33m'$s || echo -e '\033[0;33m'$s'\033[0m'; }
blue() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;34m'$s || echo -e '\033[0;34m'$s'\033[0m'; }
purple() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;35m'$s || echo -e '\033[0;35m'$s'\033[0m'; }
cyan() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;36m'$s || echo -e '\033[0;36m'$s'\033[0m'; }
white() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;37m'$s || echo -e '\033[0;37m'$s'\033[0m'; }
# Hi-intensive foreground.
hblack() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;90m'$s || echo -e '\033[0;90m'$s'\033[0m'; }
hred() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;91m'$s || echo -e '\033[0;91m'$s'\033[0m'; }
hgreen() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;92m'$s || echo -e '\033[0;92m'$s'\033[0m'; }
hyellow() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;93m'$s || echo -e '\033[0;93m'$s'\033[0m'; }
hblue() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;94m'$s || echo -e '\033[0;94m'$s'\033[0m'; }
hpurple() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;95m'$s || echo -e '\033[0;95m'$s'\033[0m'; }
hcyan() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;96m'$s || echo -e '\033[0;96m'$s'\033[0m'; }
hwhite() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[0;97m'$s || echo -e '\033[0;97m'$s'\033[0m'; }
# Underlined foregrround.
ublack() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[4;30m'$s || echo -e '\033[4;30m'$s'\033[0m'; }
ured() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[4;31m'$s || echo -e '\033[4;31m'$s'\033[0m'; }
ugreen() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[4;32m'$s || echo -e '\033[4;32m'$s'\033[0m'; }
uyellow() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[4;33m'$s || echo -e '\033[4;33m'$s'\033[0m'; }
ublue() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[4;34m'$s || echo -e '\033[4;34m'$s'\033[0m'; }
upurple() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[4;35m'$s || echo -e '\033[4;35m'$s'\033[0m'; }
ucyan() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[4;36m'$s || echo -e '\033[4;36m'$s'\033[0m'; }
uwhite() { s="$*"; [ "${s: -3}" == "[0m" ] && echo -e '\033[4;37m'$s || echo -e '\033[4;37m'$s'\033[0m'; }
# Background.
black_bg() { echo -e '\033[40m'$*'\033[0m'; }
red_bg() { echo -e '\033[41m'$*'\033[0m'; }
green_bg() { echo -e '\033[42m'$*'\033[0m'; }
yellow_bg() { echo -e '\033[43m'$*'\033[0m'; }
blue_bg() { echo -e '\033[44m'$*'\033[0m'; }
purple_bg() { echo -e '\033[45m'$*'\033[0m'; }
cyan_bg() { echo -e '\033[46m'$*'\033[0m'; }
white_bg() { echo -e '\033[47m'$*'\033[0m'; }