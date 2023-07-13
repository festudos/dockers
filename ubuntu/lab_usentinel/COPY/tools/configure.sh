#!/usr/bin/env bash
set -ex
function f_Exec_Eval() { 
    for COMMAND in "${COMMANDOS_ARRAY[@]}";
    do 
        if ! eval $COMMAND 1>& /dev/null ;
        then 
            echo -e  "\n\t\e[0;36;1m$COMMAND\e[0m\t[""\e[5;31;1mERRO\e[0m""]" 
            
        else 
            echo -e  "\n\t\e[0;36;1m$COMMAND\e[0m\t[""\e[0;34;1mOK\e[0m""]" 
        fi 
    done 
}

 
COMMANDOS_ARRAY=(
"mkdir -p $KASM_HOME"
"mkdir -p $KASM_HOME/Desktop"
"chown -R $KASM_USER:$KASM_USER $KASM_HOME"
"cp $SCRIPT_DIR/tools/conf_copy_.zshrc $KASM_HOME/.zshrc"
"cp $SCRIPT_DIR/install_s1.sh $KASM_HOME/Desktop/install_s1.sh"
"cp $SCRIPT_DIR/SentinelAgent_linux_v23_1_2_9.deb $KASM_HOME/Desktop/SentinelAgent_linux_v23_1_2_9.deb"
"chmod -R 777 $KASM_HOME/Desktop"
"usermod -a $KASM_USER -G sudo"
"passwd -d $KASM_USER"
)







f_Exec_Eval