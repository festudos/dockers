#!/bin/bash
### BEGIN INIT INFO
# Provides:          pyftpd
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     5
# Default-Stop:      0 1 6
# Short-Description: Start ftp service
# Description:       Enable FTP include in /etc/var_pyftpdlib.
### END INIT INFO
USAGE="Usage: {start|stop --force|restart|status}"
if [  $# -eq 0 ];then  echo -e "$USAGE" ;exit ;fi

function f_Unlock {
    if [ "$UNLOCK" == 1 ];
    then sudo chmod 666 $VAR_FILE_FTP $LOG_FILE_FTP > /dev/null 2>&1
    else sudo chmod 640 $VAR_FILE_FTP $LOG_FILE_FTP > /dev/null 2>&1
    fi
}
function f_Var_Define {
    VAR_FILE_FTP="/etc/var_pyftpdlib"
    NUM_TESTE='^[0-9]+$'
    UNLOCK=1 ; f_Unlock ; unset UNLOCK
    if  [ -f $VAR_FILE_FTP ];then
        while IFS= read -r U_LINE ;do
            LINE="export $U_LINE > /dev/null 2>&1"
            if ! eval $LINE
            then echo -e "> Fail:erro na coleta de variavel"
            fi
        done < "$VAR_FILE_FTP"
        f_Unlock
        [ -z $LOG_FILE_FTP ] && LOG_FILE_FTP=/tmp/log_pyftpdlib.txt
        if  [ -z $FTP_FILE ] || [ -z $FTP_PORT ]
        then echo -e "> Fail:erro na coleta, variavel vazias"
        fi
    else
        echo -e "> Fail:no file detect \n> Please create: $VAR_FILE_FTP\n  FTP_FILE=()\n  FTP_PORT=()\n  USERS=('butt') \n  PASSWDS=('Wm5Sd0NnPT0K')\n  LOG_FILE_FTP=/tmp/log_pyftpdlib.txt"
        exit
    fi
}
function f_Add_File {
        unset NUM_HOME
        sudo touch $VAR_FILE_FTP
        while ! [ $NUM_HOME =~ $NUM_TESTE ];
        do  read -p "Numero de Pastas:" NUM_HOME
        done
        [ $NUM_HOME -lt 0 ] && exit

        while [ $NUM_HOME -gt 0 ]
        do
            read -p "Pastas $NUM_HOME :" FTP_FILE[$NUM_HOME]

            NUM_HOME=$(($NUM_HOME-1))
        done
        while ! [ $NUM_HOME =~ $NUM_TESTE ];
        do  read -p "Porta Inicial:" FTP_PORT
        done
}
# Chek  sudo
function f_Check_Sudo {
if [ $EUID -ne 0 ]; then
    echo -n "> Give SUDO permission:"
    SUDO=$(sudo echo -e "Thanks" )
    if [[ $SUDO != "Thanks" ]]; then exit ; fi
        echo -e "  $SUDO \n"
#else
 #   echo "Don´t 'sudo' this service !"
  #  exit
fi
}

# Chek Pakeges
function f_Check_Pkg {
BASE_py="/usr/bin/python3"
BASE_pi="/usr/bin/pip"
MSGM="Bibliotecas não detectadas:"
if  [ -f $BASE_py ];then
  if [ -f $BASE_pi ];then
    VAR_LOG_i=0
  else echo "$MSGM BASE_pi=$BASE_pi"; exit;fi
else echo "$MSGM BASE_py=$BASE_py"; exit;fi
}

# Log File
function f_Cat_Log {  # (Cat_Log_Result _Array)
    UNLOCK=1 ; f_Unlock ; unset UNLOCK
    if [ -f $LOG_FILE_FTP ];
    then
        LOG_TEXT_1=">>> starting FTP server on "
        LOG_TEXT_2=", pid="
        unset Cat_Log_Result Cat_Log_Result_Array
        VAR_LOG_i=0
        while IFS= read -r LINE ;do
        #readarray  LOG_FTP_TEXT < "$LOG_FILE_FTP"
        #for LINE in `seq 0 ${#LOG_FTP_TEXT[@]}`:do
            if [[ "$LINE" = *"$LOG_TEXT_1"* ]]
            then
                VAR_TEMP=${LINE/*"$LOG_TEXT_2"/''}
                VAR_TEMP=${VAR_TEMP//' '/''}
                VAR_TEMP=${VAR_TEMP//'<'/''}
#                echo -e "${VAR_TEMP}"
                Cat_Log_Result=$VAR_TEMP
                Cat_Log_Result_Array[$VAR_LOG_i]=$VAR_TEMP
                VAR_LOG_i=$(($VAR_LOG_i+1))
            fi
        done < "$LOG_FILE_FTP"
        f_Unlock
    fi
}

# init
    f_Check_Sudo
    unset UNLOCK
    f_Unlock
    f_Var_Define    
    f_Check_Pkg
    f_Cat_Log
   
    case "$1" in
        start)
            if [ ${#Cat_Log_Result_Array[@]} -gt 0 ];then
                echo "pyftpdlib already running: ${Cat_Log_Result_Array[@]} "
                exit
            fi
            TOTAL=$((${#FTP_FILE[@]}-1))
            UNLOCK=1 ; f_Unlock ; unset UNLOCK
            for N_FILES in `seq 0 ${TOTAL}`;do
                if ! [ -f $LOG_FILE_FTP ]
                then sudo touch $LOG_FILE_FTP
                    echo "" | sudo tee $LOG_FILE_FTP
                    sudo chmod 777 $LOG_FILE_FTP
                fi
                if [ -z $USER_FTP ];then USER_FTP=$(id -n -u 1000);fi
                LOGIN_TOTAL=$((${#USERS[@]}-1))
                # Se USERS e PASSWDS não vazios
                if  ! [ -z $USERS ] && ! [ -z $PASSWDS ]; then 
                    for LOGIN in `seq 0 ${LOGIN_TOTAL}`;do
                        DECO=$(echo "${PASSWDS[$LOGIN]}" | base64 -d | base64 -d )
                        ALL_USERS="$ALL_USERS -u ${USERS[$LOGIN]} -P $DECO "
                    done
                fi
                COMMAND="su - $USER_FTP -c 'python3 -m pyftpdlib -w -p ${FTP_PORT[$N_FILES]} -d ${FTP_FILE[$N_FILES]} $ALL_USERS >> $LOG_FILE_FTP 2>&1 & '"
                if ! eval $COMMAND ;
                then
                    echo -e "\n\t Fail: python3 -m pyftpdlib \n"
                else
                    echo -e "> Service Started: PORT:${FTP_PORT[$N_FILES]} FILE ${FTP_FILE[$N_FILES]} PID ${Cat_Log_Result_Array[$N_FILES]}. "
                fi
            done
            sleep 2
            f_Cat_Log
            echo -e "> Service PID: ${Cat_Log_Result_Array[@]}\n"
            UNLOCK=1 ; f_Unlock ; unset UNLOCK
            cat $LOG_FILE_FTP
            f_Unlock
        ;;
        stop)
            if [  ${#Cat_Log_Result_Array[@]} -eq 0 ]
            then echo "> Pyftpd NOT running ${Cat_Log_Result_Array[@]} "
            fi
            for N_PID in "${Cat_Log_Result_Array[@]}";do
                COMMAND="sudo kill ${N_PID}"
                if ! eval $COMMAND
                then    echo -e "\n\t Fail: kill ${N_PID} : $! \n"
                else    echo -e "> Service Stoped: PID ${N_PID} \n"
                        sleep 2
                        sudo mv "$LOG_FILE_FTP" "$LOG_FILE_FTP-kp" > /dev/null 2>&1
                fi
                if [ "$2" = "--force" ];then sudo mv "$LOG_FILE_FTP" "$LOG_FILE_FTP-kp" > /dev/null 2>&1 ;fi
            done
        ;;
        restart)
            $0 stop
            $0 start
        ;;

        status)
            if [  ${#Cat_Log_Result_Array[@]} -eq 0 ]
            then echo "> No Service Found"
            else echo "> PID: ${Cat_Log_Result_Array[@]}"
            fi
            ;;

        *)
            echo -e "$USAGE"
            exit 1
    esac
unset UNLOCK ; f_Unlock 