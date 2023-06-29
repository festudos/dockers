				
[Cloudflare](	https://dash.cloudflare.com/		)

----

# Shell					
```bash					
curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && \
sudo dpkg -i cloudflared.deb && \
sudo cloudflared service install <TOKEN>			
```	

# Docker					
```bash					
docker run cloudflare/cloudflared:latest tunnel --no-autoupdate run --token <TOKEN>			
```					
# YAML					
```YAML			
version: '3'
services:
# conect uServer - join portainer-ce
  tunnel-bridge:
    image: cloudflare/cloudflared:latest
    container_name: tunnel_net_bridge
    command: tunnel --no-autoupdate run --token <TOKEN>
    restart: always
networks:
  default:
    external:
      name: dns-net	
```					
