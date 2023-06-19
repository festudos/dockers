----					
[Portainer](	https://docs.portainer.io/start/install-ce/server/docker/wcs		)]
[Portainer](	https://classic.yarnpkg.com/en/docs/install#mac-stable			)
[Portainer](	https://documentation.portainer.io/contributing/tools-linux/			)
----					
```bash					
	sudo docker network create dns-net && \				
	sudo docker run -d -p 9002:8000 -p 9000:9000 --name portainer --network dns-net --restart always -v /var/run/docker.sock:/var/run/docker.sock -v /media/butt/Arquivos/Docker/portainer-ce:/data portainer/portainer-ce				
```					
----					
```bash					
	Windows	docker volume create portainer_data	0		
	Docker CLI	docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce	docker run -d --nameportainer -p8000:8000 -p9000:9000 --restartalways -v/var/run/docker.sock:/var/run/docker.sock -vportainer_data:/data portainer/portainer-ce		
	docker run	 -d	docker run -d		
	 --name	portainer	#NOME?		
	 -p	8000:8000	-p8000:8000		
	 -p	9000:9000	-p9000:9000		
	 --restart	always	#NOME?		
	 -v	/var/run/docker.sock:/var/run/docker.sock	-v /var/run/docker.sock:/var/run/docker.sock		
	 -v	portainer_data:/data	-v portainer_data:/data		
	 	portainer/portainer-ce	portainer/portainer-ce		
```					
