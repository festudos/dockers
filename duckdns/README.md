----					
[!	[DuckDns]	(https://www.duckdns.org/)			]
----					
```bash					
	docker run -d --name duckdns -e PUID=1000 -e PGID=100 -e TZ=America/Sao_Paulo -e SUBDOMAINS=fgm -e TOKEN=a24ba2c9-aa4d-4c00-b4de-db3baa414f94 -e LOG_FILE=false --restart unless-stopped linuxserver/duckdns				
```					
----					
```bash					
	Docker-Compose	version: "2.1"			
		services:	portainer/portainer		
		  duckdns:			
		    image: ghcr.io/linuxserver/duckdns			
		    container_name: duckdns			
		    environment:			
		      - PUID=1000			
		      - PGID=100			
		      - TZ=America/Sao_Paulo			
		      - SUBDOMAINS=fgm			
		      - TOKEN=a24ba2c9-aa4d-4c00-b4de-db3baa414f94			
		      - LOG_FILE=false			
		    volumes:	Remover		
		      - E:/Docker/DuckDns/config:/config	Remover		
		    restart: unless-stopped			
```					
----					
```bash					
					
```					
----					
