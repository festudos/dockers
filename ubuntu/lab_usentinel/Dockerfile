




ARG BASE_TAG="develop"
ARG BASE_IMAGE="core-ubuntu-jammy"
FROM kasmweb/$BASE_IMAGE:$BASE_TAG

USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
WORKDIR $HOME

### Envrionment config
ENV DEBIAN_FRONTEND=noninteractive \
    SKIP_CLEAN=true \
    KASM_RX_HOME=$STARTUPDIR/kasmrx \
    DONT_PROMPT_WSL_INSTALL="No_Prompt_please" \
    INST_DIR=$STARTUPDIR/install \
    INST_SCRIPTS="/tools/install_initial.sh \
                  /tools/install_tools_deluxe.sh \
                  /chrome/install_chrome.sh \
                  /cleanup/cleanup.sh \
                  /tools/install_end.sh"

# Copy install scripts
COPY ./COPY $INST_DIR
# COPY ./COPY/group /etc/group
RUN usermod -a kasm-user -G sudo
RUN passwd -d kasm-user
COPY ./COPY/conf_copy_.zshrc ~/.zshrc
# Run installations
RUN \
  for SCRIPT in $INST_SCRIPTS; do \
    bash ${INST_DIR}${SCRIPT}; \
  done
RUN \ 
  chown 1000:1000 $HOME && \
  mkdir -p /home/kasm-user && \
  chown -R 1000:1000 /home/kasm-user 
  #rm -f /etc/X11/xinit/Xclients 
 # rm -Rf ${INST_DIR} 

# Userspace Runtime
ENV HOME /home/kasm-user
WORKDIR $HOME
USER 1000

CMD ["--tail-log"]
