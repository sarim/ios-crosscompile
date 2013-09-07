#!/bin/sh
IOS_IP=192.168.1.186
ssh root@$IOS_IP "rm -rf /opt/php5"
scp -r /opt/php5/ root@$IOS_IP:/opt/php5/
ssh root@$IOS_IP "mkdir -p /opt/php5/lib/php/extensions/no-debug-non-zts-20121212/"
scp ./ZendOptimizerPlus-7.0.2/modules/opcache.so root@192.168.1.186:/opt/php5/lib/php/extensions/no-debug-non-zts-20121212/