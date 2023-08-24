FROM kasmweb/core-ubuntu-jammy:develop
USER root

### Envrionment config
ENV \
    STARTUPDIR=/dockerstartup \
    HOME=/home/kasm-default-profile \
    WORK_PLACE=/dockerstartup \
    SCRIPT_DIR=/dockerstartup/install \
    KASM_RX_HOME=/dockerstartup/kasmrx \
    KASM_USER=kasm-user \
    KASM_HOME=/home/kasm-user \
    SKIP_CLEAN=true \
    DEBIAN_FRONTEND=noninteractive \
    DONT_PROMPT_WSL_INSTALL=No_Prompt_please \
    SENTINEL_V=sentinel_v23.2.2.4
WORKDIR /dockerstartup
COPY ./z_Install_WSpaces_Img ${SCRIPT_DIR}
RUN echo "$SENTINEL_V" | tee /etc/hostname

# Run installations
RUN bash ${SCRIPT_DIR}/tools_my/install_initial.sh ; \
 bash ${SCRIPT_DIR}/tools_my/configure.sh ; \
 bash ${SCRIPT_DIR}/chrome/install_chrome.sh ; \
 bash ${SCRIPT_DIR}/cleanup/cleanup.sh ; \
 bash ${SCRIPT_DIR}/tools_my/install_end.sh ; \
 bash ${SCRIPT_DIR}/tools_my/install_s1.sh ; \
 rm -rd /dockerstartup/install ; \
 sleep 5
ENV \ 
    NEW_USER=sentinel \
    OLD_USER=kasm-user
# troca de User
RUN usermod -l ${NEW_USER} ${OLD_USER} ; \
 groupmod -n ${NEW_USER} ${OLD_USER} ; \
 mv /home/${OLD_USER} /home/${NEW_USER} ; \
 usermod -d /home/${NEW_USER} -m ${NEW_USER} ; \
 chown -R ${NEW_USER}:${NEW_USER} /home/${NEW_USER} ; \
 rm -rd /home/kasm* ${STARTUPDIR} ; \
 sleep 5

# Userspace Runtime
ENV HOME=/home/${NEW_USER}
WORKDIR $HOME
USER 1000
CMD ["--tail-log"]
