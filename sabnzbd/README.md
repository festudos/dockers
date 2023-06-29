
[SabnzBD](https://www.duckdns.org/)
		
----

# Shell				
```bash	
	   docker run -it -d \
	   --name 					
```							
# YAML							
```bash							
version: "2.1"
services:
  sabnzbd:
    image: lscr.io/linuxserver/sabnzbd
    container_name: sabnzbd
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=America/Sao_paulo
    volumes:
      - /home/butt/Docker/sabnzbd/config:/config
      - /home/butt/Docker/sabnzbd/downloads:/downloads #optional
      - /home/butt/Docker/sabnzbd/incomplete/downloads:/incomplete-downloads #optional
    ports:
      - 6001:8080
    restart: unless-stopped				
```							
						
