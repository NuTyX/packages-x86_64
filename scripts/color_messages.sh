#!/bin/bash

#**********************************************************************************************************************
#
#   MESSAGES FUNCTIONS - functions for outputting messages.
#
# USAGE EXAMPLE: ALL messages should be in the format:
#
#   plain "$(gettext "Some Info...")"
#   plain "$(gettext "The files path is: %s")"  "$FILEPATH"
#   plain "$(gettext "Source file <%s>.")" "$(get_filename "$1")"
#
#**********************************************************************************************************************
#
#   USAGE with in a shell script: source this file within your shell script
#                                 To use 'interrupted' set a trap
#
#       EXAMPLE:
#
#       THIS_SCRIPT_PATH="$(readlink -f "$(type -P $0 || echo $0)")"
#       THIS_SCRIPT_DIR="$(dirname "$THIS_SCRIPT_PATH")"
#       source $THIS_SCRIPT_DIR/color_messages.sh
#       trap "interrupted" SIGHUP SIGINT SIGQUIT SIGTERM
#       color_mesg
#
#
#**********************************************************************************************************************

color_mesg() {
	# prefer terminal safe colored and bold text when tput is supported
	if tput setaf 0 &>/dev/null; then
		ALL_OFF_MSG="$(tput sgr0)"
		BOLD_MSG="$(tput bold)"
		RED_MSG="${BOLD_MSG}$(tput setaf 1)"
		GREEN_MSG="${BOLD_MSG}$(tput setaf 2)"
		YELLOW_MSG="${BOLD_MSG}$(tput setaf 3)"
		BLUE_MSG="${BOLD_MSG}$(tput setaf 4)"
		MAGENTA_MSG="${BOLD_MSG}$(tput setaf 5)"
	else
		ALL_OFF_MSG="\e[0m"
		BOLD_MSG="\e[1m"
        RED_MSG="${BOLD_MSG}\e[31m"
		GREEN_MSG="${BOLD_MSG}\e[32m"
		YELLOW_MSG="${BOLD_MSG}\e[33m"
		BLUE_MSG="${BOLD_MSG}\e[34m"
		MAGENTA_MSG="${BOLD_MSG}\e[35m"
	fi
	readonly ALL_OFF_MSG BOLD_MSG BLUE_MSG GREEN_MSG RED_MSG YELLOW_MSG MAGENTA_MSG
}

plain() {
	local mesg=$1; shift
	printf "${BOLD_MSG}==> ${mesg}${ALL_OFF_MSG}\n" "$@" >&1
}

plain2() {
	local mesg=$1; shift
	printf "${BOLD_MSG}    ${mesg}${ALL_OFF_MSG}\n" "$@" >&1
}

msg() {
	local mesg=$1; shift
	printf "${GREEN_MSG}==>${ALL_OFF_MSG}${BOLD_MSG} ${mesg}${ALL_OFF_MSG}\n" "$@" >&1
}

msg2() {
	local mesg=$1; shift
	printf "${BLUE_MSG}  ->${ALL_OFF_MSG}${BOLD_MSG} ${mesg}${ALL_OFF_MSG}\n" "$@" >&1
}

warning() {
	local mesg=$1; shift
	printf "${YELLOW_MSG}==> $(gettext "WARNING:")${ALL_OFF_MSG}${BOLD_MSG} ${mesg}${ALL_OFF_MSG}\n" "$@" >&2
}

warning2() {
	local mesg=$1; shift
	printf "${YELLOW_MSG}  -> $(gettext "WARNING:")${ALL_OFF_MSG}${BOLD_MSG} ${mesg}${ALL_OFF_MSG}\n" "$@" >&2
}

error() {
	local mesg=$1; shift
	printf "${RED_MSG}==> $(gettext "ERROR:")${ALL_OFF_MSG}${BOLD_MSG} ${mesg}${ALL_OFF_MSG}\n" "$@" >&2
}

error2() {
	local mesg=$1; shift
	printf "${RED_MSG}  -> $(gettext "ERROR:")${ALL_OFF_MSG}${BOLD_MSG} ${mesg}${ALL_OFF_MSG}\n" "$@" >&2
}

abort() {
	local mesg=$1; shift
    printf "${MAGENTA_MSG}\n====> $(gettext "ABORTING....\n")${ALL_OFF_MSG}" >&2
    printf "${BLUE_MSG}    ->${ALL_OFF_MSG}${BOLD_MSG} ${mesg}${ALL_OFF_MSG}\n\n" "$@" >&2
    exit 1
}

interrupted() {
    printf "${RED_MSG}\n==> $(gettext "ERROR:")${ALL_OFF_MSG}${BOLD_MSG} Interrupted${ALL_OFF_MSG}\n" >&2
	exit 1
}

# helper: call it in the script
check_have_gettext() {
    local script_path=$1
    if [ ! "$(type -p gettext)" ]; then
        printf "${MAGENTA_MSG}\n====> ABORTING....\n${ALL_OFF_MSG}" >&2
        printf "${BLUE_MSG}    ->${ALL_OFF_MSG}${BOLD_MSG} Command 'gettext' not found. It is needed to run script: <%s>${ALL_OFF_MSG}\n\n" "$script_path" >&2
        exit 1
    fi
}

# End of file
