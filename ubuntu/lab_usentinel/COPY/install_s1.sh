#!/usr/bin/env bash
set -ex
function f_Exec_Eval() { 
    for COMMAND in "${COMMANDOS_ARRAY[@]}";
    do 
        if ! eval $COMMAND 1>& /dev/null ;
        then 
            echo -e  "\n\t\e[0;36;1m$COMMAND\e[0m\t[""\e[5;31;1mERRO\e[0m""]" 
            echo -e  "$COMMAND\t[ERRO]" >> dockerfile_erros.txt 
        else 
            echo -e  "\n\t\e[0;36;1m$COMMAND\e[0m\t[""\e[0;34;1mOK\e[0m""]" 
        fi 
    done 
}

TOKEN_S1='eyJ1cmwiOiAiaHR0cHM6Ly91c2VhMS0zMDAtbmZyLnNlbnRpbmVsb25lLm5ldCIsICJzaXRlX2tleSI6ICJnXzc4OThhNDkxYTM4MTdhN2QifQ=='
CENTINELCTL='/opt/sentinelone/bin/sentinelctl'
CENTINEL_CMD="${CENTINELCTL} management token set $TOKEN_S1"

COMMANDOS_ARRAY=(
"apt install ./SentinelAgent_linux_v23_1_2_9.deb"
"if [ -f ${CENTINELCTL} ]; then $(eval ${CENTINEL_CMD}) ;fi "
)











f_Exec_Eval