FROM kasmweb/core-ubuntu-jammy:develop
USER root

### Envrionment config
ENV HOME=/home/kasm-default-profile \
    SCRIPT_DIR=/dockerstartup/install 

WORKDIR /dockerstartup

######### Customize Container Here ###########

# Install Google Chrome
COPY ./z_Install_WSpaces_Img /dockerstartup/install
RUN bash $SCRIPT_DIR/chrome/install_chrome.sh

# Update the desktop environment to be optimized for a single application
RUN cp $HOME/.config/xfce4/xfconf/single-application-xfce-perchannel-xml/* $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/ ; \
    cp /usr/share/extra/backgrounds/bg_kasm.png /usr/share/extra/backgrounds/bg_default.png
RUN apt-get remove -y xfce4-panel

# Setup the custom startup script that will be invoked when the container starts
#ENV LAUNCH_URL  http://kasmweb.com

RUN chmod +x $SCRIPT_DIR/chrome/custom_startup.sh

# Install Custom Certificate Authority
# COPY ./src/ubuntu/install/certificates $INST_SCRIPTS/certificates/
# RUN bash $INST_SCRIPTS/certificates/install_ca_cert.sh && rm -rf $INST_SCRIPTS/certificates/

ENV KASM_RESTRICTED_FILE_CHOOSER=1
RUN bash $SCRIPT_DIR/gtk/install_restricted_file_chooser.sh

######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

# Configure
ENV \ 
    NEW_USER=chrome \
    OLD_USER=kasm-user \
    HOME=/home/$NEW_USER
COPY ./configure.sh $SCRIPT_DIR/configure.sh
RUN bash $SCRIPT_DIR/configure.sh ; \
    sleep 5

# Userspace Runtime
WORKDIR $HOME
USER 1000
