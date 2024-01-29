
[Jackett](https://www.duckdns.org/)
		
----

# Shell				
```bash	
	   docker run -it -d \
	   --name 					
```							
# YAML							
```yaml						
version: "2.1"
services:
   jackett:
    image: lscr.io/linuxserver/jackett
    container_name: jackett
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=America/Sao_paulo
      - AUTO_UPDATE=true #optional
      - RUN_OPTS=<run options here> #optional
    volumes:
      - /home/butt/Docker/jackett/config:/config
      - /home/butt/Docker/jackett/downloads:/downloads
    ports:
      - 9117:9117
    restart: unless-stopped					
```							
						
