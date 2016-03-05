#!/bin/bash

#**************************************************
# Written by berlius for nutyx dot org - 2016     #
# Installation script for the NuTyX ARM system    #
# Based on CLFS scripts                           #
#**************************************************

if [ ! whoami="clfs" ]; then
  echo
  echo "You must run as user \"clfs\""
  echo
  echo "Vous devez exécuter en tant qu'utilisateur \"clfs \""
  echo
  exit 1
fi

export CLFS=/opt/nutyx-arm/arm
export MAKEFLAGS="-j100"
export CLFS_HOST=$(echo ${MACHTYPE} | sed -e 's/-[^-]*/-cross/')
export CLFS_TARGET="arm-none-linux-gnueabi"


source versions


for f in http://ftp.clfs.org/pub/clfs/conglomeration/file/file-$_file.tar.gz \
https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-$_linux.tar.xz \
http://ftp.gnu.org/gnu/m4/m4-$_m4.tar.xz \
http://ftp.gnu.org/gnu/ncurses/ncurses-$_ncurses.tar.gz \
http://sourceforge.net/projects/pkgconfiglite/files/$_pkg/pkg-config-lite-$_pkg.tar.gz \
http://ftp.gnu.org/gnu/gmp/gmp-$_gmpa.tar.xz \
http://www.mpfr.org/mpfr-3.1.3/mpfr-$_mpfr.tar.xz \
http://www.multiprecision.org/mpc/download/mpc-$_mpc.tar.gz \
http://isl.gforge.inria.fr/isl-$_isl.tar.xz \
http://ftp.gnu.org/gnu/binutils/binutils-$_binutils.tar.bz2 \
ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.3.0/gcc-$_gcc.tar.bz2 \
http://ftp.gnu.org/gnu/glibc/glibc-$_glibc.tar.xz \
http://zlib.net/zlib-$_zlib.tar.xz \
http://ftp.gnu.org/gnu/bash/bash-$_bash.tar.gz \
http://www.bzip.org/1.0.6/bzip2-$_bzip2.tar.gz \
http://sourceforge.net/projects/check/files/check/0.10.0/check-$_check.tar.gz \
http://ftp.gnu.org/gnu/coreutils/coreutils-$_coreutils.tar.xz \
http://ftp.gnu.org/gnu/diffutils/diffutils-$_diffutils.tar.xz \
http://ftp.gnu.org/gnu/findutils/findutils-$_findutils.tar.gz \
http://ftp.gnu.org/gnu/gawk/gawk-$_gawk.tar.xz \
http://ftp.gnu.org/gnu/gettext/gettext-$_gettext.tar.xz \
http://ftp.gnu.org/gnu/grep/grep-$_grep.tar.xz \
http://ftp.gnu.org/gnu/gzip/gzip-$_gzip.tar.xz \
http://ftp.gnu.org/gnu/make/make-$_make.tar.bz2 \
http://ftp.gnu.org/gnu/patch/patch-$_patch.tar.xz \
http://ftp.gnu.org/gnu/sed/sed-$_sed.tar.bz2 \
http://ftp.gnu.org/gnu/tar/tar-$_tar.tar.xz \
http://ftp.gnu.org/gnu/texinfo/texinfo-$_texinfo.tar.xz \
http://www.kernel.org/pub/linux/utils/util-linux/v2.25/util-linux-$_util.tar.xz \
http://tukaani.org/xz/xz-$_xz.tar.xz \
http://www.libarchive.org/downloads/libarchive-$_libarchive.tar.gz \
https://ftp.gnu.org/gnu/nettle/nettle-$_nettle.tar.gz \
http://download.savannah.gnu.org/releases/acl/acl-$_acl.src.tar.gz \
http://download.savannah.gnu.org/releases/attr/attr-$_attr.src.tar.gz \
http://downloads.sourceforge.net/expat/expat-$_expat.tar.gz \
http://www.cpan.org/src/5.0/perl-$_perl.tar.bz2 \
http://www.oberhumer.com/opensource/lzo/download/lzo-$_lzo.tar.gz \
ftp://ftp.gnutls.org/gcrypt/gnutls/v3.4/gnutls-$_gnutls.tar.xz \
http://curl.haxx.se/download/curl-$_curl.tar.bz2 \
http://pkgconfig.freedesktop.org/releases/pkg-config-$_pkgconfig.tar.gz \
http://downloads.nutyx.org/files/cards-$_cards.tar.gz \
http://ftp.gnu.org/gnu/wget/wget-$_wget.tar.xz \
http://ftp.clfs.org/pub/clfs/conglomeration/bootscripts-cross-lfs/bootscripts-cross-lfs-3.0-$_bootscripts.tar.xz \
ftp://ftp.denx.de/pub/u-boot/u-boot-$_uboot.tar.bz2

