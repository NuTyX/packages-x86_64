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

files: create-dirs
	install -m 644 lib/init-functions $(SERVICEDIR)/init-functions
	install -m 644 lib/init.in	$(SERVICEDIR)/init.in
	for EXT in ar da de es fi fr it nl nn pt sv tr ru; do \
		install -m 644 lib/setup-nutyx.$${EXT} \
$(SERVICEDIR)/setup-nutyx/setup-nutyx.$${EXT}; \
	done

links: 	ln -sf ../proc/self/mounts $(ETCDIR)/mtab
	ln -sf /usr/share/X11/xorg.conf.d/50-synaptics.conf $(ETCDIR)/X11/xorg.conf.d/50-synaptics.conf
	ln -sf ../etc/bashrc $(ROOTDIR)/bashrc
	ln -sf ../etc/fstab $(ROOTDIR)/fstab
	ln -sf ../etc/profile.d $(ROOTDIR)/profile.d
	ln -sf services  $(LIBDIR)/lsb
	ln -sf /run/lock $(VARDIR)/lock
	ln -sf /run	 $(VARDIR)/run

install: links

clean:

distclean: clean

# End of file
