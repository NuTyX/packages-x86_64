#
#  nutyx
#
#  Copyright (c) 2016 by NuTyX team (http://nutyx.org)
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

include ../Makefile.inc

all:


.PHONY:	install clean distclean

create-dirs:
	install -d -m 755 $(SERVICEDIR)
	install -d -m 755 $(SERVICEDIR)/setup-nutyx
	install -d -m 755 $(VARDIR)/log
	install -d -m 700 $(ROOTDIR)
	install -d -m 755 $(ETCDIR)/X11/xorg.conf.d
	install -d -m 755 $(ETCDIR)/rc.d/init.d
	install -d -m 755 $(ETCDIR)/rc.d/rc0.d
	install -d -m 755 $(ETCDIR)/rc.d/rc1.d
	install -d -m 755 $(ETCDIR)/rc.d/rc2.d
	install -d -m 755 $(ETCDIR)/rc.d/rc3.d
	install -d -m 755 $(ETCDIR)/rc.d/rc4.d
	install -d -m 755 $(ETCDIR)/rc.d/rc5.d
	install -d -m 755 $(ETCDIR)/rc.d/rc6.d
	install -d -m 755 $(ETCDIR)/rc.d/rcS.d
	ln -sf rc.d/init.d $(ETCDIR)/init.d
		

files: create-dirs
	for FILE in halt init_single localnet modules network rc reboot \
sendsignals setclock sysklogd template random; do \
		install -m 754 etc/init.d/$${FILE} \
$(ETCDIR)/init.d/$${FILE}; \
	done
	install -m 755 lib/dhcpcd $(SERVICEDIR)/dhcpcd
	install -m 755 lib/ipv4-static $(SERVICEDIR)/ipv4-static
	install -m 755 lib/ipv4-static-route $(SERVICEDIR)/ipv4-static-route
	install -m 644 lib/init-functions $(SERVICEDIR)/init-functions
	install -m 644 lib/init.in	$(SERVICEDIR)/init.in
	bsdtar -czf $(SERVICEDIR)/setup-nutyx/setup-nutyx.locales.gz \
		lib/setup-nutyx.* lib/xdg-user-dirs.* lib/dialog.* \
                lib/util-linux.*
	for FILE in bootlog btmp lastlog wtmp; do \
		touch $(VARDIR)/log/$${FILE}; \
	done
links: rcS rc0 rc1 rc2 rc3 rc4 rc5 rc6
	ln -sf ../../../sbin/setup-nutyx $(ETCDIR)/rc.d/init.d/setup-nutyx
	ln -sf ../proc/self/mounts $(ETCDIR)/mtab
	ln -sf /usr/share/X11/xorg.conf.d/50-synaptics.conf $(ETCDIR)/X11/xorg.conf.d/50-synaptics.conf
	ln -sf ../etc/bashrc $(ROOTDIR)/bashrc
	ln -sf ../etc/profile.d $(ROOTDIR)/profile.d
	ln -sf services  $(LIBDIR)/lsb
	ln -sf /run/lock $(VARDIR)/lock
	ln -sf /run	 $(VARDIR)/run

rcS: files
	ln -sf ../init.d/init_single ${ETCDIR}/rc.d/rcS.d/S00init_single

rc0: files
	ln -sf ../init.d/sendsignals	${ETCDIR}/rc.d/rc0.d/S60sendsignals
	ln -sf ../init.d/init_single	${ETCDIR}/rc.d/rc0.d/K98init_single
	ln -sf ../init.d/halt		${ETCDIR}/rc.d/rc0.d/S99halt
	ln -sf ../init.d/random		${ETCDIR}/rc.d/rc0.d/K45random

rc1: files
	ln -sf ../init.d/network	${ETCDIR}/rc.d/rc1.d/K80network
	ln -sf ../init.d/sysklogd	${ETCDIR}/rc.d/rc1.d/K90sysklogd
	ln -sf ../init.d/random		${ETCDIR}/rc.d/rc1.d/S25random

rc2: files
	ln -sf ../init.d/network        ${ETCDIR}/rc.d/rc2.d/K80network
	ln -sf ../init.d/random         ${ETCDIR}/rc.d/rc2.d/S25random

rc3: files
	ln -sf ../init.d/network        ${ETCDIR}/rc.d/rc3.d/S20network
	ln -sf ../init.d/random		${ETCDIR}/rc.d/rc3.d/S25random

rc4: files
	ln -sf ../init.d/network        ${ETCDIR}/rc.d/rc4.d/S20network
	ln -sf ../init.d/random         ${ETCDIR}/rc.d/rc4.d/S25random

rc5: files
	ln -sf ../init.d/network        ${ETCDIR}/rc.d/rc5.d/S20network
	ln -sf ../init.d/random		${ETCDIR}/rc.d/rc5.d/S25random

rc6: files
	ln -sf ../init.d/sendsignals 	${ETCDIR}/rc.d/rc6.d/S60sendsignals
	ln -sf ../init.d/init_single	${ETCDIR}/rc.d/rc6.d/K98init_single
	ln -sf ../init.d/random		${ETCDIR}/rc.d/rc6.d/K45random
	ln -sf ../init.d/reboot		${ETCDIR}/rc.d/rc6.d/S99reboot

install: links

clean:

distclean: clean

# End of file
