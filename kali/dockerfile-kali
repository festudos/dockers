FROM	kalilinux/kali-rolling
MAINTAINER	Butt
VOLUME	/srv/dev-disk-by-uuid-7cc4e1b2-ca6d-4ae2-b64f-35cf2474c909/Kali/root:/root 	VOLUME/srv/dev-disk-by-uuid-7cc4e1b2-ca6d-4ae2-b64f-35cf2474c909/Kali/root:/root
VOLUME	/srv/dev-disk-by-uuid-7cc4e1b2-ca6d-4ae2-b64f-35cf2474c909/Kali/home:/home 	VOLUME/srv/dev-disk-by-uuid-7cc4e1b2-ca6d-4ae2-b64f-35cf2474c909/Kali/home:/home
EXPOSE	22000:22
ENTRYPOINT	["/bin/bash"]	#Ponto de entrada, padrao /bin/bash
# Install UP	 	# Install UP
RUN	apt-get update -y && apt-get upgrade -y
# Install Kali Full	 	# Install Kali Full
RUN	apt-get install -y apt-utils kali-linux-large && apt-get install --fix-missing
# Install UP	 	# Install UP
RUN	apt-get update -y && apt-get upgrade -y
# Install Tools	 	# Install Tools
#RUN	apt-get install kali-linux-foresic -y && apt-get install kali-linux-top10 -y
#RUN	apt-get install kali-linux-pwtools -y && apt-get install kali-linux-web -y
#RUN	apt-get install kali-linux-wireles -y
# Install UP	 	# Install UP
RUN	apt-get update -y && apt-get upgrade -y
CMD	["/bin/bash"]
