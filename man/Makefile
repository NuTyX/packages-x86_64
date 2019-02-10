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

MANPAGES = nutyx.1 ifup.8

all: man mantxt

man: $(MANPAGES)

mantxt: man $(MANPAGES:=.txt)

%.1.txt: %.1
	nroff -mandoc -c $< | col -bx > $@

%.8.txt: %.8
	nroff -mandoc -c $< | col -bx > $@

%.fr.txt: %.fr
	nroff -mandoc -c $< | col -bx > $@

%.5.txt: %.5
	nroff -mandoc -c $< | col -bx > $@

%: %.in
	sed -e "s/#VERSION#/$(VERSION)/" $< > $@


install: all
	install -D -m0644 nutyx.1 $(MANDIR)/man1/nutyx.1
	install -D -m0644 ifup.8 $(MANDIR)/man8/ifup.8

clean:
	rm -f $(MANPAGES)
	rm -f $(MANPAGES:=.txt)

# End of file
