SHELL=/bin/bash

ETCDIR=/etc
LIBDIR=${DESTDIR}/lib/services
EXTDIR=${DESTDIR}${ETCDIR}
MODE=754
DIRMODE=755
CONFMODE=644

all:
	@grep "^install" Makefile | cut -d ":" -f 1
	@echo "Select an appropriate install target from the above list"

create-dirs:
	install -d -m ${DIRMODE} ${EXTDIR}/rc.d/rc{0,1,2,3,4,5,6,S}.d
	install -d -m ${DIRMODE} ${EXTDIR}/rc.d/init.d
	install -d -m ${DIRMODE} ${EXTDIR}/sysconfig

create-service-dir:
	install -d -m ${DIRMODE} ${LIBDIR}

install-service-dhclient: create-service-dir
	install -m ${MODE} services/dhclient ${LIBDIR}

install-service-dhcpcd: create-service-dir
	install -m ${MODE} services/dhcpcd  ${LIBDIR}

install-service-bridge: create-service-dir
	install -m ${MODE} services/bridge  ${LIBDIR}

install-service-ipx: create-service-dir
	install -m ${MODE} services/ipx ${LIBDIR}

install-service-pppoe: create-service-dir
	install -m ${MODE} services/pppoe  ${LIBDIR}
	install -d -m ${DIRMODE} ${EXTDIR}/ppp/peers
	install -m ${CONFMODE} ppp/pppoe ${EXTDIR}/ppp/peers

install-service-wpa: create-service-dir
	install -m ${MODE} services/wpa ${LIBDIR}

install-acpid: create-dirs
	install -m ${MODE} init.d/acpid       ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/acpid ${EXTDIR}/rc.d/rc0.d/K32acpid
	ln -sf  ../init.d/acpid ${EXTDIR}/rc.d/rc1.d/K32acpid
	ln -sf  ../init.d/acpid ${EXTDIR}/rc.d/rc2.d/S18acpid
	ln -sf  ../init.d/acpid ${EXTDIR}/rc.d/rc3.d/S18acpid
	ln -sf  ../init.d/acpid ${EXTDIR}/rc.d/rc4.d/S18acpid
	ln -sf  ../init.d/acpid ${EXTDIR}/rc.d/rc5.d/S18acpid
	ln -sf  ../init.d/acpid ${EXTDIR}/rc.d/rc6.d/K32acpid

install-alsa: create-dirs
	install -m ${MODE} init.d/alsa       ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/alsa ${EXTDIR}/rc.d/rc0.d/K35alsa
	ln -sf  ../init.d/alsa ${EXTDIR}/rc.d/rc1.d/K35alsa
	ln -sf  ../init.d/alsa ${EXTDIR}/rc.d/rc6.d/K35alsa
	ln -sf  ../init.d/alsa ${EXTDIR}/rc.d/rcS.d/S60alsa

install-httpd: create-dirs
	install -m ${MODE} init.d/httpd     ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/httpd ${EXTDIR}/rc.d/rc0.d/K28httpd
	ln -sf  ../init.d/httpd ${EXTDIR}/rc.d/rc1.d/K28httpd
	ln -sf  ../init.d/httpd ${EXTDIR}/rc.d/rc2.d/K28httpd
	ln -sf  ../init.d/httpd ${EXTDIR}/rc.d/rc3.d/S32httpd
	ln -sf  ../init.d/httpd ${EXTDIR}/rc.d/rc4.d/S32httpd
	ln -sf  ../init.d/httpd ${EXTDIR}/rc.d/rc5.d/S32httpd
	ln -sf  ../init.d/httpd ${EXTDIR}/rc.d/rc6.d/K28httpd

install-php: create-dirs
	install -m ${MODE} init.d/php-fpm     ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/php-fpm ${EXTDIR}/rc.d/rc0.d/K28php-fpm
	ln -sf  ../init.d/php-fpm ${EXTDIR}/rc.d/rc1.d/K28php-fpm
	ln -sf  ../init.d/php-fpm ${EXTDIR}/rc.d/rc2.d/K28php-fpm
	ln -sf  ../init.d/php-fpm ${EXTDIR}/rc.d/rc3.d/S32php-fpm
	ln -sf  ../init.d/php-fpm ${EXTDIR}/rc.d/rc4.d/S32php-fpm
	ln -sf  ../init.d/php-fpm ${EXTDIR}/rc.d/rc5.d/S32php-fpm
	ln -sf  ../init.d/php-fpm ${EXTDIR}/rc.d/rc6.d/K28php-fpm

install-autofs: create-dirs
	install -m $(MODE) init.d/autofs    $(EXTDIR)/rc.d/init.d/
	install -m $(CONFMODE) sysconfig/autofs.conf $(EXTDIR)/sysconfig/
	ln -sf  ../init.d/autofs $(EXTDIR)/rc.d/rcS.d/S52autofs

install-atd: create-dirs
	install -m ${MODE} init.d/atd       ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/atd ${EXTDIR}/rc.d/rc0.d/K29atd
	ln -sf  ../init.d/atd ${EXTDIR}/rc.d/rc1.d/K29atd
	ln -sf  ../init.d/atd ${EXTDIR}/rc.d/rc2.d/S68atd
	ln -sf  ../init.d/atd ${EXTDIR}/rc.d/rc3.d/S68atd
	ln -sf  ../init.d/atd ${EXTDIR}/rc.d/rc4.d/S68atd
	ln -sf  ../init.d/atd ${EXTDIR}/rc.d/rc5.d/S68atd
	ln -sf  ../init.d/atd ${EXTDIR}/rc.d/rc6.d/K29atd

install-avahi: create-dirs
	install -m ${MODE} init.d/avahi     ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/avahi ${EXTDIR}/rc.d/rc0.d/K28avahi
	ln -sf  ../init.d/avahi ${EXTDIR}/rc.d/rc1.d/K28avahi
	ln -sf  ../init.d/avahi ${EXTDIR}/rc.d/rc2.d/S34avahi
	ln -sf  ../init.d/avahi ${EXTDIR}/rc.d/rc3.d/S34avahi
	ln -sf  ../init.d/avahi ${EXTDIR}/rc.d/rc4.d/S34avahi
	ln -sf  ../init.d/avahi ${EXTDIR}/rc.d/rc5.d/S34avahi
	ln -sf  ../init.d/avahi ${EXTDIR}/rc.d/rc6.d/K28avahi

install-bind: create-dirs
	install -m ${MODE} init.d/bind       ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/bind ${EXTDIR}/rc.d/rc0.d/K49bind
	ln -sf  ../init.d/bind ${EXTDIR}/rc.d/rc1.d/K49bind
	ln -sf  ../init.d/bind ${EXTDIR}/rc.d/rc2.d/K49bind
	ln -sf  ../init.d/bind ${EXTDIR}/rc.d/rc3.d/S22bind
	ln -sf  ../init.d/bind ${EXTDIR}/rc.d/rc4.d/S22bind
	ln -sf  ../init.d/bind ${EXTDIR}/rc.d/rc5.d/S22bind
	ln -sf  ../init.d/bind ${EXTDIR}/rc.d/rc6.d/K49bind

install-bluetooth: create-dirs
	install -m ${MODE} init.d/bluetooth ${EXTDIR}/rc.d/init.d/bluetooth
	install -m ${CONFMODE} sysconfig/bluetooth ${EXTDIR}/sysconfig/bluetooth
	ln -sf  ../init.d/bluetooth ${EXTDIR}/rc.d/rc0.d/K27bluetooth
	ln -sf  ../init.d/bluetooth ${EXTDIR}/rc.d/rc1.d/K27bluetooth
	ln -sf  ../init.d/bluetooth ${EXTDIR}/rc.d/rc2.d/S35bluetooth
	ln -sf  ../init.d/bluetooth ${EXTDIR}/rc.d/rc3.d/S35bluetooth
	ln -sf  ../init.d/bluetooth ${EXTDIR}/rc.d/rc4.d/S35bluetooth
	ln -sf  ../init.d/bluetooth ${EXTDIR}/rc.d/rc5.d/S35bluetooth
	ln -sf  ../init.d/bluetooth ${EXTDIR}/rc.d/rc6.d/K27bluetooth

install-cups: create-dirs
	install -m ${MODE} init.d/cups       ${EXTDIR}/rc.d/init.d/
	rm -f ${EXTDIR}/rc.d/rc0.d/K36cups
	rm -f ${EXTDIR}/rc.d/rc2.d/K36cups
	rm -f ${EXTDIR}/rc.d/rc3.d/K36cups
	rm -f ${EXTDIR}/rc.d/rc5.d/K36cups
	rm -f ${EXTDIR}/rc.d/rc2.d/S81cups
	rm -f ${EXTDIR}/rc.d/rc3.d/S81cups
	rm -f ${EXTDIR}/rc.d/rc5.d/S81cups
	ln -sf  ../init.d/cups ${EXTDIR}/rc.d/rc0.d/K00cups
	ln -sf  ../init.d/cups ${EXTDIR}/rc.d/rc1.d/K00cups
	ln -sf  ../init.d/cups ${EXTDIR}/rc.d/rc2.d/S25cups
	ln -sf  ../init.d/cups ${EXTDIR}/rc.d/rc3.d/S25cups
	ln -sf  ../init.d/cups ${EXTDIR}/rc.d/rc4.d/S25cups
	ln -sf  ../init.d/cups ${EXTDIR}/rc.d/rc5.d/S25cups
	ln -sf  ../init.d/cups ${EXTDIR}/rc.d/rc6.d/K00cups

install-saslauthd: create-dirs
	install -m ${MODE} init.d/saslauthd ${EXTDIR}/rc.d/init.d/saslauthd
	install -m ${CONFMODE} sysconfig/saslauthd ${EXTDIR}/sysconfig/saslauthd
	ln -sf  ../init.d/saslauthd ${EXTDIR}/rc.d/rc0.d/K49saslauthd
	ln -sf  ../init.d/saslauthd ${EXTDIR}/rc.d/rc1.d/K49saslauthd
	ln -sf  ../init.d/saslauthd ${EXTDIR}/rc.d/rc2.d/S24saslauthd
	ln -sf  ../init.d/saslauthd ${EXTDIR}/rc.d/rc3.d/S24saslauthd
	ln -sf  ../init.d/saslauthd ${EXTDIR}/rc.d/rc4.d/S24saslauthd
	ln -sf  ../init.d/saslauthd ${EXTDIR}/rc.d/rc5.d/S24saslauthd
	ln -sf  ../init.d/saslauthd ${EXTDIR}/rc.d/rc6.d/K49saslauthd

