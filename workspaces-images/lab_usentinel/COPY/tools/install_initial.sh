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


COMMANDOS_ARRAY=(
"echo 'Initial Install'" 
"apt-get update"
"apt-get upgrade -y"
"apt-get install -y  apt-utils"
"apt-get install -y  net-tools"
"apt-get install -y  iputils-ping"
"apt-get install -y  ethtool"
"apt-get install -y  curl"
"apt-get install -y  wget"
"apt-get install -y  htop"
"apt-get install -y  nano"
"apt-get install -y  zsh"
"apt-get install -y  zsh-autosuggestions"
"apt-get install -y  zsh-syntax-highlighting"
"apt-get install -y  git"
"apt-get install -y  tmux"
"apt-get install -y  7zip"

)

f_Exec_Eval