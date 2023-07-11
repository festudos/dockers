




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
    INST_SCRIPTS="$INST_DIR/install_initial.sh \
                  $INST_DIR/tools/install_tools_deluxe.sh \
                  $INST_DIR/chrome/install_chrome.sh \
                  $INST_DIR/cleanup/cleanup.sh \
                  $INST_DIR/install_end.sh"

# Copy install scripts
COPY ./COPY/ $INST_DIR
COPY ./COPY/group /etc/group
# Run installations
RUN \
  for SCRIPT in $INST_SCRIPTS; do \
    bash ${INST_DIR}${SCRIPT}; \
  done && \
  $STARTUPDIR/set_user_permission.sh $HOME && \ 
  chown 1000:1000 $HOME && \
  mkdir -p /home/kasm-user && \
  chown -R 1000:1000 /home/kasm-user 
  #rm -Rf ${INST_DIR}
  # rm -f /etc/X11/xinit/Xclients && \
  
# Userspace Runtime
ENV HOME /home/kasm-user
WORKDIR $HOME
USER 1000

CMD ["--tail-log"]