install-dbus: create-dirs
	install -m ${MODE} init.d/dbus ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/dbus ${EXTDIR}/rc.d/rc0.d/K85dbus
	ln -sf  ../init.d/dbus ${EXTDIR}/rc.d/rc1.d/K85dbus
	ln -sf  ../init.d/dbus ${EXTDIR}/rc.d/rc2.d/S15dbus
	ln -sf  ../init.d/dbus ${EXTDIR}/rc.d/rc3.d/S15dbus
	ln -sf  ../init.d/dbus ${EXTDIR}/rc.d/rc4.d/S15dbus
	ln -sf  ../init.d/dbus ${EXTDIR}/rc.d/rc5.d/S15dbus
	ln -sf  ../init.d/dbus ${EXTDIR}/rc.d/rc6.d/K85dbus

install-dovecot: create-dirs
	install -m ${MODE} init.d/dovecot       ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/dovecot ${EXTDIR}/rc.d/rc0.d/K78dovecot
	ln -sf  ../init.d/dovecot ${EXTDIR}/rc.d/rc1.d/K78dovecot
	ln -sf  ../init.d/dovecot ${EXTDIR}/rc.d/rc2.d/K78dovecot
	ln -sf  ../init.d/dovecot ${EXTDIR}/rc.d/rc3.d/S27dovecot
	ln -sf  ../init.d/dovecot ${EXTDIR}/rc.d/rc4.d/S27dovecot
	ln -sf  ../init.d/dovecot ${EXTDIR}/rc.d/rc5.d/S27dovecot
	ln -sf  ../init.d/dovecot ${EXTDIR}/rc.d/rc6.d/K78dovecot

install-wicd: create-dirs
	install -m ${MODE} init.d/wicd ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/wicd ${EXTDIR}/rc.d/rc0.d/K20wicd
	ln -sf  ../init.d/wicd ${EXTDIR}/rc.d/rc1.d/K20wicd
	ln -sf  ../init.d/wicd ${EXTDIR}/rc.d/rc2.d/S30wicd
	ln -sf  ../init.d/wicd ${EXTDIR}/rc.d/rc3.d/S30wicd
	ln -sf  ../init.d/wicd ${EXTDIR}/rc.d/rc4.d/S30wicd
	ln -sf  ../init.d/wicd ${EXTDIR}/rc.d/rc5.d/S30wicd
	ln -sf  ../init.d/wicd ${EXTDIR}/rc.d/rc6.d/K20wicd

install-dhcpd: create-dirs
	install -m ${MODE} init.d/dhcpd       ${EXTDIR}/rc.d/init.d/dhcpd
	install -m ${CONFMODE} sysconfig/dhcpd ${EXTDIR}/sysconfig/dhcpd
	ln -sf  ../init.d/dhcpd ${EXTDIR}/rc.d/rc0.d/K30dhcpd
	ln -sf  ../init.d/dhcpd ${EXTDIR}/rc.d/rc1.d/K30dhcpd
	ln -sf  ../init.d/dhcpd ${EXTDIR}/rc.d/rc2.d/K30dhcpd
	ln -sf  ../init.d/dhcpd ${EXTDIR}/rc.d/rc3.d/S30dhcpd
	ln -sf  ../init.d/dhcpd ${EXTDIR}/rc.d/rc4.d/S30dhcpd
	ln -sf  ../init.d/dhcpd ${EXTDIR}/rc.d/rc5.d/S30dhcpd
	ln -sf  ../init.d/dhcpd ${EXTDIR}/rc.d/rc6.d/K30dhcpd

install-exim: create-dirs
	install -m ${MODE} init.d/exim       ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/exim ${EXTDIR}/rc.d/rc0.d/K25exim
	ln -sf  ../init.d/exim ${EXTDIR}/rc.d/rc1.d/K25exim
	ln -sf  ../init.d/exim ${EXTDIR}/rc.d/rc2.d/K25exim
	ln -sf  ../init.d/exim ${EXTDIR}/rc.d/rc3.d/S35exim
	ln -sf  ../init.d/exim ${EXTDIR}/rc.d/rc4.d/S35exim
	ln -sf  ../init.d/exim ${EXTDIR}/rc.d/rc5.d/S35exim
	ln -sf  ../init.d/exim ${EXTDIR}/rc.d/rc6.d/K25exim

install-fcron: create-dirs
	install -m ${MODE} init.d/fcron      ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/fcron ${EXTDIR}/rc.d/rc0.d/K08fcron
	ln -sf  ../init.d/fcron ${EXTDIR}/rc.d/rc1.d/K08fcron
	ln -sf  ../init.d/fcron ${EXTDIR}/rc.d/rc2.d/S40fcron
	ln -sf  ../init.d/fcron ${EXTDIR}/rc.d/rc3.d/S40fcron
	ln -sf  ../init.d/fcron ${EXTDIR}/rc.d/rc4.d/S40fcron
	ln -sf  ../init.d/fcron ${EXTDIR}/rc.d/rc5.d/S40fcron
	ln -sf  ../init.d/fcron ${EXTDIR}/rc.d/rc6.d/K08fcron

install-gdm: create-dirs
	install -m ${MODE} init.d/gdm        ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/gdm ${EXTDIR}/rc.d/rc0.d/K05gdm
	ln -sf  ../init.d/gdm ${EXTDIR}/rc.d/rc1.d/K05gdm
	ln -sf  ../init.d/gdm ${EXTDIR}/rc.d/rc2.d/K05gdm
	ln -sf  ../init.d/gdm ${EXTDIR}/rc.d/rc3.d/K05gdm
	ln -sf  ../init.d/gdm ${EXTDIR}/rc.d/rc4.d/K05gdm
	ln -sf  ../init.d/gdm ${EXTDIR}/rc.d/rc5.d/S95gdm
	ln -sf  ../init.d/gdm ${EXTDIR}/rc.d/rc6.d/K05gdm

install-gpm: create-dirs
	install -m ${MODE} init.d/gpm        ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/gpm ${EXTDIR}/rc.d/rc0.d/K10gpm
	ln -sf  ../init.d/gpm ${EXTDIR}/rc.d/rc1.d/K10gpm
	ln -sf  ../init.d/gpm ${EXTDIR}/rc.d/rc2.d/S70gpm
	ln -sf  ../init.d/gpm ${EXTDIR}/rc.d/rc3.d/S70gpm
	ln -sf  ../init.d/gpm ${EXTDIR}/rc.d/rc4.d/S70gpm
	ln -sf  ../init.d/gpm ${EXTDIR}/rc.d/rc5.d/S70gpm
	ln -sf  ../init.d/gpm ${EXTDIR}/rc.d/rc6.d/K10gpm

install-haveged: create-dirs
	install -m ${MODE} init.d/haveged        ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/haveged ${EXTDIR}/rc.d/rc0.d/K90haveged
	ln -sf  ../init.d/haveged ${EXTDIR}/rc.d/rc1.d/K90haveged
	ln -sf  ../init.d/haveged ${EXTDIR}/rc.d/rc2.d/K90haveged
	ln -sf  ../init.d/haveged ${EXTDIR}/rc.d/rc3.d/S21haveged
	ln -sf  ../init.d/haveged ${EXTDIR}/rc.d/rc4.d/S21haveged
	ln -sf  ../init.d/haveged ${EXTDIR}/rc.d/rc5.d/S21haveged
	ln -sf  ../init.d/haveged ${EXTDIR}/rc.d/rc6.d/K90haveged

install-heimdal: create-dirs
	install -m ${MODE} init.d/heimdal        ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/heimdal ${EXTDIR}/rc.d/rc0.d/K42heimdal
	ln -sf  ../init.d/heimdal ${EXTDIR}/rc.d/rc1.d/K42heimdal
	ln -sf  ../init.d/heimdal ${EXTDIR}/rc.d/rc2.d/K42heimdal
	ln -sf  ../init.d/heimdal ${EXTDIR}/rc.d/rc3.d/S28heimdal
	ln -sf  ../init.d/heimdal ${EXTDIR}/rc.d/rc4.d/S28heimdal
	ln -sf  ../init.d/heimdal ${EXTDIR}/rc.d/rc5.d/S28heimdal
	ln -sf  ../init.d/heimdal ${EXTDIR}/rc.d/rc6.d/K42heimdal

install-iptables: create-dirs
	install -m ${MODE} init.d/iptables        ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/iptables ${EXTDIR}/rc.d/rc3.d/S19iptables
	ln -sf  ../init.d/iptables ${EXTDIR}/rc.d/rc4.d/S19iptables
	ln -sf  ../init.d/iptables ${EXTDIR}/rc.d/rc5.d/S19iptables

install-krb5: create-dirs
	install -m ${MODE} init.d/krb5 ${EXTDIR}/rc.d/init.d/
	ln -sf ../init.d/krb5 ${EXTDIR}/rc.d/rc0.d/K42krb5
	ln -sf ../init.d/krb5 ${EXTDIR}/rc.d/rc1.d/K42krb5
	ln -sf ../init.d/krb5 ${EXTDIR}/rc.d/rc2.d/K42krb5
	ln -sf ../init.d/krb5 ${EXTDIR}/rc.d/rc3.d/S28krb5
	ln -sf ../init.d/krb5 ${EXTDIR}/rc.d/rc4.d/S28krb5
	ln -sf ../init.d/krb5 ${EXTDIR}/rc.d/rc5.d/S28krb5
	ln -sf ../init.d/krb5 ${EXTDIR}/rc.d/rc6.d/K42krb5

