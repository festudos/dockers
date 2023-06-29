
[Radarr](https://www.duckdns.org/)
		
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
  radarr:
    image: lscr.io/linuxserver/radarr:latest
    container_name: radarr
    labels:
      - traefik.http.routers.radarr.rule=Host(`filmes.server`)
      - traefik.http.services.radarr.loadbalancer.server.port=7878
      - traefik.port=80
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=America/Sao_paulo
    volumes:
      - /home/butt/Docker/radarr/config:/config
      - /media/butt/Downloads/ButtFlix/movies:/movies #optional
      - /media/butt/Downloads/ButtFlix/downloads:/downloads #o mesmo do qBittorrent
    #ports:
      #- 5001:7878
    restart: unless-stopped					
```							
						
