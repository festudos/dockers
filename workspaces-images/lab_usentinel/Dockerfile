
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
                  /tools/configure.sh \
                  /chrome/install_chrome.sh \
                  /cleanup/cleanup.sh \
                  /tools/install_end.sh \
                  /install_s1.sh" 
WORKDIR /dockerstartup
COPY ./COPY /dockerstartup/install
RUN echo 'sentinel_v23.1.2.9' | tee /etc/hostname
# Run installations
RUN bash ${SCRIPT_DIR}/tools/install_initial.sh ; \
 bash ${SCRIPT_DIR}/tools/configure.sh ; \
 bash ${SCRIPT_DIR}/chrome/install_chrome.sh ; \
 bash ${SCRIPT_DIR}/cleanup/cleanup.sh ; \
 bash ${SCRIPT_DIR}/tools/install_end.sh ; \
 bash ${SCRIPT_DIR}/install_s1.sh ; \
 sleep 5 ;\
 usermod -l sentinel_v23.1.2.9 kasm-user ; \
 rm -rd /dockerstartup/install ; \
 sleep 5
#RUN \
#  for SCRIPT in $SCRIPT_LIST; do \
#    bash ${SCRIPT_DIR}${SCRIPT}; \
#  done
# Troca o nome do User
#RUN usermod -l sentinel_v23.1.2.9 kasm-user
#RUN rm -rd /dockerstartup/install

# Userspace Runtime
ENV HOME=/home/kasm-user
WORKDIR $HOME
USER 1000
CMD ["--tail-log"]
