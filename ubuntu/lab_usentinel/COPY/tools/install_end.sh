#!/usr/bin/env bash
set -ex
declare COMMAND
function f_Exec_Linha() { # [COMMAND]
    
    if ! eval $COMMAND 1>& /dev/null ; then 
        echo -e  "\n\t\e[0;36;1m$COMMAND\e[0m\t[""\e[5;31;1mERRO\e[0m""]" 
    else
        echo -e  "\n\t\e[0;36;1m$COMMAND\e[0m\t[""\e[0;34;1mOK\e[0m""]"
    fi
}
COMMANDOS=(
'apt-get update'
'apt --fix-broken install -y'
'apt install --fix-missing -y'
'apt-get update '
'apt upgrade -y'
'apt -y autoremove'
'apt-get -y clean'
'apt-get -y purge'
'apt-get -y autoclean'
)
for COMMAND in "${COMMANDOS[@]}"
do
    f_Exec_Linha
done