do

wget $f -P ${CLFS}/sources 2>&1 | tee -a ${CLFS}/sources/wget.log 

done


cd ${CLFS}/sources

for i in `ls`
do
  tar xvf $i
done


wget http://www.linuxfromscratch.org/patches/downloads/glibc/glibc-$_glibc-largefile-1.patch
wget http://www.linuxfromscratch.org/patches/downloads/glibc/glibc-$_glibc-fhs-1.patch
wget http://www.linuxfromscratch.org/patches/downloads/glibc/glibc-$_glibc-upstream_i386_fix-1.patch
wget http://patches.clfs.org/sysvinit/mpfr-3.1.3-fixes-1.patch
wget http://patches.clfs.org/sysvinit/gcc-5.3.0-specs-1.patch
wget http://patches.clfs.org/sysvinit/bash-4.3-branch_update-5.patch        
wget http://patches.clfs.org/sysvinit/coreutils-8.23-noman-1.patch
wget http://patches.clfs.org/sysvinit/iana-etc-2.30-numbers_update-20140202-2.patch.xz
wget http://patches.clfs.org/sysvinit/readline-6.3-branch_update-4.patch
wget http://downloads.nutyx.org/files/patchs/libarchive/libarchive-$_libarchive-mtree-fix-line-filename-length-calculation-01.patch
wget http://downloads.nutyx.org/files/patchs/libarchive/libarchive-$_libarchive-limit-write-requests-to-at-most-INT_MAX-01.patch
wget http://downloads.nutyx.org/files/patchs/libarchive/libarchive-$_libarchive-acl-01.patch
wget http://downloads.nutyx.org/files/patchs/libarchive/libarchive-$_libarchive-sparce-mtree-01.patch




crosstools () {
	
for i in file-$_file linux-$_linux m4-$_m4 ncurses-$_ncurses \
         pkg-config-lite-$_pkg gmp-$_gmp mpfr-$_mpfr mpc-$_mpc \
         isl-$_isl binutils-$_binutils gcc-$_gcc
         
do

echo "######## $i - cross-tools #####################################" | tee -a ${CLFS}/sources/clfs.log
echo | tee -a ${CLFS}/sources/clfs.log


cd $i

case $i in

file-$_file)
./configure  \
   --prefix=/cross-tools \
   --enable-shared 2>&1 | tee -a ${CLFS}/sources/clfs.log
   
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


