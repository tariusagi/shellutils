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
# NOTE: to preserve whitespaces, double-quote all texts and nested outputs, example:
#   echo "This  line  has $(red "$(yellow_bg "red   text   on   yellow   background")") inside it"

ANSI_FOREGROUNDS='black red green yellow blue purple cyan white hblack hred hgreen hyellow hblue hpurple hcyan hwhite ublack ured ugreen uyellow ublue upurple ucyan uwhite'
ANSI_BACKGROUNDS='black red green yellow blue purple cyan white'

# Foreground.
black() { [ "${*: -3}" == "[0m" ] && echo -en '\033[0;30m'"$*" || echo -en '\033[0;30m'"$*"'\033[0m'; }
red() { [ "${*: -3}" == "[0m" ] && echo -en '\033[0;31m'"$*" || echo -en '\033[0;31m'"$*"'\033[0m'; }
green() { [ "${*: -3}" == "[0m" ] && echo -en '\033[0;32m'"$*" || echo -en '\033[0;32m'"$*"'\033[0m'; }
yellow() { [ "${*: -3}" == "[0m" ] && echo -en '\033[0;33m'"$*" || echo -en '\033[0;33m'"$*"'\033[0m'; }
blue() { [ "${*: -3}" == "[0m" ] && echo -en '\033[0;34m'"$*" || echo -en '\033[0;34m'"$*"'\033[0m'; }
purple() { [ "${*: -3}" == "[0m" ] && echo -en '\033[0;35m'"$*" || echo -en '\033[0;35m'"$*"'\033[0m'; }
cyan() { [ "${*: -3}" == "[0m" ] && echo -en '\033[0;36m'"$*" || echo -en '\033[0;36m'"$*"'\033[0m'; }
white() { [ "${*: -3}" == "[0m" ] && echo -en '\033[0;37m'"$*" || echo -en '\033[0;37m'"$*"'\033[0m'; }
# Hi-intensive foreground.
hblack() { [ "${*: -3}" == "[0m" ] && echo -en '\033[0;90m'"$*" || echo -en '\033[0;90m'"$*"'\033[0m'; }
hred() { [ "${*: -3}" == "[0m" ] && echo -en '\033[0;91m'"$*" || echo -en '\033[0;91m'"$*"'\033[0m'; }
hgreen() { [ "${*: -3}" == "[0m" ] && echo -en '\033[0;92m'"$*" || echo -en '\033[0;92m'"$*"'\033[0m'; }
hyellow() { [ "${*: -3}" == "[0m" ] && echo -en '\033[0;93m'"$*" || echo -en '\033[0;93m'"$*"'\033[0m'; }
hblue() { [ "${*: -3}" == "[0m" ] && echo -en '\033[0;94m'"$*" || echo -en '\033[0;94m'"$*"'\033[0m'; }
hpurple() { [ "${*: -3}" == "[0m" ] && echo -en '\033[0;95m'"$*" || echo -en '\033[0;95m'"$*"'\033[0m'; }
hcyan() { [ "${*: -3}" == "[0m" ] && echo -en '\033[0;96m'"$*" || echo -en '\033[0;96m'"$*"'\033[0m'; }
hwhite() { [ "${*: -3}" == "[0m" ] && echo -en '\033[0;97m'"$*" || echo -en '\033[0;97m'"$*"'\033[0m'; }
# Underlined foregrround.
ublack() { [ "${*: -3}" == "[0m" ] && echo -en '\033[4;30m'"$*" || echo -en '\033[4;30m'"$*"'\033[0m'; }
ured() { [ "${*: -3}" == "[0m" ] && echo -en '\033[4;31m'"$*" || echo -en '\033[4;31m'"$*"'\033[0m'; }
ugreen() { [ "${*: -3}" == "[0m" ] && echo -en '\033[4;32m'"$*" || echo -en '\033[4;32m'"$*"'\033[0m'; }
uyellow() { [ "${*: -3}" == "[0m" ] && echo -en '\033[4;33m'"$*" || echo -en '\033[4;33m'"$*"'\033[0m'; }
ublue() { [ "${*: -3}" == "[0m" ] && echo -en '\033[4;34m'"$*" || echo -en '\033[4;34m'"$*"'\033[0m'; }
upurple() { [ "${*: -3}" == "[0m" ] && echo -en '\033[4;35m'"$*" || echo -en '\033[4;35m'"$*"'\033[0m'; }
ucyan() { [ "${*: -3}" == "[0m" ] && echo -en '\033[4;36m'"$*" || echo -en '\033[4;36m'"$*"'\033[0m'; }
uwhite() { [ "${*: -3}" == "[0m" ] && echo -en '\033[4;37m'"$*" || echo -en '\033[4;37m'"$*"'\033[0m'; }
# Background.
black_bg() { echo -en '\033[40m'"$*"'\033[0m'; }
red_bg() { echo -en '\033[41m'"$*"'\033[0m'; }
green_bg() { echo -en '\033[42m'"$*"'\033[0m'; }
yellow_bg() { echo -en '\033[43m'"$*"'\033[0m'; }
blue_bg() { echo -en '\033[44m'"$*"'\033[0m'; }
purple_bg() { echo -en '\033[45m'"$*"'\033[0m'; }
cyan_bg() { echo -en '\033[46m'"$*"'\033[0m'; }
white_bg() { echo -en '\033[47m'"$*"'\033[0m'; }

ansi_colors_table(){
	# Output a table of ANSI colors combinations.
	for f in $ANSI_FOREGROUNDS; do
		for b in $ANSI_BACKGROUNDS; do
			$f "$(${b}_bg "$f text on $b background")"
		done
	done
}

