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

all: install-nutyx setup-nutyx xdm-nutyx flushmem ifup ifdown which mkinitramfs configvm startvm

%: %.in
	sed -e "s/#VERSION#/$(VERSION)/" $< > $@


.PHONY:	install clean distclean dist

install: all
	install -D -m0755 install-nutyx $(SBINDIR)/install-nutyx
	install -D -m0755 setup-nutyx $(SBINDIR)/setup-nutyx
	install -D -m0755 xdm-nutyx $(USRSBINDIR)/xdm-nutyx
	install -D -m0755 flushmem $(SBINDIR)/flushmem
	install -D -m0755 ifup $(SBINDIR)/ifup
	install -D -m0755 ifdown  $(SBINDIR)/ifdown
	install -D -m0755 mkinitramfs $(SBINDIR)/mkinitramfs
	install -D -m0755 which $(BINDIR)/which
	install -D -m0755 configvm $(BINDIR)/configvm
	install -D -m0755 startvm $(BINDIR)/startvm


clean:
	rm -f install-nutyx
	rm -f setup-nutyx
	rm -f xdm-nutyx
	rm -f flushmem
	rm -f ifup
	rm -f ifdown
	rm -f which
	rm -f mkinitramfs
	rm -f configvm
	rm -f startvm

distclean: clean

# End of file
