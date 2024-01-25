
[NginxProxy](https://nginxproxymanager.com/setup/)
		
----
# Community Edition			
```bash	
Email:    admin@example.com
Password: changeme
```

# Shell				
```bash	
    sudo docker run -i -t -d -p 80:80 -p 81:81 -p 443:443 \
        -v /home/pci/Docker/nginx-proxy-manager/data:/data  \
        -v /home/pci/Docker/nginx-proxy-manager/letsencrypt:/etc/letsencrypt \
        jc21/nginx-proxy-manager:latest
```							
# YAML							
```bash							
version: '3.8'
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    environment:
      PUID: 1000
      PGID: 1000
    ports:
      - '80:80'
      - '81:81'
      - '443:443'
    volumes:
      - /home/pci/Docker/nginx-proxy-manager/data:/data
      - /home/pci/Docker/nginx-proxy-manager/letsencrypt:/etc/letsencrypt

				
```							
						
