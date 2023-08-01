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
AS_USER="su - $KASM_USER -c "

COMMANDOS_ARRAY=(
"echo 'Configurations'" 
# Create home if not done
"$AS_USER 'mkdir -p -m 775 $KASM_HOME $KASM_HOME/Desktop'"
# COPY files permission
"chown -R $KASM_USER:$KASM_USER $SCRIPT_DIR"
"chmod -R 775 $SCRIPT_DIR"
"chown $KASM_USER:$KASM_USER /usr/share/applications/htop.desktop"
"chmod -R 775 /usr/share/applications/htop.desktop"
"rm -dr  /usr/share/backgrounds/xfce  /usr/share/extra/backgrounds"
"mkdir -m 775 /usr/share/backgrounds/xfce  /usr/share/extra/backgrounds"
# files cp
"$AS_USER 'cp $SCRIPT_DIR/tools/conf_copy_.zshrc $KASM_HOME/.zshrc'"
"$AS_USER 'cp $SCRIPT_DIR/tools/open_s1.sh $KASM_HOME/Desktop/open_s1.sh'"
# backgrounds Change
"cp $SCRIPT_DIR/bg_default.png /usr/share/extra/backgrounds/bg_default.png"
"cp $SCRIPT_DIR/bg_default.jpg /usr/share/backgrounds/xfce/xfce-blue.jpg"
"cp $SCRIPT_DIR/bg_default.jpg /usr/share/backgrounds/xfce/xfce-teal.jpg"
"cp $SCRIPT_DIR/bg_default.png /usr/share/backgrounds/xfce/xfce-stripes.png"
"cp $SCRIPT_DIR/bg_default.png /usr/share/backgrounds/xfce/xfce-verticals.png"
"chmod -R 775 /usr/share/backgrounds/xfce  /usr/share/extra/backgrounds"
"chown -R $KASM_USER:$KASM_USER /usr/share/backgrounds/xfce  /usr/share/extra/backgrounds"
# htop on desktop
"$AS_USER 'cp /usr/share/applications/htop.desktop $KASM_HOME/Desktop/htop.desktop'"
# $KASM_USER  Change
"usermod -a $KASM_USER -G sudo"
" echo '/bin/zsh' | tee -a $KASM_HOME/.bashrc"
"passwd -d $KASM_USER"
)

f_Exec_Eval