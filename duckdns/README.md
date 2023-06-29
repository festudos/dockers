					
[DuckDns](https://www.duckdns.org/)

----
# Shell				
```bash					
	docker run -d \
	--name duckdns \
	-e PUID=1000 \
	-e PGID=1000 \
	-e TZ=America/Sao_Paulo \
	-e SUBDOMAINS=<DOMAIN> \
	-e TOKEN=<TOKEN> \
	-e LOG_FILE=false \
	--restart unless-stopped \
	linuxserver/duckdns				
```					
# YAML					
```YAML						
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
		    restart: unless-stopped			
```					
