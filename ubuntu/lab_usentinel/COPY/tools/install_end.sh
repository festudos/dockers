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

GET_APT="apt-get -y " 



COMMANDOS_ARRAY=(
"${GET_APT} update"
"apt --fix-broken install -y"
"apt install --fix-missing -y"
"${GET_APT} update "
"apt upgrade -y"
"apt -y autoremove"
"${GET_APT} clean"
"${GET_APT} purge"
"${GET_APT} autoclean"
)




f_Exec_Eval