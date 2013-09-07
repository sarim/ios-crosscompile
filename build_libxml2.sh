#!/bin/sh
. ./build_dependencies.sh
cd libxml2-2.6.32/
setenv_arm7
export ARCH=arm
export phpprefix=/opt/php5/

make clean
./configure --prefix=$phpprefix --host=armv7-apple-darwin --enable-shared=no --without-python --disable-dependency-tracking
make -j 4 && make install

## delete space eatings docs
cd $phpprefix/share/ && rm -r ./doc ./gtk-doc