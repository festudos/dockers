
[qBitTorrent](https://www.duckdns.org/)
		
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
  qbittorrent:
    image: lscr.io/linuxserver/qbittorrent:latest
    container_name: qbittorrent
    labels:
      - traefik.http.routers.qbittorrent.rule=Host(`torrent.server`)
      - traefik.http.services.qbittorrent.loadbalancer.server.port=7001
      - traefik.port=80
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=America/Sao_paulo
      - WEBUI_PORT=7001
    volumes:
      - /home/butt/Docker/qBittorrent/config:/config
      - /media/butt/Downloads/ButtFlix/downloads:/downloads
    ports:
      - 7002:6881
      - 7003:6881/udp
      - 7001:7001
    restart: unless-stopped				
```							
						