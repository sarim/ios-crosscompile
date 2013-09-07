#!/bin/sh
. ./build_dependencies.sh
cd ZendOptimizerPlus-7.0.2/
setenv_arm7
export ARCH=arm
#export LIBS="-lresolv"
export phpprefix=/opt/php5/


make clean

$phpprefix/bin/phpize

patch -p1 < ../opcache.diff

./configure --prefix=$phpprefix --host=armv7-apple-darwin
make -j 4