install-lprng: create-dirs
	install -m ${MODE} init.d/lprng      ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/lprng ${EXTDIR}/rc.d/rc0.d/K00lprng
	ln -sf  ../init.d/lprng ${EXTDIR}/rc.d/rc1.d/K00lprng
	ln -sf  ../init.d/lprng ${EXTDIR}/rc.d/rc2.d/S99lprng
	ln -sf  ../init.d/lprng ${EXTDIR}/rc.d/rc3.d/S99lprng
	ln -sf  ../init.d/lprng ${EXTDIR}/rc.d/rc4.d/S99lprng
	ln -sf  ../init.d/lprng ${EXTDIR}/rc.d/rc5.d/S99lprng
	ln -sf  ../init.d/lprng ${EXTDIR}/rc.d/rc6.d/K00lprng

install-lxdm: create-dirs
	install -m ${MODE} init.d/lxdm        ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/lxdm ${EXTDIR}/rc.d/rc0.d/K05lxdm
	ln -sf  ../init.d/lxdm ${EXTDIR}/rc.d/rc1.d/K05lxdm
	ln -sf  ../init.d/lxdm ${EXTDIR}/rc.d/rc2.d/K05lxdm
	ln -sf  ../init.d/lxdm ${EXTDIR}/rc.d/rc3.d/K05lxdm
	ln -sf  ../init.d/lxdm ${EXTDIR}/rc.d/rc4.d/K05lxdm
	ln -sf  ../init.d/lxdm ${EXTDIR}/rc.d/rc5.d/S95lxdm
	ln -sf  ../init.d/lxdm ${EXTDIR}/rc.d/rc6.d/K05lxdm

install-mysql: create-dirs
	install -m ${MODE} init.d/mysql      ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/mysql ${EXTDIR}/rc.d/rc0.d/K26mysql
	ln -sf  ../init.d/mysql ${EXTDIR}/rc.d/rc1.d/K26mysql
	ln -sf  ../init.d/mysql ${EXTDIR}/rc.d/rc2.d/K26mysql
	ln -sf  ../init.d/mysql ${EXTDIR}/rc.d/rc3.d/S34mysql
	ln -sf  ../init.d/mysql ${EXTDIR}/rc.d/rc4.d/S34mysql
	ln -sf  ../init.d/mysql ${EXTDIR}/rc.d/rc5.d/S34mysql
	ln -sf  ../init.d/mysql ${EXTDIR}/rc.d/rc6.d/K26mysql

install-netfs: create-dirs
	install -m ${MODE} init.d/netfs      ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/netfs ${EXTDIR}/rc.d/rc0.d/K47netfs
	ln -sf  ../init.d/netfs ${EXTDIR}/rc.d/rc1.d/K47netfs
	ln -sf  ../init.d/netfs ${EXTDIR}/rc.d/rc2.d/K47netfs
	ln -sf  ../init.d/netfs ${EXTDIR}/rc.d/rc3.d/S28netfs
	ln -sf  ../init.d/netfs ${EXTDIR}/rc.d/rc4.d/S28netfs
	ln -sf  ../init.d/netfs ${EXTDIR}/rc.d/rc5.d/S28netfs
	ln -sf  ../init.d/netfs ${EXTDIR}/rc.d/rc6.d/K47netfs

install-networkmanager: create-dirs
	install -m ${MODE} init.d/networkmanager ${EXTDIR}/rc.d/init.d/networkmanager
	ln -sf  ../init.d/networkmanager ${EXTDIR}/rc.d/rc0.d/K28networkmanager
	ln -sf  ../init.d/networkmanager ${EXTDIR}/rc.d/rc1.d/K28networkmanager
	ln -sf  ../init.d/networkmanager ${EXTDIR}/rc.d/rc2.d/S33networkmanager
	ln -sf  ../init.d/networkmanager ${EXTDIR}/rc.d/rc3.d/S33networkmanager
	ln -sf  ../init.d/networkmanager ${EXTDIR}/rc.d/rc4.d/S33networkmanager
	ln -sf  ../init.d/networkmanager ${EXTDIR}/rc.d/rc5.d/S33networkmanager
	ln -sf  ../init.d/networkmanager ${EXTDIR}/rc.d/rc6.d/K28networkmanager

install-nfs-client: create-dirs
	install -m ${MODE} init.d/nfs-client ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/nfs-client ${EXTDIR}/rc.d/rc0.d/K48nfs-client
	ln -sf  ../init.d/nfs-client ${EXTDIR}/rc.d/rc1.d/K48nfs-client
	ln -sf  ../init.d/nfs-client ${EXTDIR}/rc.d/rc2.d/K48nfs-client
	ln -sf  ../init.d/nfs-client ${EXTDIR}/rc.d/rc3.d/S24nfs-client
	ln -sf  ../init.d/nfs-client ${EXTDIR}/rc.d/rc4.d/S24nfs-client
	ln -sf  ../init.d/nfs-client ${EXTDIR}/rc.d/rc5.d/S24nfs-client
	ln -sf  ../init.d/nfs-client ${EXTDIR}/rc.d/rc6.d/K48nfs-client

install-nfs-server: create-dirs
	install -m ${MODE} init.d/nfs-server ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/nfs-server ${EXTDIR}/rc.d/rc0.d/K48nfs-server
	ln -sf  ../init.d/nfs-server ${EXTDIR}/rc.d/rc1.d/K48nfs-server
	ln -sf  ../init.d/nfs-server ${EXTDIR}/rc.d/rc2.d/K48nfs-server
	ln -sf  ../init.d/nfs-server ${EXTDIR}/rc.d/rc3.d/S24nfs-server
	ln -sf  ../init.d/nfs-server ${EXTDIR}/rc.d/rc4.d/S24nfs-server
	ln -sf  ../init.d/nfs-server ${EXTDIR}/rc.d/rc5.d/S24nfs-server
	ln -sf  ../init.d/nfs-server ${EXTDIR}/rc.d/rc6.d/K48nfs-server

install-ntpd: create-dirs
	install -m ${MODE} init.d/ntpd       ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/ntpd ${EXTDIR}/rc.d/rc0.d/K46ntpd
	ln -sf  ../init.d/ntpd ${EXTDIR}/rc.d/rc1.d/K46ntpd
	ln -sf  ../init.d/ntpd ${EXTDIR}/rc.d/rc2.d/K46ntpd
	ln -sf  ../init.d/ntpd ${EXTDIR}/rc.d/rc3.d/S26ntpd
	ln -sf  ../init.d/ntpd ${EXTDIR}/rc.d/rc4.d/S26ntpd
	ln -sf  ../init.d/ntpd ${EXTDIR}/rc.d/rc5.d/S26ntpd
	ln -sf  ../init.d/ntpd ${EXTDIR}/rc.d/rc6.d/K46ntpd

install-slapd: create-dirs
	install -m ${MODE} init.d/slapd ${EXTDIR}/rc.d/init.d/slapd
	install -m ${CONFMODE} sysconfig/slapd ${EXTDIR}/sysconfig/slapd
	ln -sf  ../init.d/slapd ${EXTDIR}/rc.d/rc0.d/K46slapd
	ln -sf  ../init.d/slapd ${EXTDIR}/rc.d/rc1.d/K46slapd
	ln -sf  ../init.d/slapd ${EXTDIR}/rc.d/rc2.d/S25slapd
	ln -sf  ../init.d/slapd ${EXTDIR}/rc.d/rc3.d/S25slapd
	ln -sf  ../init.d/slapd ${EXTDIR}/rc.d/rc4.d/S25slapd
	ln -sf  ../init.d/slapd ${EXTDIR}/rc.d/rc5.d/S25slapd
	ln -sf  ../init.d/slapd ${EXTDIR}/rc.d/rc6.d/K46slapd

install-postfix: create-dirs
	install -m ${MODE} init.d/postfix    ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/postfix ${EXTDIR}/rc.d/rc0.d/K25postfix
	ln -sf  ../init.d/postfix ${EXTDIR}/rc.d/rc1.d/K25postfix
	ln -sf  ../init.d/postfix ${EXTDIR}/rc.d/rc2.d/K25postfix
	ln -sf  ../init.d/postfix ${EXTDIR}/rc.d/rc3.d/S35postfix
	ln -sf  ../init.d/postfix ${EXTDIR}/rc.d/rc4.d/S35postfix
	ln -sf  ../init.d/postfix ${EXTDIR}/rc.d/rc5.d/S35postfix
	ln -sf  ../init.d/postfix ${EXTDIR}/rc.d/rc6.d/K25postfix

install-postgresql: create-dirs
	install -m ${MODE} init.d/postgresql ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/postgresql ${EXTDIR}/rc.d/rc0.d/K26postgresql
	ln -sf  ../init.d/postgresql ${EXTDIR}/rc.d/rc1.d/K26postgresql
	ln -sf  ../init.d/postgresql ${EXTDIR}/rc.d/rc2.d/K26postgresql
	ln -sf  ../init.d/postgresql ${EXTDIR}/rc.d/rc3.d/S34postgresql
	ln -sf  ../init.d/postgresql ${EXTDIR}/rc.d/rc4.d/S34postgresql
	ln -sf  ../init.d/postgresql ${EXTDIR}/rc.d/rc5.d/S34postgresql
	ln -sf  ../init.d/postgresql ${EXTDIR}/rc.d/rc6.d/K26postgresql

install-proftpd: create-dirs
	install -m ${MODE} init.d/proftpd    ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/proftpd ${EXTDIR}/rc.d/rc0.d/K28proftpd
	ln -sf  ../init.d/proftpd ${EXTDIR}/rc.d/rc1.d/K28proftpd
	ln -sf  ../init.d/proftpd ${EXTDIR}/rc.d/rc2.d/K28proftpd
	ln -sf  ../init.d/proftpd ${EXTDIR}/rc.d/rc3.d/S32proftpd
	ln -sf  ../init.d/proftpd ${EXTDIR}/rc.d/rc4.d/S32proftpd
	ln -sf  ../init.d/proftpd ${EXTDIR}/rc.d/rc5.d/S32proftpd
	ln -sf  ../init.d/proftpd ${EXTDIR}/rc.d/rc6.d/K28proftpd

