
ARG BASE_TAG="develop"
ARG BASE_IMAGE="core-ubuntu-jammy"
FROM kasmweb/$BASE_IMAGE:$BASE_TAG

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
    SCRIPT_LIST="/tools/install_initial.sh \
                  /chrome/install_chrome.sh \
                  /cleanup/cleanup.sh \
                  /tools/install_end.sh \
                  /tools/configure.sh \
                  /install_s1.sh" 
WORKDIR /dockerstartup
COPY ./COPY /dockerstartup/install

# Run installations
RUN \
  for SCRIPT in $SCRIPT_LIST; do \
    bash ${SCRIPT_DIR}${SCRIPT}; \
  done
# Troca o nome do User
RUN usermod -l sentinel_v23.1.2.9 kasm-user

# Userspace Runtime
ENV HOME=/home/kasm-user
WORKDIR $HOME
USER 1000
CMD ["--tail-log"]
