
[NginxProxy](https://nginxproxymanager.com/setup/)
		
----
# Community Edition			
```bash	

```

# Shell				
```bash	
    sudo docker run -d \
      --name nginx-proxy_new \
      --publish 80:80 \
      --volume /var/run/docker.sock:/tmp/docker.sock:ro \
      nginxproxy/nginx-proxy:1.4
```							
# YAML							
```bash							
version: "3"
services: 
  nginx-proxy_new:
    image: nginxproxy/nginx-proxy:1.4
    container_name: nginx-proxy_new
    volumes:
      - /var/run/docker.sock:/tmp/docker.sock:ro
    ports:
      - 80:80
    restart: unless-stopped
				
```							
						
