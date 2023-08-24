#!/usr/bin/env bash
    set -ex
    TOKEN_S1='eyJ1cmwiOiAiaHR0cHM6Ly91c2VhMS0zMDAtbmZyLnNlbnRpbmVsb25lLm5ldCIsICJzaXRlX2tleSI6ICJnXzc4OThhNDkxYTM4MTdhN2QifQ=='
    COMMAND="apt install -y $SCRIPT_DIR/SentinelAgent_$SENTINEL_V.deb"
    if ! eval $COMMAND 1>& /dev/null ;
    then 
        echo -e  "\n\t\e[0;36;1m$COMMAND\e[0m\t[""\e[5;31;1mERRO\e[0m""]" 
    else 
        echo -e  "\n\t\e[0;36;1m$COMMAND\e[0m\t[""\e[0;34;1mOK\e[0m""]" 
        /opt/sentinelone/bin/sentinelctl management token set $TOKEN_S1
    fi 
