
[](https://www.duckdns.org/)
		
----

# Shell				
```bash	
	   docker run -it -d \
	   --name 					
```							
# YAML							
```bash							
version: "3"
services:
  sonarr:
    image: lscr.io/linuxserver/sonarr:latest
    container_name: sonarr
    labels:
      - traefik.http.routers.sonarr.rule=Host(`series.server`)
      - traefik.http.services.sonarr.loadbalancer.server.port=8989
      - traefik.port=80
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
    volumes:
      - /home/butt/Docker/sonarr/config:/config
      - /media/butt/Downloads/ButtFlix/tvseries:/tv #optional
      - /media/butt/Downloads/ButtFlix/downloads:/downloads #o mesmo do qBittorrent
    #ports:
      #- 4001:8989
    restart: unless-stopped				
```							
						
