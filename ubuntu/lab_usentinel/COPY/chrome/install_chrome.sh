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
function f_Cria_Arquivos() { 
cat >/usr/bin/google-chrome <<EOL
#!/usr/bin/env bash
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' ~/.config/google-chrome/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"None"/' ~/.config/google-chrome/Default/Preferences
if [ -f /opt/VirtualGL/bin/vglrun ] && [ ! -z "\${KASM_EGL_CARD}" ] && [ ! -z "\${KASM_RENDERD}" ] && [ -O "\${KASM_RENDERD}" ] && [ -O "\${KASM_EGL_CARD}" ] ; then
    echo "Starting Chrome with GPU Acceleration on EGL device \${KASM_EGL_CARD}"
    vglrun -d "\${KASM_EGL_CARD}" /opt/google/chrome/google-chrome ${CHROME_ARGS} "\$@" 
else
    echo "Starting Chrome"
    /opt/google/chrome/google-chrome ${CHROME_ARGS} "\$@"
fi
EOL
}

CHROME_ARGS="--password-store=basic --no-sandbox --ignore-gpu-blocklist --user-data-dir --no-first-run --simulate-outdated-no-au='Tue, 31 Dec 2099 23:59:59 GMT'"
CHROME_VERSION=$1

ARCH=$(arch | sed 's/aarch64/arm64/g' | sed 's/x86_64/amd64/g')
if [ "$ARCH" == "arm64" ] ; then
  echo "Chrome not supported on arm64, skipping Chrome installation"
  exit 0
fi	

  if [ ! -z "${CHROME_VERSION}" ]; then
    COMMANDOS_01="wget -q https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${CHROME_VERSION}_amd64.deb -O chrome.deb"
  else
    COMMANDOS_01="wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O chrome.deb"
  fi
    
    COMMANDOS_ARRAY=(
    "echo 'Chrome Install'" 
    "$COMMANDOS_01" 
    "apt-get install -y ./chrome.deb"
    "rm chrome.deb"
    "chmod 777 /usr/share/applications/google-chrome.desktop"
    "chown $KASM_USER:$KASM_USER /usr/share/applications/google-chrome.desktop"
    "cp /usr/share/applications/google-chrome.desktop $KASM_HOME/Desktop/google-chrome.desktop"
    "chmod +x /usr/bin/google-chrome"
    "mkdir -p /etc/opt/chrome/policies/managed/"    
    "chown -R $KASM_USER:$KASM_USER $KASM_HOME"
    )

  f_Cria_Arquivos
  f_Exec_Eval

sed -i 's@exec -a "$0" "$HERE/google-chrome" "$\@"@@g' /usr/bin/x-www-browser  
cat >>/usr/bin/x-www-browser <<EOL
exec -a "\$0" "\$HERE/chrome" "${CHROME_ARGS}"  "\$@"
EOL

cat >>/etc/opt/chrome/policies/managed/default_managed_policy.json <<EOL
{"CommandLineFlagSecurityWarningsEnabled": false, "DefaultBrowserSettingEnabled": false}
EOL