install-qpopper: create-dirs
	install -m ${MODE} init.d/qpopper   ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/qpopper ${EXTDIR}/rc.d/rc0.d/K23qpopper
	ln -sf  ../init.d/qpopper ${EXTDIR}/rc.d/rc1.d/K23qpopper
	ln -sf  ../init.d/qpopper ${EXTDIR}/rc.d/rc2.d/K23qpopper
	ln -sf  ../init.d/qpopper ${EXTDIR}/rc.d/rc3.d/S37qpopper
	ln -sf  ../init.d/qpopper ${EXTDIR}/rc.d/rc4.d/S37qpopper
	ln -sf  ../init.d/qpopper ${EXTDIR}/rc.d/rc5.d/S37qpopper
	ln -sf  ../init.d/qpopper ${EXTDIR}/rc.d/rc6.d/K23qpopper

install-random: create-dirs
	install -m ${MODE} init.d/random     ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/random ${EXTDIR}/rc.d/rc0.d/K45random
	ln -sf  ../init.d/random ${EXTDIR}/rc.d/rc1.d/S25random
	ln -sf  ../init.d/random ${EXTDIR}/rc.d/rc2.d/S25random
	ln -sf  ../init.d/random ${EXTDIR}/rc.d/rc3.d/S25random
	ln -sf  ../init.d/random ${EXTDIR}/rc.d/rc4.d/S25random
	ln -sf  ../init.d/random ${EXTDIR}/rc.d/rc5.d/S25random
	ln -sf  ../init.d/random ${EXTDIR}/rc.d/rc6.d/K45random

install-rpcbind: create-dirs
	install -m ${MODE} init.d/rpcbind    ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/rpcbind ${EXTDIR}/rc.d/rc0.d/K49rpcbind
	ln -sf  ../init.d/rpcbind ${EXTDIR}/rc.d/rc1.d/K49rpcbind
	ln -sf  ../init.d/rpcbind ${EXTDIR}/rc.d/rc2.d/K49rpcbind
	ln -sf  ../init.d/rpcbind ${EXTDIR}/rc.d/rc3.d/S22rpcbind
	ln -sf  ../init.d/rpcbind ${EXTDIR}/rc.d/rc4.d/S22rpcbind
	ln -sf  ../init.d/rpcbind ${EXTDIR}/rc.d/rc5.d/S22rpcbind
	ln -sf  ../init.d/rpcbind ${EXTDIR}/rc.d/rc6.d/K49rpcbind

install-rsyncd: create-dirs
	install -m ${MODE} init.d/rsyncd     ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/rsyncd ${EXTDIR}/rc.d/rc0.d/K30rsyncd
	ln -sf  ../init.d/rsyncd ${EXTDIR}/rc.d/rc1.d/K30rsyncd
	ln -sf  ../init.d/rsyncd ${EXTDIR}/rc.d/rc2.d/K30rsyncd
	ln -sf  ../init.d/rsyncd ${EXTDIR}/rc.d/rc3.d/S30rsyncd
	ln -sf  ../init.d/rsyncd ${EXTDIR}/rc.d/rc4.d/S30rsyncd
	ln -sf  ../init.d/rsyncd ${EXTDIR}/rc.d/rc5.d/S30rsyncd
	ln -sf  ../init.d/rsyncd ${EXTDIR}/rc.d/rc6.d/K30rsyncd

install-samba: create-dirs
	install -m ${MODE} init.d/samba      ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/samba ${EXTDIR}/rc.d/rc0.d/K48samba
	ln -sf  ../init.d/samba ${EXTDIR}/rc.d/rc1.d/K48samba
	ln -sf  ../init.d/samba ${EXTDIR}/rc.d/rc2.d/K48samba
	ln -sf  ../init.d/samba ${EXTDIR}/rc.d/rc3.d/S45samba
	ln -sf  ../init.d/samba ${EXTDIR}/rc.d/rc4.d/S45samba
	ln -sf  ../init.d/samba ${EXTDIR}/rc.d/rc5.d/S45samba
	ln -sf  ../init.d/samba ${EXTDIR}/rc.d/rc6.d/K48samba

install-sddm: create-dirs
	install -m ${MODE} init.d/sddm        ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/sddm ${EXTDIR}/rc.d/rc0.d/K05sddm
	ln -sf  ../init.d/sddm ${EXTDIR}/rc.d/rc1.d/K05sddm
	ln -sf  ../init.d/sddm ${EXTDIR}/rc.d/rc2.d/K05sddm
	ln -sf  ../init.d/sddm ${EXTDIR}/rc.d/rc3.d/K05sddm
	ln -sf  ../init.d/sddm ${EXTDIR}/rc.d/rc4.d/K05sddm
	ln -sf  ../init.d/sddm ${EXTDIR}/rc.d/rc5.d/S95sddm
	ln -sf  ../init.d/sddm ${EXTDIR}/rc.d/rc6.d/K05sddm

