
[Jackett](https://www.duckdns.org/)
		
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
  organizr:
    image: linuxserver/organizr
    container_name: organizr
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=America/Sao_paulo
    volumes:
      - /home/butt/Docker/organizr/config:/config
    ports:
      - 3001:80
    restart: unless-stopped					
```							
						