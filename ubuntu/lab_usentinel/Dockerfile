
ARG BASE_TAG="develop"
ARG BASE_IMAGE="core-ubuntu-jammy"
FROM kasmweb/$BASE_IMAGE:$BASE_TAG

USER root
### Envrionment config
ENV \
  HOME /home/kasm-default-profile \
  U_HOME /home/kasm-user \
  STARTUPDIR /dockerstartup \
  VAR_DE_TESTE /home/de/cu/e/rola \
  X_CLIENTES /etc/X11/xinit/Xclients

ENV DEBIAN_FRONTEND=noninteractive \
    SKIP_CLEAN=true \
    KASM_RX_HOME=$STARTUPDIR/kasmrx \
    DONT_PROMPT_WSL_INSTALL="No_Prompt_please" \
    INST_DIR=$STARTUPDIR/install \
    INST_SCRIPTS="/tools/install_initial.sh \
                  /tools/install_tools_deluxe.sh \
                  /chrome/install_chrome.sh \
                  /cleanup/cleanup.sh \
                  /tools/install_end.sh \
                  /tools/configure.sh" 
WORKDIR $HOME

# Copy install scripts
COPY ./COPY $INST_DIR
COPY ./COPY/install_s1.sh ${U_HOME}/Desktop/install_s1.sh
RUN chmod 777 ${U_HOME}/Desktop/install_s1.sh
COPY ./COPY/install_s1.sh ${U_HOME}/Desktop/SentinelAgent_linux_v23_1_2_9.deb

RUN usermod -a kasm-user -G sudo
RUN passwd -d kasm-user

# Run installations
RUN \
  for SCRIPT in $INST_SCRIPTS; do \
    bash ${INST_DIR}${SCRIPT}; \
  done
RUN rm -dr ${STARTUPDIR}
# Userspace Runtime
WORKDIR $U_HOME
USER 1000
CMD ["--tail-log"]