install-lightdm: create-dirs
	install -m ${MODE} init.d/lightdm	${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/lightdm ${EXTDIR}/rc.d/rc0.d/K05lightdm
	ln -sf  ../init.d/lightdm ${EXTDIR}/rc.d/rc1.d/K05lightdm
	ln -sf  ../init.d/lightdm ${EXTDIR}/rc.d/rc2.d/K05lightdm
	ln -sf  ../init.d/lightdm ${EXTDIR}/rc.d/rc3.d/K05lightdm
	ln -sf  ../init.d/lightdm ${EXTDIR}/rc.d/rc4.d/K05lightdm
	ln -sf  ../init.d/lightdm ${EXTDIR}/rc.d/rc5.d/S95lightdm
	ln -sf  ../init.d/lightdm ${EXTDIR}/rc.d/rc6.d/K05lightdm

install-sendmail: create-dirs
	install -m ${MODE} init.d/sendmail   ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/sendmail ${EXTDIR}/rc.d/rc0.d/K25sendmail
	ln -sf  ../init.d/sendmail ${EXTDIR}/rc.d/rc1.d/K25sendmail
	ln -sf  ../init.d/sendmail ${EXTDIR}/rc.d/rc2.d/K25sendmail
	ln -sf  ../init.d/sendmail ${EXTDIR}/rc.d/rc3.d/S35sendmail
	ln -sf  ../init.d/sendmail ${EXTDIR}/rc.d/rc4.d/S35sendmail
	ln -sf  ../init.d/sendmail ${EXTDIR}/rc.d/rc5.d/S35sendmail
	ln -sf  ../init.d/sendmail ${EXTDIR}/rc.d/rc6.d/K25sendmail

install-smartd: create-dirs
	install -m ${MODE} init.d/smartd    ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/smartd ${EXTDIR}/rc.d/rc0.d/K70smartd
	ln -sf  ../init.d/smartd ${EXTDIR}/rc.d/rc1.d/K70smartd
	ln -sf  ../init.d/smartd ${EXTDIR}/rc.d/rc2.d/K70smartd
	ln -sf  ../init.d/smartd ${EXTDIR}/rc.d/rc3.d/S21smartd
	ln -sf  ../init.d/smartd ${EXTDIR}/rc.d/rc4.d/S21smartd
	ln -sf  ../init.d/smartd ${EXTDIR}/rc.d/rc5.d/S21smartd
	ln -sf  ../init.d/smartd ${EXTDIR}/rc.d/rc6.d/K70smartd

install-soprano: create-dirs
	install -m ${MODE} init.d/soprano    ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/soprano ${EXTDIR}/rc.d/rc0.d/K35soprano
	ln -sf  ../init.d/soprano ${EXTDIR}/rc.d/rc1.d/K35soprano
	ln -sf  ../init.d/soprano ${EXTDIR}/rc.d/rc2.d/K35soprano
	ln -sf  ../init.d/soprano ${EXTDIR}/rc.d/rc3.d/S48soprano
	ln -sf  ../init.d/soprano ${EXTDIR}/rc.d/rc4.d/S48soprano
	ln -sf  ../init.d/soprano ${EXTDIR}/rc.d/rc5.d/S48soprano
	ln -sf  ../init.d/soprano ${EXTDIR}/rc.d/rc6.d/K35soprano

install-swat: create-dirs
	install -m ${MODE} init.d/swat      ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/swat ${EXTDIR}/rc.d/rc0.d/K47swat
	ln -sf  ../init.d/swat ${EXTDIR}/rc.d/rc1.d/K47swat
	ln -sf  ../init.d/swat ${EXTDIR}/rc.d/rc2.d/K47swat
	ln -sf  ../init.d/swat ${EXTDIR}/rc.d/rc3.d/S46swat
	ln -sf  ../init.d/swat ${EXTDIR}/rc.d/rc4.d/S46swat
	ln -sf  ../init.d/swat ${EXTDIR}/rc.d/rc5.d/S46swat
	ln -sf  ../init.d/swat ${EXTDIR}/rc.d/rc6.d/K47swat

install-sshd: create-dirs
	install -m ${MODE} init.d/sshd       ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/sshd ${EXTDIR}/rc.d/rc0.d/K30sshd
	ln -sf  ../init.d/sshd ${EXTDIR}/rc.d/rc1.d/K30sshd
	ln -sf  ../init.d/sshd ${EXTDIR}/rc.d/rc2.d/K30sshd
	ln -sf  ../init.d/sshd ${EXTDIR}/rc.d/rc3.d/S30sshd
	ln -sf  ../init.d/sshd ${EXTDIR}/rc.d/rc4.d/S30sshd
	ln -sf  ../init.d/sshd ${EXTDIR}/rc.d/rc5.d/S30sshd
	ln -sf  ../init.d/sshd ${EXTDIR}/rc.d/rc6.d/K30sshd

install-stunnel: create-dirs
	install -m ${MODE} init.d/stunnel    ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/stunnel ${EXTDIR}/rc.d/rc0.d/K47stunnel
	ln -sf  ../init.d/stunnel ${EXTDIR}/rc.d/rc1.d/K47stunnel
	ln -sf  ../init.d/stunnel ${EXTDIR}/rc.d/rc2.d/K47stunnel
	ln -sf  ../init.d/stunnel ${EXTDIR}/rc.d/rc3.d/S55stunnel
	ln -sf  ../init.d/stunnel ${EXTDIR}/rc.d/rc4.d/S55stunnel
	ln -sf  ../init.d/stunnel ${EXTDIR}/rc.d/rc5.d/S55stunnel
	ln -sf  ../init.d/stunnel ${EXTDIR}/rc.d/rc6.d/K47stunnel

install-svn: create-dirs
	install -m ${MODE} init.d/svn        ${EXTDIR}/rc.d/init.d/
	ln -sf ../init.d/svn ${EXTDIR}/rc.d/rc0.d/K27svn
	ln -sf ../init.d/svn ${EXTDIR}/rc.d/rc1.d/K27svn
	ln -sf ../init.d/svn ${EXTDIR}/rc.d/rc2.d/K27svn
	ln -sf ../init.d/svn ${EXTDIR}/rc.d/rc3.d/S33svn
	ln -sf ../init.d/svn ${EXTDIR}/rc.d/rc4.d/S33svn
	ln -sf ../init.d/svn ${EXTDIR}/rc.d/rc5.d/S33svn
	ln -sf ../init.d/svn ${EXTDIR}/rc.d/rc6.d/K27svn

install-sysstat: create-dirs
	install -m ${MODE} init.d/sysstat    ${EXTDIR}/rc.d/init.d/
	ln -sf ../init.d/sysstat ${EXTDIR}/rc.d/rcS.d/S85sysstat

install-unbound: create-dirs
	install -m ${MODE} init.d/unbound       ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/unbound ${EXTDIR}/rc.d/rc0.d/K79unbound
	ln -sf  ../init.d/unbound ${EXTDIR}/rc.d/rc1.d/K79unbound
	ln -sf  ../init.d/unbound ${EXTDIR}/rc.d/rc2.d/K79unbound
	ln -sf  ../init.d/unbound ${EXTDIR}/rc.d/rc3.d/S21unbound
	ln -sf  ../init.d/unbound ${EXTDIR}/rc.d/rc4.d/S21unbound
	ln -sf  ../init.d/unbound ${EXTDIR}/rc.d/rc5.d/S21unbound
	ln -sf  ../init.d/unbound ${EXTDIR}/rc.d/rc6.d/K79unbound

install-virtuoso: create-dirs
	install -m ${MODE} init.d/virtuoso   ${EXTDIR}/rc.d/init.d/
	ln -sf ../init.d/virtuoso ${EXTDIR}/rc.d/rc0.d/K40virtuoso
	ln -sf ../init.d/virtuoso ${EXTDIR}/rc.d/rc1.d/K40virtuoso
	ln -sf ../init.d/virtuoso ${EXTDIR}/rc.d/rc2.d/K40virtuoso
	ln -sf ../init.d/virtuoso ${EXTDIR}/rc.d/rc3.d/S47virtuoso
	ln -sf ../init.d/virtuoso ${EXTDIR}/rc.d/rc4.d/S47virtuoso
	ln -sf ../init.d/virtuoso ${EXTDIR}/rc.d/rc5.d/S47virtuoso
	ln -sf ../init.d/virtuoso ${EXTDIR}/rc.d/rc6.d/K40virtuoso

install-vsftpd: create-dirs
	install -m ${MODE} init.d/vsftpd     ${EXTDIR}/rc.d/init.d/
	ln -sf ../init.d/vsftpd ${EXTDIR}/rc.d/rc0.d/K28vsftpd
	ln -sf ../init.d/vsftpd ${EXTDIR}/rc.d/rc1.d/K28vsftpd
	ln -sf ../init.d/vsftpd ${EXTDIR}/rc.d/rc2.d/K28vsftpd
	ln -sf ../init.d/vsftpd ${EXTDIR}/rc.d/rc3.d/S32vsftpd
	ln -sf ../init.d/vsftpd ${EXTDIR}/rc.d/rc4.d/S32vsftpd
	ln -sf ../init.d/vsftpd ${EXTDIR}/rc.d/rc5.d/S32vsftpd
	ln -sf ../init.d/vsftpd ${EXTDIR}/rc.d/rc6.d/K28vsftpd

install-winbindd: create-dirs
	install -m ${MODE} init.d/winbindd      ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/winbindd ${EXTDIR}/rc.d/rc0.d/K49winbindd
	ln -sf  ../init.d/winbindd ${EXTDIR}/rc.d/rc1.d/K49winbindd
	ln -sf  ../init.d/winbindd ${EXTDIR}/rc.d/rc2.d/K49winbindd
	ln -sf  ../init.d/winbindd ${EXTDIR}/rc.d/rc3.d/S50winbindd
	ln -sf  ../init.d/winbindd ${EXTDIR}/rc.d/rc4.d/S50winbindd
	ln -sf  ../init.d/winbindd ${EXTDIR}/rc.d/rc5.d/S50winbindd
	ln -sf  ../init.d/winbindd ${EXTDIR}/rc.d/rc6.d/K49winbindd

install-xinetd: create-dirs
	install -m ${MODE} init.d/xinetd     ${EXTDIR}/rc.d/init.d/
	ln -sf ../init.d/xinetd ${EXTDIR}/rc.d/rc0.d/K49xinetd
	ln -sf ../init.d/xinetd ${EXTDIR}/rc.d/rc1.d/K49xinetd
	ln -sf ../init.d/xinetd ${EXTDIR}/rc.d/rc2.d/K49xinetd
	ln -sf ../init.d/xinetd ${EXTDIR}/rc.d/rc3.d/S23xinetd
	ln -sf ../init.d/xinetd ${EXTDIR}/rc.d/rc4.d/S23xinetd
	ln -sf ../init.d/xinetd ${EXTDIR}/rc.d/rc5.d/S23xinetd
	ln -sf ../init.d/xinetd ${EXTDIR}/rc.d/rc6.d/K49xinetd

uninstall-atd: 
	rm -f ${EXTDIR}/rc.d/init.d/atd
	rm -f ${EXTDIR}/rc.d/rc0.d/K29atd
	rm -f ${EXTDIR}/rc.d/rc1.d/K29atd
	rm -f ${EXTDIR}/rc.d/rc2.d/S68atd
	rm -f ${EXTDIR}/rc.d/rc3.d/S68atd
	rm -f ${EXTDIR}/rc.d/rc4.d/S68atd
	rm -f ${EXTDIR}/rc.d/rc5.d/S68atd
	rm -f ${EXTDIR}/rc.d/rc6.d/K29atd

uninstall-acpid:
	rm -f ${EXTDIR}/rc.d/init.d/acpid
	rm -f ${EXTDIR}/rc.d/rc0.d/K32acpid
	rm -f ${EXTDIR}/rc.d/rc1.d/K32acpid
	rm -f ${EXTDIR}/rc.d/rc2.d/S18acpid
	rm -f ${EXTDIR}/rc.d/rc3.d/S18acpid
	rm -f ${EXTDIR}/rc.d/rc4.d/S18acpid
	rm -f ${EXTDIR}/rc.d/rc5.d/S18acpid
	rm -f ${EXTDIR}/rc.d/rc6.d/K32acpid

uninstall-alsa:
	rm -f ${EXTDIR}/rc.d/init.d/alsa
	rm -f ${EXTDIR}/rc.d/rc0.d/K35alsa
	rm -f ${EXTDIR}/rc.d/rc1.d/K35alsa
	rm -f ${EXTDIR}/rc.d/rc6.d/K35alsa
	rm -f ${EXTDIR}/rc.d/rcS.d/S60alsa

uninstall-httpd:
	rm -f ${EXTDIR}/rc.d/init.d/httpd
	rm -f ${EXTDIR}/rc.d/rc0.d/K28httpd
	rm -f ${EXTDIR}/rc.d/rc1.d/K28httpd
	rm -f ${EXTDIR}/rc.d/rc2.d/K28httpd
	rm -f ${EXTDIR}/rc.d/rc3.d/S32httpd
	rm -f ${EXTDIR}/rc.d/rc4.d/S32httpd
	rm -f ${EXTDIR}/rc.d/rc5.d/S32httpd
	rm -f ${EXTDIR}/rc.d/rc6.d/K28httpd

uninstall-php:
	rm -f ${EXTDIR}/rc.d/init.d/php-fpm
	rm -f ${EXTDIR}/rc.d/rc0.d/K28php-fpm
	rm -f ${EXTDIR}/rc.d/rc1.d/K28php-fpm
	rm -f ${EXTDIR}/rc.d/rc2.d/K28php-fpm
	rm -f ${EXTDIR}/rc.d/rc3.d/S32php-fpm
	rm -f ${EXTDIR}/rc.d/rc4.d/S32php-fpm
	rm -f ${EXTDIR}/rc.d/rc5.d/S32php-fpm
	rm -f ${EXTDIR}/rc.d/rc6.d/K28php-fpm

uninstall-autofs:
	rm -f $(EXTDIR)/rc.d/init.d/autofs
	rm -f $(EXTDIR)/rc.d/rcS.d/S52autofs

uninstall-avahi:
	rm -f ${EXTDIR}/rc.d/init.d/avahi
	rm -f ${EXTDIR}/rc.d/rc0.d/K28avahi
	rm -f ${EXTDIR}/rc.d/rc1.d/K28avahi
	rm -f ${EXTDIR}/rc.d/rc2.d/S34avahi
	rm -f ${EXTDIR}/rc.d/rc3.d/S34avahi
	rm -f ${EXTDIR}/rc.d/rc4.d/S34avahi
	rm -f ${EXTDIR}/rc.d/rc5.d/S34avahi
	rm -f ${EXTDIR}/rc.d/rc6.d/K28avahi

uninstall-bind:
	rm -f ${EXTDIR}/rc.d/init.d/bind
	rm -f ${EXTDIR}/rc.d/rc0.d/K49bind
	rm -f ${EXTDIR}/rc.d/rc1.d/K49bind
	rm -f ${EXTDIR}/rc.d/rc2.d/K49bind
	rm -f ${EXTDIR}/rc.d/rc3.d/S22bind
	rm -f ${EXTDIR}/rc.d/rc4.d/S22bind
	rm -f ${EXTDIR}/rc.d/rc5.d/S22bind
	rm -f ${EXTDIR}/rc.d/rc6.d/K49bind

uninstall-bluetooth:
	rm -f ${EXTDIR}/rc.d/init.d/bluetooth
	rm -f ${EXTDIR}/rc.d/rc0.d/K27bluetooth
	rm -f ${EXTDIR}/rc.d/rc1.d/K27bluetooth
	rm -f ${EXTDIR}/rc.d/rc2.d/S35bluetooth
	rm -f ${EXTDIR}/rc.d/rc3.d/S35bluetooth
	rm -f ${EXTDIR}/rc.d/rc4.d/S35bluetooth
	rm -f ${EXTDIR}/rc.d/rc5.d/S35bluetooth
	rm -f ${EXTDIR}/rc.d/rc6.d/K27bluetooth

uninstall-cups:
	rm -f ${EXTDIR}/rc.d/init.d/cups
	rm -f ${EXTDIR}/rc.d/rc0.d/K00cups
	rm -f ${EXTDIR}/rc.d/rc1.d/K00cups
	rm -f ${EXTDIR}/rc.d/rc2.d/S25cups
	rm -f ${EXTDIR}/rc.d/rc3.d/S25cups
	rm -f ${EXTDIR}/rc.d/rc4.d/S25cups
	rm -f ${EXTDIR}/rc.d/rc5.d/S25cups
	rm -f ${EXTDIR}/rc.d/rc6.d/K00cups

uninstall-saslauthd:
	rm -f ${EXTDIR}/rc.d/init.d/saslauthd
	rm -f ${EXTDIR}/sysconfig/saslauthd
	rm -f ${EXTDIR}/rc.d/rc0.d/K49saslauthd
	rm -f ${EXTDIR}/rc.d/rc1.d/K49saslauthd
	rm -f ${EXTDIR}/rc.d/rc2.d/S24saslauthd
	rm -f ${EXTDIR}/rc.d/rc3.d/S24saslauthd
	rm -f ${EXTDIR}/rc.d/rc4.d/S24saslauthd
	rm -f ${EXTDIR}/rc.d/rc5.d/S24saslauthd
	rm -f ${EXTDIR}/rc.d/rc6.d/K49saslauthd

uninstall-dbus:
	rm -f ${EXTDIR}/rc.d/init.d/dbus
	rm -f ${EXTDIR}/rc.d/rc0.d/K30dbus
	rm -f ${EXTDIR}/rc.d/rc1.d/K30dbus
	rm -f ${EXTDIR}/rc.d/rc2.d/S29dbus
	rm -f ${EXTDIR}/rc.d/rc3.d/S29dbus
	rm -f ${EXTDIR}/rc.d/rc4.d/S29dbus
	rm -f ${EXTDIR}/rc.d/rc5.d/S29dbus
	rm -f ${EXTDIR}/rc.d/rc6.d/K30dbus

uninstall-wicd:
	rm -f ${EXTDIR}/rc.d/init.d/wicd
	rm -f ${EXTDIR}/rc.d/rc0.d/K20wicd
	rm -f ${EXTDIR}/rc.d/rc1.d/K20wicd
	rm -f ${EXTDIR}/rc.d/rc2.d/S30wicd
	rm -f ${EXTDIR}/rc.d/rc3.d/S30wicd
	rm -f ${EXTDIR}/rc.d/rc4.d/S30wicd
	rm -f ${EXTDIR}/rc.d/rc5.d/S30wicd
	rm -f ${EXTDIR}/rc.d/rc6.d/K20wicd

uninstall-dhcpd:
	rm -f ${EXTDIR}/rc.d/init.d/dhcpd
	rm -f ${EXTDIR}/sysconfig/dhcpd
	rm -f ${EXTDIR}/rc.d/rc0.d/K30dhcpd
	rm -f ${EXTDIR}/rc.d/rc1.d/K30dhcpd
	rm -f ${EXTDIR}/rc.d/rc2.d/K30dhcpd
	rm -f ${EXTDIR}/rc.d/rc3.d/S30dhcpd
	rm -f ${EXTDIR}/rc.d/rc4.d/S30dhcpd
	rm -f ${EXTDIR}/rc.d/rc5.d/S30dhcpd
	rm -f ${EXTDIR}/rc.d/rc6.d/K30dhcpd

uninstall-dovecot:
	rm -f ${EXTDIR}/rc.d/init.d/dovecot
	rm -f ${EXTDIR}/rc.d/rc0.d/K78dovecot
	rm -f ${EXTDIR}/rc.d/rc1.d/K78dovecot
	rm -f ${EXTDIR}/rc.d/rc2.d/K78dovecot
	rm -f ${EXTDIR}/rc.d/rc3.d/S27dovecot
	rm -f ${EXTDIR}/rc.d/rc4.d/S27dovecot
	rm -f ${EXTDIR}/rc.d/rc5.d/S27dovecot
	rm -f ${EXTDIR}/rc.d/rc6.d/K78dovecot

uninstall-exim:
	rm -f ${EXTDIR}/rc.d/init.d/exim
	rm -f ${EXTDIR}/rc.d/rc0.d/K25exim
	rm -f ${EXTDIR}/rc.d/rc1.d/K25exim
	rm -f ${EXTDIR}/rc.d/rc2.d/K25exim
	rm -f ${EXTDIR}/rc.d/rc3.d/S35exim
	rm -f ${EXTDIR}/rc.d/rc4.d/S35exim
	rm -f ${EXTDIR}/rc.d/rc5.d/S35exim
	rm -f ${EXTDIR}/rc.d/rc6.d/K25exim

uninstall-fcron:
	rm -f ${EXTDIR}/rc.d/init.d/fcron
	rm -f ${EXTDIR}/rc.d/rc0.d/K08fcron
	rm -f ${EXTDIR}/rc.d/rc1.d/K08fcron
	rm -f ${EXTDIR}/rc.d/rc2.d/S40fcron
	rm -f ${EXTDIR}/rc.d/rc3.d/S40fcron
	rm -f ${EXTDIR}/rc.d/rc4.d/S40fcron
	rm -f ${EXTDIR}/rc.d/rc5.d/S40fcron
	rm -f ${EXTDIR}/rc.d/rc6.d/K08fcron

uninstall-gdm:
	rm -f ${EXTDIR}/rc.d/init.d/gdm
	rm -f ${EXTDIR}/rc.d/rc0.d/K05gdm
	rm -f ${EXTDIR}/rc.d/rc1.d/K05gdm
	rm -f ${EXTDIR}/rc.d/rc2.d/K05gdm
	rm -f ${EXTDIR}/rc.d/rc3.d/K05gdm
	rm -f ${EXTDIR}/rc.d/rc4.d/K05gdm
	rm -f ${EXTDIR}/rc.d/rc5.d/S95gdm
	rm -f ${EXTDIR}/rc.d/rc6.d/K05gdm

uninstall-gpm:
	rm -f ${EXTDIR}/rc.d/init.d/gpm
	rm -f ${EXTDIR}/rc.d/rc0.d/K10gpm
	rm -f ${EXTDIR}/rc.d/rc1.d/K10gpm
	rm -f ${EXTDIR}/rc.d/rc2.d/S70gpm
	rm -f ${EXTDIR}/rc.d/rc3.d/S70gpm
	rm -f ${EXTDIR}/rc.d/rc4.d/S70gpm
	rm -f ${EXTDIR}/rc.d/rc5.d/S70gpm
	rm -f ${EXTDIR}/rc.d/rc6.d/K10gpm

uninstall-haveged:
	rm -f ${EXTDIR}/rc.d/init.d/haveged
	rm -f ${EXTDIR}/rc.d/rc0.d/K90haveged
	rm -f ${EXTDIR}/rc.d/rc1.d/K90haveged
	rm -f ${EXTDIR}/rc.d/rc2.d/K90haveged
	rm -f ${EXTDIR}/rc.d/rc3.d/S21haveged
	rm -f ${EXTDIR}/rc.d/rc4.d/S21haveged
	rm -f ${EXTDIR}/rc.d/rc5.d/S21haveged
	rm -f ${EXTDIR}/rc.d/rc6.d/K90haveged

uninstall-heimdal:
	rm -f ${EXTDIR}/rc.d/init.d/heimdal
	rm -f ${EXTDIR}/rc.d/rc0.d/K42heimdal
	rm -f ${EXTDIR}/rc.d/rc1.d/K42heimdal
	rm -f ${EXTDIR}/rc.d/rc2.d/K42heimdal
	rm -f ${EXTDIR}/rc.d/rc3.d/S28heimdal
	rm -f ${EXTDIR}/rc.d/rc4.d/S28heimdal
	rm -f ${EXTDIR}/rc.d/rc5.d/S28heimdal
	rm -f ${EXTDIR}/rc.d/rc6.d/K42heimdal

uninstall-iptables:
	rm -f ${EXTDIR}/rc.d/init.d/iptables
	rm -f ${EXTDIR}/rc.d/rc3.d/S19iptables
	rm -f ${EXTDIR}/rc.d/rc4.d/S19iptables
	rm -f ${EXTDIR}/rc.d/rc5.d/S19iptables

uninstall-krb5:
	rm -f ${EXTDIR}/rc.d/init.d/krb5
	rm -f ${EXTDIR}/rc.d/rc0.d/K42krb5
	rm -f ${EXTDIR}/rc.d/rc1.d/K42krb5
	rm -f ${EXTDIR}/rc.d/rc2.d/K42krb5
	rm -f ${EXTDIR}/rc.d/rc3.d/S28krb5
	rm -f ${EXTDIR}/rc.d/rc4.d/S28krb5
	rm -f ${EXTDIR}/rc.d/rc5.d/S28krb5
	rm -f ${EXTDIR}/rc.d/rc6.d/K42krb5

uninstall-lprng:
	rm -f ${EXTDIR}/rc.d/init.d/lprng
	rm -f ${EXTDIR}/rc.d/rc0.d/K00lprng
	rm -f ${EXTDIR}/rc.d/rc1.d/K00lprng
	rm -f ${EXTDIR}/rc.d/rc2.d/S99lprng
	rm -f ${EXTDIR}/rc.d/rc3.d/S99lprng
	rm -f ${EXTDIR}/rc.d/rc4.d/S99lprng
	rm -f ${EXTDIR}/rc.d/rc5.d/S99lprng
	rm -f ${EXTDIR}/rc.d/rc6.d/K00lprng

uninstall-lxdm:
	rm -f ${EXTDIR}/rc.d/init.d/lxdm
	rm -f ${EXTDIR}/rc.d/rc0.d/K05lxdm
	rm -f ${EXTDIR}/rc.d/rc1.d/K05lxdm
	rm -f ${EXTDIR}/rc.d/rc2.d/K05lxdm
	rm -f ${EXTDIR}/rc.d/rc3.d/K05lxdm
	rm -f ${EXTDIR}/rc.d/rc4.d/K05lxdm
	rm -f ${EXTDIR}/rc.d/rc5.d/S95lxdm
	rm -f ${EXTDIR}/rc.d/rc6.d/K05lxdm

uninstall-mysql:
	rm -f ${EXTDIR}/rc.d/init.d/mysql
	rm -f ${EXTDIR}/rc.d/rc0.d/K26mysql
	rm -f ${EXTDIR}/rc.d/rc1.d/K26mysql
	rm -f ${EXTDIR}/rc.d/rc2.d/K26mysql
	rm -f ${EXTDIR}/rc.d/rc3.d/S34mysql
	rm -f ${EXTDIR}/rc.d/rc4.d/S34mysql
	rm -f ${EXTDIR}/rc.d/rc5.d/S34mysql
	rm -f ${EXTDIR}/rc.d/rc6.d/K26mysql

uninstall-netfs:
	rm -f ${EXTDIR}/rc.d/init.d/netfs
	rm -f ${EXTDIR}/rc.d/rc0.d/K47netfs
	rm -f ${EXTDIR}/rc.d/rc1.d/K47netfs
	rm -f ${EXTDIR}/rc.d/rc2.d/K47netfs
	rm -f ${EXTDIR}/rc.d/rc3.d/S28netfs
	rm -f ${EXTDIR}/rc.d/rc4.d/S28netfs
	rm -f ${EXTDIR}/rc.d/rc5.d/S28netfs
	rm -f ${EXTDIR}/rc.d/rc6.d/K47netfs

uninstall-networkmanager:
	rm -f ${EXTDIR}/rc.d/init.d/networkmanager
	rm -f ${EXTDIR}/rc.d/rc0.d/K28networkmanager
	rm -f ${EXTDIR}/rc.d/rc1.d/K28networkmanager
	rm -f ${EXTDIR}/rc.d/rc2.d/S33networkmanager
	rm -f ${EXTDIR}/rc.d/rc3.d/S33networkmanager
	rm -f ${EXTDIR}/rc.d/rc4.d/S33networkmanager
	rm -f ${EXTDIR}/rc.d/rc5.d/S33networkmanager
	rm -f ${EXTDIR}/rc.d/rc6.d/K28networkmanager

uninstall-nfs-client:
	rm -f ${EXTDIR}/rc.d/init.d/nfs-client
	rm -f ${EXTDIR}/rc.d/rc0.d/K48nfs-client
	rm -f ${EXTDIR}/rc.d/rc1.d/K48nfs-client
	rm -f ${EXTDIR}/rc.d/rc2.d/K48nfs-client
	rm -f ${EXTDIR}/rc.d/rc3.d/S24nfs-client
	rm -f ${EXTDIR}/rc.d/rc4.d/S24nfs-client
	rm -f ${EXTDIR}/rc.d/rc5.d/S24nfs-client
	rm -f ${EXTDIR}/rc.d/rc6.d/K48nfs-client

uninstall-nfs-server:
	rm -f ${EXTDIR}/rc.d/init.d/nfs-server
	rm -f ${EXTDIR}/rc.d/rc0.d/K48nfs-server
	rm -f ${EXTDIR}/rc.d/rc1.d/K48nfs-server
	rm -f ${EXTDIR}/rc.d/rc2.d/K48nfs-server
	rm -f ${EXTDIR}/rc.d/rc3.d/S24nfs-server
	rm -f ${EXTDIR}/rc.d/rc4.d/S24nfs-server
	rm -f ${EXTDIR}/rc.d/rc5.d/S24nfs-server
	rm -f ${EXTDIR}/rc.d/rc6.d/K48nfs-server

uninstall-ntpd:
	rm -f ${EXTDIR}/rc.d/init.d/ntpd
	rm -f ${EXTDIR}/rc.d/rc0.d/K46ntpd
	rm -f ${EXTDIR}/rc.d/rc1.d/K46ntpd
	rm -f ${EXTDIR}/rc.d/rc2.d/K46ntpd
	rm -f ${EXTDIR}/rc.d/rc3.d/S26ntpd
	rm -f ${EXTDIR}/rc.d/rc4.d/S26ntpd
	rm -f ${EXTDIR}/rc.d/rc5.d/S26ntpd
	rm -f ${EXTDIR}/rc.d/rc6.d/K46ntpd

uninstall-slapd:
	rm -f ${EXTDIR}/rc.d/init.d/slapd
	rm -f ${EXTDIR}/sysconfig/slapd
	rm -f ${EXTDIR}/rc.d/rc0.d/K46slapd
	rm -f ${EXTDIR}/rc.d/rc1.d/K46slapd
	rm -f ${EXTDIR}/rc.d/rc2.d/S25slapd
	rm -f ${EXTDIR}/rc.d/rc3.d/S25slapd
	rm -f ${EXTDIR}/rc.d/rc4.d/S25slapd
	rm -f ${EXTDIR}/rc.d/rc5.d/S25slapd
	rm -f ${EXTDIR}/rc.d/rc6.d/K46slapd

uinstall-smartd: c
	rm -f ${EXTDIR}/rc.d/init.d/smartd
	rm -f ${EXTDIR}/rc.d/rc0.d/K70smartd
	rm -f ${EXTDIR}/rc.d/rc1.d/K70smartd
	rm -f ${EXTDIR}/rc.d/rc2.d/K70smartd
	rm -f ${EXTDIR}/rc.d/rc3.d/S21smartd
	rm -f ${EXTDIR}/rc.d/rc4.d/S21smartd
	rm -f ${EXTDIR}/rc.d/rc5.d/S21smartd
	rm -f ${EXTDIR}/rc.d/rc6.d/K70smartd

uninstall-postfix:
	rm -f ${EXTDIR}/rc.d/init.d/postfix
	rm -f ${EXTDIR}/rc.d/rc0.d/K25postfix
	rm -f ${EXTDIR}/rc.d/rc1.d/K25postfix
	rm -f ${EXTDIR}/rc.d/rc2.d/K25postfix
	rm -f ${EXTDIR}/rc.d/rc3.d/S35postfix
	rm -f ${EXTDIR}/rc.d/rc4.d/S35postfix
	rm -f ${EXTDIR}/rc.d/rc5.d/S35postfix
	rm -f ${EXTDIR}/rc.d/rc6.d/K25postfix

uninstall-postgresql:
	rm -f ${EXTDIR}/rc.d/init.d/postgresql
	rm -f ${EXTDIR}/rc.d/rc0.d/K26postgresql
	rm -f ${EXTDIR}/rc.d/rc1.d/K26postgresql
	rm -f ${EXTDIR}/rc.d/rc2.d/K26postgresql
	rm -f ${EXTDIR}/rc.d/rc3.d/S34postgresql
	rm -f ${EXTDIR}/rc.d/rc4.d/S34postgresql
	rm -f ${EXTDIR}/rc.d/rc5.d/S34postgresql
	rm -f ${EXTDIR}/rc.d/rc6.d/K26postgresql

uninstall-proftpd:
	rm -f ${EXTDIR}/rc.d/init.d/proftpd
	rm -f ${EXTDIR}/rc.d/rc0.d/K28proftpd
	rm -f ${EXTDIR}/rc.d/rc1.d/K28proftpd
	rm -f ${EXTDIR}/rc.d/rc2.d/K28proftpd
	rm -f ${EXTDIR}/rc.d/rc3.d/S32proftpd
	rm -f ${EXTDIR}/rc.d/rc4.d/S32proftpd
	rm -f ${EXTDIR}/rc.d/rc5.d/S32proftpd
	rm -f ${EXTDIR}/rc.d/rc6.d/K28proftpd

uninstall-random:
	rm -f ${EXTDIR}/rc.d/init.d/random
	rm -f ${EXTDIR}/rc.d/rc0.d/K45random
	rm -f ${EXTDIR}/rc.d/rc1.d/S25random
	rm -f ${EXTDIR}/rc.d/rc2.d/S25random
	rm -f ${EXTDIR}/rc.d/rc3.d/S25random
	rm -f ${EXTDIR}/rc.d/rc4.d/S25random
	rm -f ${EXTDIR}/rc.d/rc5.d/S25random
	rm -f ${EXTDIR}/rc.d/rc6.d/K45random

uninstall-rpcbind: 
	rm -f ${EXTDIR}/rc.d/init.d/rpcbind
	rm -f ${EXTDIR}/rc.d/rc0.d/K49rpcbind
	rm -f ${EXTDIR}/rc.d/rc1.d/K49rpcbind
	rm -f ${EXTDIR}/rc.d/rc2.d/K49rpcbind
	rm -f ${EXTDIR}/rc.d/rc3.d/S22rpcbind
	rm -f ${EXTDIR}/rc.d/rc4.d/S22rpcbind
	rm -f ${EXTDIR}/rc.d/rc5.d/S22rpcbind
	rm -f ${EXTDIR}/rc.d/rc6.d/K49rpcbind

uninstall-rsyncd:
	rm -f ${EXTDIR}/rc.d/init.d/rsyncd
	rm -f ${EXTDIR}/rc.d/rc0.d/K30rsyncd
	rm -f ${EXTDIR}/rc.d/rc1.d/K30rsyncd
	rm -f ${EXTDIR}/rc.d/rc2.d/K30rsyncd
	rm -f ${EXTDIR}/rc.d/rc3.d/S30rsyncd
	rm -f ${EXTDIR}/rc.d/rc4.d/S30rsyncd
	rm -f ${EXTDIR}/rc.d/rc5.d/S30rsyncd
	rm -f ${EXTDIR}/rc.d/rc6.d/K30rsyncd

uninstall-samba:
	rm -f ${EXTDIR}/rc.d/init.d/samba
	rm -f ${EXTDIR}/rc.d/rc0.d/K48samba
	rm -f ${EXTDIR}/rc.d/rc1.d/K48samba
	rm -f ${EXTDIR}/rc.d/rc2.d/K48samba
	rm -f ${EXTDIR}/rc.d/rc3.d/S45samba
	rm -f ${EXTDIR}/rc.d/rc4.d/S45samba
	rm -f ${EXTDIR}/rc.d/rc5.d/S45samba
	rm -f ${EXTDIR}/rc.d/rc6.d/K48samba

uninstall-sddm:
	rm -f ${EXTDIR}/rc.d/init.d/sddm
	rm -f ${EXTDIR}/rc.d/rc0.d/K05sddm
	rm -f ${EXTDIR}/rc.d/rc1.d/K05sddm
	rm -f ${EXTDIR}/rc.d/rc2.d/K05sddm
	rm -f ${EXTDIR}/rc.d/rc3.d/K05sddm
	rm -f ${EXTDIR}/rc.d/rc4.d/K05sddm
	rm -f ${EXTDIR}/rc.d/rc5.d/S95sddm
	rm -f ${EXTDIR}/rc.d/rc6.d/K05sddm

uninstall-lightdm:
	rm -f ${EXTDIR}/rc.d/init.d/lightd
	rm -f ${EXTDIR}/rc.d/rc0.d/K05lightdm
	rm -f ${EXTDIR}/rc.d/rc1.d/K05lightdm
	rm -f ${EXTDIR}/rc.d/rc2.d/K05lightdm
	rm -f ${EXTDIR}/rc.d/rc3.d/K05lightdm
	rm -f ${EXTDIR}/rc.d/rc4.d/K05lightdm
	rm -f ${EXTDIR}/rc.d/rc5.d/S95lightdm
	rm -f ${EXTDIR}/rc.d/rc6.d/K05lightdm

uninstall-sendmail:
	rm -f ${EXTDIR}/rc.d/init.d/sendmail
	rm -f ${EXTDIR}/rc.d/rc0.d/K25sendmail
	rm -f ${EXTDIR}/rc.d/rc1.d/K25sendmail
	rm -f ${EXTDIR}/rc.d/rc2.d/K25sendmail
	rm -f ${EXTDIR}/rc.d/rc3.d/S35sendmail
	rm -f ${EXTDIR}/rc.d/rc4.d/S35sendmail
	rm -f ${EXTDIR}/rc.d/rc5.d/S35sendmail
	rm -f ${EXTDIR}/rc.d/rc6.d/K25sendmail

uninstall-sshd:
	rm -f ${EXTDIR}/rc.d/init.d/sshd
	rm -f ${EXTDIR}/rc.d/rc0.d/K30sshd
	rm -f ${EXTDIR}/rc.d/rc1.d/K30sshd
	rm -f ${EXTDIR}/rc.d/rc2.d/K30sshd
	rm -f ${EXTDIR}/rc.d/rc3.d/S30sshd
	rm -f ${EXTDIR}/rc.d/rc4.d/S30sshd
	rm -f ${EXTDIR}/rc.d/rc5.d/S30sshd
	rm -f ${EXTDIR}/rc.d/rc6.d/K30sshd

uninstall-stunnel:
	rm -f ${EXTDIR}/rc.d/init.d/stunnel
	rm -f ${EXTDIR}/rc.d/rc0.d/K47stunnel
	rm -f ${EXTDIR}/rc.d/rc1.d/K47stunnel
	rm -f ${EXTDIR}/rc.d/rc2.d/K47stunnel
	rm -f ${EXTDIR}/rc.d/rc3.d/S55stunnel
	rm -f ${EXTDIR}/rc.d/rc4.d/S55stunnel
	rm -f ${EXTDIR}/rc.d/rc5.d/S55stunnel
	rm -f ${EXTDIR}/rc.d/rc6.d/K47stunnel

uninstall-svn:
	rm -f ${EXTDIR}/rc.d/init.d/svn
	rm -f ${EXTDIR}/rc.d/rc0.d/K27svn
	rm -f ${EXTDIR}/rc.d/rc1.d/K27svn
	rm -f ${EXTDIR}/rc.d/rc2.d/K27svn
	rm -f ${EXTDIR}/rc.d/rc3.d/S33svn
	rm -f ${EXTDIR}/rc.d/rc4.d/S33svn
	rm -f ${EXTDIR}/rc.d/rc5.d/S33svn
	rm -f ${EXTDIR}/rc.d/rc6.d/K27svn

uninstall-sysstat:
	rm -f ${EXTDIR}/rc.d/init.d/sysstat
	rm -f ${EXTDIR}/rc.d/rcS.d/S85sysstat

uninstall-unbound:
	rm -f ${EXTDIR}/rc.d/init.d/unbound
	rm -f ${EXTDIR}/rc.d/rc0.d/K79unbound
	rm -f ${EXTDIR}/rc.d/rc1.d/K79unbound
	rm -f ${EXTDIR}/rc.d/rc2.d/K79unbound
	rm -f ${EXTDIR}/rc.d/rc3.d/S21unbound
	rm -f ${EXTDIR}/rc.d/rc4.d/S21unbound
	rm -f ${EXTDIR}/rc.d/rc5.d/S21unbound
	rm -f ${EXTDIR}/rc.d/rc6.d/K79unbound

uninstall-virtuoso:
	rm -f ${EXTDIR}/rc.d/init.d/virtuoso
	rm -f ${EXTDIR}/rc.d/rc0.d/K40virtuoso
	rm -f ${EXTDIR}/rc.d/rc1.d/K40virtuoso
	rm -f ${EXTDIR}/rc.d/rc2.d/K40virtuoso
	rm -f ${EXTDIR}/rc.d/rc3.d/S47virtuoso
	rm -f ${EXTDIR}/rc.d/rc4.d/S47virtuoso
	rm -f ${EXTDIR}/rc.d/rc5.d/S47virtuoso
	rm -f ${EXTDIR}/rc.d/rc6.d/K40virtuoso

uninstall-vsftpd:
	rm -f ${EXTDIR}/rc.d/init.d/vsftpd
	rm -f ${EXTDIR}/rc.d/rc0.d/K28vsftpd
	rm -f ${EXTDIR}/rc.d/rc1.d/K28vsftpd
	rm -f ${EXTDIR}/rc.d/rc2.d/K28vsftpd
	rm -f ${EXTDIR}/rc.d/rc3.d/S32vsftpd
	rm -f ${EXTDIR}/rc.d/rc4.d/S32vsftpd
	rm -f ${EXTDIR}/rc.d/rc5.d/S32vsftpd
	rm -f ${EXTDIR}/rc.d/rc6.d/K28vsftpd

uninstall-winbindd:
	rm -f ${EXTDIR}/rc.d/init.d/winbindd
	rm -f ${EXTDIR}/rc.d/rc0.d/K49winbindd
	rm -f ${EXTDIR}/rc.d/rc1.d/K49winbindd
	rm -f ${EXTDIR}/rc.d/rc2.d/K49winbindd
	rm -f ${EXTDIR}/rc.d/rc3.d/S50winbindd
	rm -f ${EXTDIR}/rc.d/rc4.d/S50winbindd
	rm -f ${EXTDIR}/rc.d/rc5.d/S50winbindd
	rm -f ${EXTDIR}/rc.d/rc6.d/K49winbindd

uninstall-xinetd:
	rm -f ${EXTDIR}/rc.d/init.d/xinetd
	rm -f ${EXTDIR}/rc.d/rc0.d/K49xinetd
	rm -f ${EXTDIR}/rc.d/rc1.d/K49xinetd
	rm -f ${EXTDIR}/rc.d/rc2.d/K49xinetd
	rm -f ${EXTDIR}/rc.d/rc3.d/S23xinetd
	rm -f ${EXTDIR}/rc.d/rc4.d/S23xinetd
	rm -f ${EXTDIR}/rc.d/rc5.d/S23xinetd
	rm -f ${EXTDIR}/rc.d/rc6.d/K49xinetd

.PHONY: all create-dirs create-service-dir \
	install-service-dhclient \
	install-service-dhcpcd \
	install-service-ipx \
	install-service-pppoe \
	install-atd \
	install-acpid \
	install-alsa \
	install-avahi \
	install-httpd \
	install-php \
	install-bind \
	install-bluetooth \
	install-cups \
	install-saslauthd \
	install-wicd \
	install-dhcpd \
	install-dovecot \
	install-exim \
	install-fcron \
	install-gdm \
	install-gpm \
	install-heimdal \
	install-iptables \
	install-krb5 \
	install-lprng \
	install-mysql \
	install-netfs \
	install-networkmanager \
	install-nfs-client \
	install-nfs-server \
	install-ntpd \
	install-slapd \
	install-postfix \
	install-postgresql \
	install-proftpd \
	install-random \
	install-rsync \
	install-samba \
	install-sddm \
	install-sendmail \
	install-soprano \
	install-sshd \
	install-stunnel \
	install-svn \
	install-sysstat \
	install-vsftpd \
	install-unbound \
	install-virtuoso \
	install-winbindd \
	install-xinetd \
	uninstall-atd \
	uninstall-acpid \
	uninstall-alsa \
	uninstall-avahi \
	uninstall-httpd \
	uninstall-php \
	uninstall-bind \
	uninstall-bluetooth \
	uninstall-cups \
	uninstall-saslauthd \
	uninstall-wicd \
	uninstall-dhcpd \
	uninstall-dovecot \
	uninstall-exim \
	uninstall-fcron \
	uninstall-gdm \
	uninstall-gpm \
	uninstall-heimdal \
	uninstall-iptables \
	uninstall-krb5 \
	uninstall-lprng \
	uninstall-mysql \
	uninstall-netfs \
	uninstall-networkmanager \
	uninstall-nfs-client \
	uninstall-nfs-server \
	uninstall-ntpd \
	uninstall-slapd \
	uninstall-postfix \
	uninstall-postgresql \
	uninstall-proftpd \
	uninstall-random \
	uninstall-rsync \
	uninstall-samba \
	uninstall-sddm \
	uninstall-sendmail \
	uninstall-soprano \
	uninstall-sshd \
	uninstall-stunnel \
	uninstall-svn \
	uninstall-sysstat \
	uninstall-unbound \
	uninstall-virtuoso \
	uninstall-vsftpd   \
	uninstall-winbindd \
	uninstall-xinetd
