#!/usr/bin/env bash
if  [ -d /opt/sentinelone ] ;
then
    printf "> Define root password\n"
    passwd
    sudo /opt/sentinelone/bin/sentinelctl control start
fi