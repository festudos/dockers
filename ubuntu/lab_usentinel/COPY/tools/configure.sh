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
"echo 'Configurations'" 
# Create home if not done
"mkdir -p -m 777 $KASM_HOME"
"mkdir -p -m 777 $KASM_HOME/Desktop"
"chown -R $KASM_USER:$KASM_USER $KASM_HOME"/
# COPY files permission
"chown -R $KASM_USER:$KASM_USER $SCRIPT_DIR"
"chmod -R 777 $SCRIPT_DIR"
# files cp
"cp $SCRIPT_DIR/tools/conf_copy_.zshrc $KASM_HOME/.zshrc"
"cp $SCRIPT_DIR/install_s1.sh $KASM_HOME/Desktop/install_s1.sh"
"cp $SCRIPT_DIR/SentinelAgent_linux_v23_1_2_9.deb $KASM_HOME/Desktop/SentinelAgent_linux_v23_1_2_9.deb"
# backgrounds Change
"mv /usr/share/extra/backgrounds/bg_default.png /usr/share/extra/backgrounds/bg_default.png-bkp"
"cp $SCRIPT_DIR/bg_default.png /usr/share/extra/backgrounds/bg_default.png"
"rm -rd /usr/share/backgrounds/xfce"
"cp $SCRIPT_DIR/bg_default.png /usr/share/backgrounds/bg_default.png"
# htop on desktop
"chown $KASM_USER:$KASM_USER /usr/share/applications/htop.desktop"
"cp /usr/share/applications/htop.desktop $KASM_HOME/Desktop/htop.desktop"
# $KASM_USER  Change
"chmod -R 777 $KASM_HOME/Desktop" # Sempre fazer , Chrome
"chmod -R 777 /usr/share"
"usermod -a $KASM_USER -G sudo"
"usermod --shell /bin/zsh $KASM_USER"
" echo '/bin/zsh' | tee -a $KASM_HOME/.bashrc"
" echo 'sentinel_v23.1.2.9' | tee /etc/hostname"
"passwd -d $KASM_USER"
)

f_Exec_Eval