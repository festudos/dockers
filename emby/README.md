----							
[!	[DuckDns]	(https://www.duckdns.org/)			]		
----							
```bash							
	   → docker run -it -d --name buttflix --network rede_local --ip 255.255.255.3 -p 8000:8096 -p 8001:8920 -v E:/Docker/EmbyButtflix/config:/config -v E:/:/mnt/share1 -v C:/:/mnt/share2 emby/embyserver						
	   → docker run -it -d --name buttflix --network rede_interna --ip 200.200.201.2 -p 8000:8096 -p 8001:8920 -v /home/butt/Docker/emby/config:/config -v /media/butt/Downloads:/mnt/share1 -v /media/butt/Arquivos:/mnt/share2 emby/embyserver						
	   → docker run -it -d --name buttflix --network rede_local --ip 255.255.255.3 -p 8000:8096 -p 8001:8920 -v E:/Docker/EmbyButtflix/confg:/config -v E:/:/mnt/share1 -v D:/:/mnt/share2 emby/embyserver						
	   → docker run -it -d --name buttflix -p 8000:8096 -p 8001:8920 -v I:\Fabricio\DataButtFlix\config\:/config -v I:\Fabricio\DataButtFlix\:/mnt/share1 -v C:/:/mnt/share2 emby/embyserver						
```							
----							
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
----							
** - Configurações adicionais**							
→ `	→ Remove avso premer .btnHeaderPremiere { display: none ! important; } 						
