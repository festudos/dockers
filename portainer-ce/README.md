

[Portainer](	https://docs.portainer.io/start/install-ce/server/docker/wcs		)
[Portainer](	https://classic.yarnpkg.com/en/docs/install#mac-stable			)
[Portainer](	https://documentation.portainer.io/contributing/tools-linux/			)
----
# Shell					
```bash					
sudo docker network create dns-net && \				
sudo docker run -d \
	-p 9002:8000 -p 9000:9000 \
	--name portainer \
	--network dns-net \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v /home/butt/Docker/portainer-ce/conf:/data \
	--restart always \
	portainer/portainer-ce				
```		
# Shell					
```bash					
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart always -v \\.\pipe\docker_engine:\\.\pipe\docker_engine -v portainer_data:C:\data portainer/portainer-ce:latest
```			
# YAML					
```YAML			
version: '3'
services:
  portainer:
    image: portainer/portainer-ce
    container_name: portainer
    labels:
    - traefik.http.routers.portainer.rule=Host(`portainer.localhost`)
    - traefik.http.services.portainer.loadbalancer.server.port=9000
    - traefik.http.routers.portainer.tls=true
    #- traefik.http.routers.portainer.entrypoints=entryhttps
    #- traefik.http.routers.portainer.certresolver=certresolver# em traefik.yml
    environment:
    - PUID=1000
    - PGID=1000
    - TZ=America/Sao_paulo
    volumes:
    - /var/run/docker.sock:/var/run/docker.sock
    - /home/butt/Docker/portainer-ce/conf:/data
    ports:
    - 9000:9000
    restart: always
networks:
  default:
    external:
      name: dns-net	
```					
# Password Change					
```bash	
run --rm -v /home/docker/portainer-ce/conf:/data portainer/helper-reset-password
```					