linux-$_linux)
make mrproper
make ARCH=arm headers_check
install -v -m755 -d /tools/include
make ARCH=arm INSTALL_HDR_PATH=tmp headers_install 
cp -rv tmp/include/* /tools/include ;;


m4-$_m4)
./configure  \
   --prefix=/cross-tools 2>&1 | tee -a ${CLFS}/sources/clfs.log
   
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


ncurses-$_ncurses)
AWK=gawk ./configure  \
   --prefix=/cross-tools \
   --without-debug 2>&1 | tee -a ${CLFS}/sources/clfs.log 
   
make -C include 
make -C progs tic 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
install -v -m755 -d /cross-tools/bin
install -v -m755 progs/tic /cross-tools/bin ;;


pkg-config-lite-$_pkg )
./configure  \
   --prefix=/cross-tools \
   --host=${CLFS_TARGET}  \
   --with-pc-path=/tools/lib/pkgconfig:/tools/share/pkgconfig 2>&1 | tee -a ${CLFS}/sources/clfs.log
   
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


gmp-$_gmp)
./configure  \
   --prefix=/cross-tools \
   --enable-cxx   \
   --disable-static 2>&1 | tee -a ${CLFS}/sources/clfs.log
   
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make  install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


mpfr-$_mpfr)
patch -Np1 -i ../mpfr-3.1.3-fixes-1.patch

LDFLAGS="-Wl,-rpath,/cross-tools/lib" ./configure \
    --prefix=/cross-tools   \
    --disable-static \
    --with-gmp=/cross-tools 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


mpc-$_mpc)
LDFLAGS="-Wl,-rpath,/cross-tools/lib" ./configure  \
   --prefix=/cross-tools  \
   --disable-static   \
   --with-gmp=/cross-tools   \
   --with-mpfr=/cross-tools 2>&1 | tee -a ${CLFS}/sources/clfs.log
   
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


isl-$_isl)
LDFLAGS="-Wl,-rpath,/cross-tools/lib" ./configure  \
   --prefix=/cross-tools  \
   --disable-static   \
   --with-gmp-prefix=/cross-tools 2>&1 | tee -a ${CLFS}/sources/clfs.log
   
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


binutils-$_binutils)
mkdir -v ../binutils-build
cd ../binutils-build

AR=ar AS=as ../binutils-$_binutils/configure  \
   --prefix=/cross-tools    \
   --host=${CLFS_HOST}  \
   --target=${CLFS_TARGET}   \
   --with-sysroot=${CLFS}   \
   --with-lib-path=/tools/lib  \
   --disable-nls   \
   --disable-static  \
   --disable-multilib   \
   --enable-gold=yes  \
   --enable-plugins   \
   --enable-threads  \
   --disable-werror 2>&1 | tee -a ${CLFS}/sources/clfs.log
   
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


gcc-$_gcc)
patch -Np1 -i ../gcc-5.3.0-specs-1.patch

echo -en '\n#undef STANDARD_STARTFILE_PREFIX_1\n#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"\n' >> gcc/config/linux.h
echo -en '\n#undef STANDARD_STARTFILE_PREFIX_2\n#define STANDARD_STARTFILE_PREFIX_2 ""\n' >> gcc/config/linux.h
touch /tools/include/limits.h
mkdir -v ../gcc-build
cd ../gcc-build

AR=ar \
LDFLAGS="-Wl,-rpath,/cross-tools/lib" \
../gcc-$_gcc/configure \
    --prefix=/cross-tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_HOST} \
    --target=${CLFS_TARGET} \
    --with-sysroot=${CLFS} \
    --with-local-prefix=/tools \
    --with-native-system-header-dir=/tools/include \
    --disable-shared \
    --with-mpfr=/cross-tools \
    --with-gmp=/cross-tools \
    --with-isl=/cross-tools \
    --with-mpc=/cross-tools \
    --without-headers \
    --with-newlib \
    --disable-decimal-float \
    --disable-libgomp \
    --disable-libssp \
    --disable-libatomic \
    --disable-libitm \
    --disable-libsanitizer \
    --disable-libquadmath \
    --disable-libvtv \
    --disable-libcilkrts \
    --disable-libstdc++-v3 \
    --disable-threads \
    --disable-multilib \
    --enable-languages=c \
    --with-glibc-version=2.22 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make all-gcc -j7 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make all-target-libgcc -j7 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install-gcc 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install-target-libgcc 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;

esac
 
cd ..
rm -rf $i
echo | tee -a ${CLFS}/sources/clfs.log

done

	
	
}



tools () {

for i in gmp-$_gmp mpfr-$_mpfr mpc-$_mpc \
         isl-$_isl zlib-$_zlib binutils-$_binutils gcc-$_gcc \
         ncurses-$_ncurses bash-$_bash check-$_check coreutils-$_coreutils \
         diffutils-$_diffutils file-$_file findutils-$_findutils gawk-$_gawk \
         gettext-$_gettext attr-$_attr acl-$_acl grep-$_grep gzip-$_gzip make-$_make \
         patch-$_patch sed-$_sed tar-$_tar texinfo-$_texinfo util-linux-$_util \
         xz-$_xz expat-$_expat lzo-$_lzo bzip2-$_bzip2 nettle-$_nettle \
         gnutls-$_gnutls curl-$_curl libarchive-$_libarchive wget-$_wget
         
do

echo "######## $i - tools #####################################" | tee -a ${CLFS}/sources/clfs.log
echo | tee -a ${CLFS}/sources/clfs.log


case $i in

gmp-$_gmp)
tar xvf gmp-$_gmpa.tar.xz
cd gmp-$_gmp

./configure  \
   --prefix=/tools \
   --build=${CLFS_HOST} \
   --host=${CLFS_TARGET} \
   --enable-cxx  2>&1 | tee -a ${CLFS}/sources/clfs.log
   
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


mpfr-$_mpfr)
tar xvf mpfr-$_mpfr.tar.xz
cd mpfr-$_mpfr

patch -Np1 -i ../mpfr-3.1.3-fixes-1.patch

./configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


mpc-$_mpc)
tar xvf mpc-$_mpc.tar.gz
cd mpc-$_mpc

./configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


isl-$_isl)
tar xvf isl-$_isl.tar.xz 
cd isl-$_isl

./configure  \
   --prefix=/tools  \
   --build=${CLFS_HOST} \
   --host=${CLFS_TARGET} \
   --disable-static   \
   --with-gmp-prefix=/tools 2>&1 | tee -a ${CLFS}/sources/clfs.log
   
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


zlib-$_zlib)
tar xvf zlib-$_zlib.tar.gz 
cd zlib-$_zlib

./configure \
    --prefix=/tools  2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


binutils-$_binutils)
tar xvf binutils-$_binutils.tar.bz2
cd binutils-$_binutils

mkdir -v ../binutils-build
cd ../binutils-build

../binutils-$_binutils/configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} \
    --target=${CLFS_TARGET} \
    --with-lib-path=/tools/lib \
    --disable-nls \
    --enable-shared \
    --disable-multilib \
    --enable-gold=yes \
    --enable-plugins \
    --enable-threads 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


gcc-$_gcc)
tar xvf gcc-$_gcc.tar.bz2 
cd gcc-$_gcc

patch -Np1 -i ../gcc-5.3.0-specs-1.patch

echo -en '\n#undef STANDARD_STARTFILE_PREFIX_1\n#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"\n' >> gcc/config/linux.h
echo -en '\n#undef STANDARD_STARTFILE_PREFIX_2\n#define STANDARD_STARTFILE_PREFIX_2 ""\n' >> gcc/config/linux.h
cp -v gcc/Makefile.in{,.orig}
sed 's@\./fixinc\.sh@-c true@' gcc/Makefile.in.orig > gcc/Makefile.in
mkdir -v ../gcc-build
cd ../gcc-build

../gcc-$_gcc/configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} \
    --target=${CLFS_TARGET} \
    --with-local-prefix=/tools \
    --disable-multilib \
    --enable-languages=c,c++  \
    --with-native-system-header-dir=/tools/include \
    --disable-libssp \
    --enable-install-libiberty 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make AS_FOR_TARGET="${AS}" \
    LD_FOR_TARGET="${LD}" -j7 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
    
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


ncurses-$_ncurses)
tar xvf ncurses-$_ncurses.tar.gz
cd ncurses-$_ncurses

./configure \
    --prefix=/tools \
    --with-shared \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} \
    --without-debug \
    --without-ada \
    --enable-overwrite \
    --with-build-cc=gcc 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


bash-$_bash)
cd bash-$_bash
patch -Np1 -i ../bash-4.3-branch_update-5.patch

cat > config.cache << "EOF"
ac_cv_func_mmap_fixed_mapped=yes
ac_cv_func_strcoll_works=yes
ac_cv_func_working_mktime=yes
bash_cv_func_sigsetjmp=present
bash_cv_getcwd_malloc=yes
bash_cv_job_control_missing=present
bash_cv_printf_a_format=yes
bash_cv_sys_named_pipes=present
bash_cv_ulimit_maxfds=yes
bash_cv_under_sys_siglist=yes
bash_cv_unusable_rtsigs=no
gt_cv_int_divbyzero_sigfpe=yes
EOF

./configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} \
    --without-bash-malloc \
    --cache-file=config.cache 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


check-$_check)
cd check-$_check

./configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


coreutils-$_coreutils)
cd coreutils-$_coreutils

cat > config.cache << EOF
fu_cv_sys_stat_statfs2_bsize=yes
gl_cv_func_working_mkstemp=yes
EOF

patch -Np1 -i ../coreutils-8.23-noman-1.patch

./configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} \
    --enable-install-program=hostname \
    --cache-file=config.cache 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


diffutils-$_diffutils)
cd diffutils-$_diffutils

./configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


file-$_file)
tar xvf file-$_file.tar.gz 
cd file-$_file

./configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


findutils-$_findutils)
cd findutils-$_findutils

echo "gl_cv_func_wcwidth_works=yes" > config.cache
echo "ac_cv_func_fnmatch_gnu=yes" >> config.cache

./configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} \
    --cache-file=config.cache 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


wget-$_wget)
cd wget-$_wget
./configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} \
    --sysconfdir=/tools/etc 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


gawk-$_gawk)
cd gawk-$_gawk

./configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


gettext-$_gettext)
cd gettext-$_gettext

./configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} \
    --disable-shared 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make  2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


attr-$_attr)
cd attr-$_attr

sed -i -e 's|/@pkg_name@|&-@pkg_version@|' include/builddefs.in
sed -i -e "/SUBDIRS/s|man2||" man/Makefile

./configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} \
    --enable-static 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log 
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log 
make install-lib 2>&1 | tee -a ${CLFS}/sources/clfs.log 
make install-dev 2>&1 | tee -a ${CLFS}/sources/clfs.log 

mv -v /tools/usr/lib/libattr.so.* /tools/lib
ln -sfv ../../lib/libattr.so.1 /tools/usr/lib/libattr.so ;;


acl-$_acl)
cd acl-$_acl

sed -i -e 's|/@pkg_name@|&-@pkg_version@|' include/builddefs.in

sed -i -e "/TABS-1;/a if (x > (TABS-1)) x = (TABS-1);" \
libacl/__acl_to_any_text.c

./configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} \
    --enable-static \
    --libexecdir=/tools/usr/lib 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log 
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log 
make install-lib 2>&1 | tee -a ${CLFS}/sources/clfs.log 
make install-dev 2>&1 | tee -a ${CLFS}/sources/clfs.log  ;;


grep-$_grep)
cd grep-$_grep

./configure \
    --prefix=/tools \
    --bindir=/tools/bin \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} \
    --without-included-regex 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


gzip-$_gzip)
cd gzip-$_gzip

./configure \
    --prefix=/tools \
    --bindir=/tools/bin \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


make-$_make)
cd make-$_make

./configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


patch-$_patch)
cd patch-$_patch

./configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


sed-$_sed)
cd sed-$_sed

./configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


tar-$_tar)
cd tar-$_tar

cat > config.cache << EOF
gl_cv_func_wcwidth_works=yes
gl_cv_func_btowc_eof=yes
ac_cv_func_malloc_0_nonnull=yes
gl_cv_func_mbrtowc_incomplete_state=yes
gl_cv_func_mbrtowc_nul_retval=yes
gl_cv_func_mbrtowc_null_arg1=yes
gl_cv_func_mbrtowc_null_arg2=yes
gl_cv_func_mbrtowc_retval=yes
gl_cv_func_wcrtomb_retval=yes
EOF

./configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} \
    --cache-file=config.cache 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


texinfo-$_texinfo)
cd texinfo-$_texinfo

PERL=/usr/bin/perl \
./configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


util-linux-$_util)
cd util-linux-$_util

./configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} \
    --disable-makeinstall-chown \
    --disable-makeinstall-setuid \
    --without-python 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


xz-$_xz)
cd xz-$_xz

./configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


expat-$_expat)
cd expat-$_expat

./configure \
    --prefix=/tools \
    --enable-static \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


lzo-$_lzo)
cd lzo-$_lzo

./configure \
    --prefix=/tools \
    --enable-static \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


bzip2-$_bzip2)
cd bzip2-$_bzip2

sed -i 's/CC=gcc//' Makefile
sed -i 's/AR=ar//' Makefile
sed -i 's/RANLIB=ranlib//' Makefile
sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile
make -f Makefile-libbz2_so
make clean
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make PREFIX=/tools install   

cp -v bzip2-shared /tools/bin/bzip2
cp -av libbz2.so* /tools/lib
ln -sv ../../lib/libbz2.so.1.0 /tools/usr/lib/libbz2.so
rm -v /tools/usr/bin/{bunzip2,bzcat,bzip2}
ln -sv bzip2 /tools/bin/bunzip2
ln -sv bzip2 /tools/bin/bzcat ;;


nettle-$_nettle)
cd nettle-$_nettle

./configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} \
    --enable-static 2>&1 | tee -a ${CLFS}/sources/clfs.log

make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 
chmod -v 755 /tools/lib/libhogweed.so.4.1 /tools/lib/libnettle.so.6.1 ;;


gnutls-$_gnutls)
cd gnutls-$_gnutls

./configure --prefix=/tools \
            --with-default-trust-store-file=/etc/ssl/ca-bundle.crt \
            --with-included-libtasn1 \
            --enable-static \
            --build=${CLFS_HOST} \
            --host=${CLFS_TARGET} \
            --without-p11-kit 2>&1 | tee -a ${CLFS}/sources/clfs.log

make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;


curl-$_curl)
cd curl-$_curl

./configure \
    --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} \
    --enable-static    \
    --enable-threaded-resolver \
    --with-gnutls=/tools 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;

libarchive-$_libarchive)
cd libarchive-$_libarchive

patch -Np1 -i ../libarchive-$_libarchive-mtree-fix-line-filename-length-calculation-01.patch
patch -Np1 -i ../libarchive-$_libarchive-limit-write-requests-to-at-most-INT_MAX-01.patch
patch -Np1 -i ../libarchive-$_libarchive-acl-01.patch
patch -Np1 -i ../libarchive-$_libarchive-sparce-mtree-01.patch

./configure --prefix=/tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_TARGET} \
    --mandir=/tools/usr/share/man \
    --bindir=/tools/bin \
    --without-xml2 \
    --infodir=/tools/usr/share/info 2>&1 | tee -a ${CLFS}/sources/clfs.log
    

make  2>&1 | tee -a ${CLFS}/sources/clfs.log
make install 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1 ;;



esac
 
cd ..
rm -rf $i
echo | tee -a ${CLFS}/sources/clfs.log

done

	
	
}


crosstools

rm -rf gcc-build
rm -rf binutils-build


echo "######## glibc-$_glibc - tools #####################################" | tee -a ${CLFS}/sources/clfs.log
echo | tee -a ${CLFS}/sources/clfs.log

cd glibc-$_glibc

mkdir -v ../glibc-build
cd ../glibc-build

BUILD_CC="gcc" \
CC="${CLFS_TARGET}-gcc" \
AR="${CLFS_TARGET}-ar" \
RANLIB="${CLFS_TARGET}-ranlib" \
../glibc-$_glibc/configure \
    --prefix=/tools \
    --host=${CLFS_TARGET} \
    --build=${CLFS_HOST} \
    --disable-profile \
    --enable-kernel=2.6.32 \
    --with-binutils=/cross-tools/bin \
    --with-headers=/tools/include \
    --enable-obsolete-rpc 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make 2>&1 | tee -a ${CLFS}/sources/clfs.log || exit 1
make install  2>&1 | tee -a ${CLFS}/sources/clfs.log 

cd ..
rm -rf glibc-$_glibc
rm -rf glibc-build
echo | tee -a ${CLFS}/sources/clfs.log


echo "######## gcc-$_gcc pass 2 - cross-tools #####################################" | tee -a ${CLFS}/sources/clfs.log
echo | tee -a ${CLFS}/sources/clfs.log

tar xvf gcc-$_gcc.tar.bz2 
cd gcc-$_gcc

patch -Np1 -i ../gcc-5.3.0-specs-1.patch

echo -en '\n#undef STANDARD_STARTFILE_PREFIX_1\n#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"\n' >> gcc/config/linux.h
echo -en '\n#undef STANDARD_STARTFILE_PREFIX_2\n#define STANDARD_STARTFILE_PREFIX_2 ""\n' >> gcc/config/linux.h
mkdir -v ../gcc-build
cd ../gcc-build

AR=ar \
LDFLAGS="-Wl,-rpath,/cross-tools/lib" \
../gcc-$_gcc/configure \
    --prefix=/cross-tools \
    --build=${CLFS_HOST} \
    --target=${CLFS_TARGET} \
    --host=${CLFS_HOST} \
    --with-sysroot=${CLFS}\
    --with-local-prefix=/tools \
    --with-native-system-header-dir=/tools/include \
    --disable-nls \
    --disable-static \
    --enable-languages=c,c++ \
    --disable-multilib \
    --with-mpc=/cross-tools \
    --with-mpfr=/cross-tools \
    --with-gmp=/cross-tools \
    --with-isl=/cross-tools 2>&1 | tee -a ${CLFS}/sources/clfs.log
    
make AS_FOR_TARGET="${CLFS_TARGET}-as" \
    LD_FOR_TARGET="${CLFS_TARGET}-ld" 2>&1 | tee -a ${CLFS}/sources/clfs.log 
    
make install  2>&1 | tee -a ${CLFS}/sources/clfs.log 
    
cd ..
rm -rf gcc-$_gcc
rm -rf gcc-build
echo | tee -a ${CLFS}/sources/clfs.log



export CC="${CLFS_TARGET}-gcc"
export CXX="${CLFS_TARGET}-g++"
export AR="${CLFS_TARGET}-ar"
export AS="${CLFS_TARGET}-as"
export RANLIB="${CLFS_TARGET}-ranlib"
export LD="${CLFS_TARGET}-ld"
export STRIP="${CLFS_TARGET}-strip"



tools 

rm -rf gcc-build
rm -rf binutils-build





#############################################
echo
echo
echo "Type \"exit\" to logging as \"root\""
echo "You can now run \"nutyx-arm\" to enter in the \"chroot\""
echo "and then \"./nutyx-arm-4.sh\" to continue"
echo
echo "Tapez \"exit\" pour ouvrir une session en tant que \"root\""
echo "Vous pouvez maintenant exécuter \"nutyx-arm\" pour entrer dans le \"chroot\""
echo "et ensuite \"./nutyx-arm-4.sh\" pour continuer"
echo
echo










