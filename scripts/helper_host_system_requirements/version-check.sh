#!/bin/bash

THIS_SCRIPT_PATH="$(readlink -f "$(type -P $0 || echo $0)")"
THIS_SCRIPT_DIR="$(dirname "$THIS_SCRIPT_PATH")"
source $THIS_SCRIPT_DIR/../color_messages.sh
trap "interrupted" SIGHUP SIGINT SIGQUIT SIGTERM

color_mesg
check_have_gettext  $THIS_SCRIPT_PATH

    
#**********************************************************************************************************************
# Helper Functions
#**********************************************************************************************************************

check_bash() {
    msg "$(gettext "Checking: Bash")"
    plain2 "$(gettext "bash: %s")" "$(bash --version | head -n1 | cut -d" " -f2-4)"

    msg2 "$(gettext "/bin/sh should be a symbolic or hard link to bash")"
    local MYSH=$(readlink -f /bin/sh)
    if $(echo $MYSH | grep -q bash); then
        plain2 "$(gettext "/bin/sh -> %s is a link")" "$MYSH"
    else
        error2 "$(gettext "/bin/sh does not point to bash")"
    fi
}

check_bison() {
    msg "$(gettext "Checking: Bison")"
    plain2 "$(gettext "bison: %s")" "$(bison --version | head -n1)"
    
    msg2 "$(gettext "/usr/bin/yacc should be a link to bison or small script that executes bison")"
    if [ -h /usr/bin/yacc ]; then
        plain2 "$(gettext "/usr/bin/yacc -> %s")" "$(readlink -f /usr/bin/yacc)"
    elif [ -x /usr/bin/yacc ]; then
        plain2 "$(gettext "yacc is %s")" "$(/usr/bin/yacc --version | head -n1)"
    else
        error2 "$(gettext "/usr/bin/yacc not found")"
    fi
}

check_gawk() {
    msg "$(gettext "Checking: Gawk")"
    plain2 "$(gettext "gawk: %s")" "$(gawk --version | head -n1)"

    msg2 "$(gettext "/usr/bin/awk should be a link to gawk")"
    if [ -h /usr/bin/awk ]; then
         plain2 "$(gettext "/usr/bin/awk -> %s")" "$(readlink -f /usr/bin/awk)"
    elif [ -x /usr/bin/awk ]; then
      plain2 "$(gettext "awk is %s")" "$(/usr/bin/awk --version | head -n1)"
    else 
        error2 "$(gettext "/usr/bin/awk not found")"
    fi
}

check_gcc() {
    msg "$(gettext "Checking: Gcc (including the C++ compiler)")"
    plain2 "$(gettext "gcc: %s")" "$(gcc --version | head -n1)"
    plain2 "$(gettext "g++: %s")" "$(g++ --version | head -n1)"
    
    msg2 "$(gettext "Testing g++ compilation")"

    echo 'int main(){}' > dummy.c && g++ -o dummy dummy.c
    if [ -x dummy ]; then 
        plain2 "$(gettext "g++ compilation: OK")"
    else 
        error2 "$(gettext "g++ compilation: FAILED")"
    fi
    rm -f dummy.c dummy
}

#**********************************************************************************************************************

echo
msg "$(gettext "Listing version numbers of critical development tools...")"
echo

export LC_ALL=C


check_bash

msg "$(gettext "Checking: Binutils")"
plain2 "$(gettext "binutils: %s")" "$(ld --version | head -n1 | cut -d" " -f3-)"

check_bison

msg "$(gettext "Checking: Bzip2")"
plain2 "$(gettext "bzip2: %s")" "$(bzip2 --version 2>&1 < /dev/null | head -n1 | cut -d" " -f1,6-)"

msg "$(gettext "Checking: Coreutils")"
plain2 "$(gettext "coreutils: %s")" "$(chown --version | head -n1 | cut -d")" -f2)"

msg "$(gettext "Checking: Diffutils")"
plain2 "$(gettext "diffutils: %s")" "$(diff --version | head -n1)"

msg "$(gettext "Checking: Findutils")"
plain2 "$(gettext "find: %s")" "$(find --version | head -n1)"

check_gawk

check_gcc

msg "$(gettext "Checking: Glibc")"
plain2 "$(gettext "glibc: %s")" "$(ldd --version | head -n1 | cut -d" " -f2-)"

msg "$(gettext "Checking: Grep")"
plain2 "$(gettext "grep: %s")" "$(grep --version | head -n1)"

msg "$(gettext "Checking: Gzip")"
plain2 "$(gettext "gzip: %s")" "$(gzip --version | head -n1)"

msg "$(gettext "Checking: Linux Kernel")"
plain2 "$(gettext "Linux Kernel: %s")" "$(cat /proc/version))"

msg "$(gettext "Checking: M4")"
plain2 "$(gettext "m4: %s")" "$(m4 --version | head -n1)"

msg "$(gettext "Checking: Make")"
plain2 "$(gettext "make: %s")" "$(make --version | head -n1)"

msg "$(gettext "Checking: Patch")"
plain2 "$(gettext "patch: %s")" "$(patch --version | head -n1)"

msg "$(gettext "Checking: Perl")"
plain2 "$(gettext "perl: %s")" "$(perl -V:version)"

msg "$(gettext "Checking: Sed")"
plain2 "$(gettext "sed: %s")" "$(sed --version | head -n1)"

msg "$(gettext "Checking: Tar")"
plain2 "$(gettext "tar: %s")" "$(tar --version | head -n1)"

msg "$(gettext "Checking: mMkeinfo")"
plain2 "$(gettext "makeinfo: %s")" "$(makeinfo --version | head -n1)"

msg "$(gettext "Checking: Xz")"
plain2 "$(gettext "xz: %s")" "$(xz --version | head -n1)"

msg "$(gettext "Checking: Git")"
plain2 "$(gettext "git: %s")" "$(git --version | head -n1)"

msg "$(gettext "Checking: Wget")"
plain2 "$(gettext "wget: %s")" "$(wget --version | head -n1)"

