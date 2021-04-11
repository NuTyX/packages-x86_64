#
#  nutyx
#
#  Copyright (c) 2016 - 2021 by NuTyX team (http://nutyx.org)
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
#  USA.
#


DESTDIR =

LIBDIR = ${DESTDIR}/lib
USRBINDIR = ${DESTDIR}/usr/bin
USRSBINDIR = ${DESTDIR}/usr/sbin
BINDIR = ${DESTDIR}/bin
SBINDIR = ${DESTDIR}/sbin
MANDIR = ${DESTDIR}/usr/share/man
USRLIBDIR = ${DESTDIR}/usr/lib
ETCDIR = ${DESTDIR}/etc
SERVICEDIR=${LIBDIR}/services
ROOTDIR=${DESTDIR}/root
VARDIR=${DESTDIR}/var
EXTDIR=${ETCDIR}

VERSION = 21.03.0-rc4

NAME = nutyx-$(VERSION)

MODE = 754
FILEMODE = 754
DIRMODE = 755
CONFMODE = 644

# End of file
