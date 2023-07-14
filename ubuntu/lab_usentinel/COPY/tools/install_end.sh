#!/usr/bin/env bash
set -ex
function f_Exec_Eval() { 
    for COMMAND in "${COMMANDOS_ARRAY[@]}";
    do 
        LETRAS="$COMMAND                                                  " # <<<
        LETRAS="${LETRAS:0:50}"
        if [ "${COMMAND:0:4}" = "echo" ]
        then echo -e "\n\t \e[0;33;1m ${COMMAND:4}\e[0m "
        elif ! eval $COMMAND 1>& /dev/null ;
        then echo -e  "\n\t\e[0;36;1m$LETRAS\e[0m\t[""\e[5;31;1mERRO\e[0m""]" 
        else echo -e  "\n\t\e[0;36;1m$LETRAS\e[0m\t[""\e[0;34;1mOK\e[0m""]" 
        fi 
    done 
}

GET_APT="apt-get -y " 
 
COMMANDOS_ARRAY=(
"echo 'Final Install'" 
"${GET_APT} update"
"apt --fix-broken install -y"
"apt install --fix-missing -y"
"${GET_APT} update "
"apt upgrade -y"
"${GET_APT} autoremove"
"${GET_APT} autoclean"
"${GET_APT} clean"
"${GET_APT} purge"
)

f_Exec_Eval