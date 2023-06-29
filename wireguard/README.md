
[Wireguard](https://www.duckdns.org/)
		
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
  wireguard:		
    image: ghcr.io/linuxserver/wireguard		
    container_name: wireguard.1.0		
    cap_add:		
      - NET_ADMIN		
      - SYS_MODULE		
    environment:		
      - PUID=1000		
      - PGID=100		
      - TZ=America/Sao_Paulo		
      - SERVERURL=fgm.duckdns.org #optional		
      - SERVERPORT=51820 #optional		
      - PEERS=cel #optional		
      - PEERS=note #optional		
      - PEERDNS=auto #optional		
      - INTERNAL_SUBNET=10.13.13.0 #optional		
      - ALLOWEDIPS=0.0.0.0/0 #optional		
    volumes:		
      - C:\ProgramData\Docker\wireguard.3\config:/config		
      - C:\ProgramData\Docker\wireguard.3\modules:/lib/modules		
    ports:		
      - 51820:51820/udp		
    restart: unless-stopped				
```							
			