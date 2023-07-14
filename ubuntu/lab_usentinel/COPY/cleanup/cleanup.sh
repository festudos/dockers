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
"echo 'File cleanups'" 
"rm -Rf /home/kasm-default-profile/.cache" 
"rm -Rf /home/kasm-user/.cache" 
"rm -Rf /tmp" 
"rm -Rf /var/lib/apt/lists/*" 
"rm -Rf /var/tmp/*" 
"mkdir -m 777 /tmp"
"echo 'Services we dont want to start disable in xfce init'" 
"rm -f /etc/xdg/autostart/blueman.desktop" 
"rm -f /etc/xdg/autostart/geoclue-demo-agent.desktop" 
"rm -f /etc/xdg/autostart/gnome-keyring-pkcs11.desktop" 
"rm -f /etc/xdg/autostart/gnome-keyring-secrets.desktop" 
"rm -f /etc/xdg/autostart/gnome-keyring-ssh.desktop " 
"rm -f /etc/xdg/autostart/gnome-shell-overrides-migration.desktop" 
"rm -f /etc/xdg/autostart/light-locker.desktop" 
"rm -f /etc/xdg/autostart/org.gnome.Evolution-alarm-notify.desktop" 
"rm -f /etc/xdg/autostart/org.gnome.SettingsDaemon.A11ySettings.desktop" 
"rm -f /etc/xdg/autostart/org.gnome.SettingsDaemon.Color.desktop" 
"rm -f /etc/xdg/autostart/org.gnome.SettingsDaemon.Datetime.desktop" 
"rm -f /etc/xdg/autostart/org.gnome.SettingsDaemon.Housekeeping.desktop" 
"rm -f /etc/xdg/autostart/org.gnome.SettingsDaemon.Keyboard.desktop" 
"rm -f /etc/xdg/autostart/org.gnome.SettingsDaemon.MediaKeys.desktop" 
"rm -f /etc/xdg/autostart/org.gnome.SettingsDaemon.Power.desktop" 
"rm -f /etc/xdg/autostart/org.gnome.SettingsDaemon.PrintNotifications.desktop" 
"rm -f /etc/xdg/autostart/org.gnome.SettingsDaemon.Rfkill.desktop" 
"rm -f /etc/xdg/autostart/org.gnome.SettingsDaemon.ScreensaverProxy.desktop" 
"rm -f /etc/xdg/autostart/org.gnome.SettingsDaemon.Sharing.desktop" 
"rm -f /etc/xdg/autostart/org.gnome.SettingsDaemon.Smartcard.desktop" 
"rm -f /etc/xdg/autostart/org.gnome.SettingsDaemon.Sound.desktop" 
"rm -f /etc/xdg/autostart/org.gnome.SettingsDaemon.UsbProtection.desktop" 
"rm -f /etc/xdg/autostart/org.gnome.SettingsDaemon.Wacom.desktop" 
"rm -f /etc/xdg/autostart/org.gnome.SettingsDaemon.Wwan.desktop" 
"rm -f /etc/xdg/autostart/org.gnome.SettingsDaemon.XSettings.desktop" 
"rm -f /etc/xdg/autostart/pulseaudio.desktop" 
"rm -f /etc/xdg/autostart/xfce4-power-manager.desktop" 
"rm -f /etc/xdg/autostart/xfce4-screensaver.desktop" 
"rm -f /etc/xdg/autostart/xfce-polkit.desktop" 
"rm -f /etc/xdg/autostart/xscreensaver.desktop"
)

f_Exec_Eval