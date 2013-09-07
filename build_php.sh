#!/bin/sh
. ./build_dependencies.sh
cd php-5.5.1/
setenv_arm7
export ARCH=arm
export LIBS="-lresolv"
export phpprefix=/opt/php5/

mkdir -p $phpprefix/etc/php.ini.d
cp php.ini-development $phpprefix/etc/php.ini

#$CC $CFLAGS conftest.c
make clean
#--disable-libxml --disable-dom --disable-simplexml --disable-xml --disable-xmlreader --disable-xmlwriter --without-pear --enable-intl 
./configure --prefix=$phpprefix --with-config-file-path=$phpprefix/etc --with-config-file-scan-dir=$phpprefix/etc/php.ini.d --host=armv7-apple-darwin --enable-opcache=no --enable-shared=no --enable-mbstring --without-openssl --without-iconv --disable-cgi --disable-phar --without-pear --with-libxml-dir=$phpprefix
make -j 4 && make install
