ARG USER_NAME="sentinel"
ARG BASE_FILES="~/Docker/ubuntu/uS1/cp_files"
ARG BASE_SCR="~/Docker/ubuntu/uS1/src"
ARG TOKEN_S1='eyJ1cmwiOiAiaHR0cHM6Ly91c2VhMS0zMDAtbmZyLnNlbnRpbmVsb25lLm5ldCIsICJzaXRlX2tleSI6ICJnXzc4OThhNDkxYTM4MTdhN2QifQ=='

#LABEL maintainer "0"

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
    INST_SCRIPTS="/install_initial.sh \
                  /tools/install_tools_deluxe.sh \
                  /misc/install_tools.sh \
                  /chrome/install_chrome.sh \
                  /cleanup/cleanup.sh"

ARG BASE_FOLDER="./cp_files"
# Copy install scripts
COPY ./COPY $INST_DIR

# Run installations
RUN \
  for SCRIPT in $INST_SCRIPTS; do \
    bash ${INST_DIR}${SCRIPT}; \
  done && \
  $STARTUPDIR/set_user_permission.sh $HOME && \
  rm -f /etc/X11/xinit/Xclients && \
  chown 1000:0 $HOME && \
  mkdir -p /home/kasm-user && \
  chown -R 1000:0 /home/kasm-user && \
  rm -Rf ${INST_DIR}

# Userspace Runtime
ENV HOME /home/$USER_NAME
WORKDIR $HOME
USER 1000
RUN dpgk -i Sentinel* && \
  /opt/sentinelone/bin/sentinelctl management token set $TOKEN_S1

CMD ["--tail-log"]
