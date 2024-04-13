
[Emby](https://www.duckdns.org/)
		
----
# Shell Win
```bash							
	   docker run -it -d \
	   --name buttflix \
	   --network rede_local \
	   --ip 255.255.255.3 \
	   -p 8000:8096 \
	   -p 8001:8920 \
	   -v E:/Docker/EmbyButtflix/config:/config \
	   -v E:/:/mnt/share1 \
	   -v C:/:/mnt/share2 \
	   --restart unless-stopped \
	   emby/embyserver	
```
# Shell				
```bash	
	   docker run -it -d \
	   --name buttflix \
	   --network rede_local \
	   --ip 255.255.255.3 \
	   -p 8000:8096 \
	   -p 8001:8920 \
	   -v /home/butt/Docker/emby/config:/config \
	   -v /media/butt/Downloads:/mnt/share1 \
	   -v /media/butt/Arquivos:/mnt/share2 \
	   --restart unless-stopped \
	   emby/embyserver						
```							
# YAML							
```bash							
	version: “2”						
	#services: 						
	  emby:						
	    image: emby/embyserver:latest						
	    container_name: buttflix						
	    environment:						
	      - PUID=1000						
	      - PGID=1000						
	      - TZ=America/Sao_paulo						
	    volumes:						
	      - /home/butt/Docker/emby/config:/config						
	      - /media/butt/Downloads:/mnt/share1						
	      - /media/butt:/mnt/share2						
	    ports:						
	      - 8000:8096						
	      - 8001:8920						
	    restart: unless-stopped						
```							
[Note]
A senha Admin/adminadmin do qBittorrent funciona se a linha abaixo estiver no arquivo 'qBittorrent.conf'.		
```bash	
WebUI\Password_PBKDF2="@ByteArray(ARQ77eY1NUZaQsuDHbIMCA==:0WMRkYTUWVT9wVvdDtHAjU9b3b7uB8NR1Gur2hmQCvCDpm39Q+PsJRJPaCU51dEiz+dTzh8qbPsL8WkFljQYFQ==)"
						
```