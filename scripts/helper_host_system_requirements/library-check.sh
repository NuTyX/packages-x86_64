#!/bin/bash

THIS_SCRIPT_PATH="$(readlink -f "$(type -P $0 || echo $0)")"
THIS_SCRIPT_DIR="$(dirname "$THIS_SCRIPT_PATH")"
source $THIS_SCRIPT_DIR/../color_messages.sh
trap "interrupted" SIGHUP SIGINT SIGQUIT SIGTERM

color_mesg
check_have_gettext  $THIS_SCRIPT_PATH

#**********************************************************************************************************************

echo
msg "$(gettext "Checking for some library consistency...")"
echo

check_library_consistency() {
    local lib
    for lib in lib{gmp,mpfr,mpc}.la; do
        if $(find /usr/lib* -name $lib| grep -q $lib); then
            plain2 "$(gettext "%s: found")" "$lib"
        else 
            plain2 "$(gettext "%s: not found")" "$lib"
        fi
    done

    echo
    msg "$(gettext "NOTE....")"
    msg2 "$(gettext "The files identified by this script should be all present")"
    msg2 "$(gettext "          or all absent, but not only one or two present.")"
    echo
}

check_library_consistency
