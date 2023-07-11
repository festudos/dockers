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





COMMANDOS_ARRAY=(
"mkdir -p ${U_HOME}"
"chown kasm-user:kasm-user ${HOME}"
"chown -R kasm-user:kasm-user ${U_HOME}"
"cp $INST_DIR/tools/conf_copy_.zshrc ${U_HOME}/.zshrc"
"if [ -f ${X_CLIENTES} ]; then rm -f $X_CLIENTES;fi "
"echo ${VAR_DE_TESTE}"
)







f_Exec_Eval