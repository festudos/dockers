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

GET_APT="apt-get install -y "
 
 
COMMANDOS_ARRAY=(
"echo 'Initial Install'" 
"apt-get update"
"apt-get upgrade -y"
"${GET_APT} apt-utils"
"${GET_APT} net-tools"
"${GET_APT} ethtool"
"${GET_APT} curl"
"${GET_APT} wget"
"${GET_APT} htop"
"${GET_APT} nano"
"${GET_APT} zsh"
"${GET_APT} zsh-autosuggestions"
"${GET_APT} zsh-syntax-highlighting"
"${GET_APT} git"
"${GET_APT} tmux"

)

f_Exec_Eval