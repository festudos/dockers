
[Selenoid](https://aerokube.com/selenoid/latest/)
		
----
Download 'cm_linux_amd64' [github-cm](https://github.com/aerokube/cm/releases)

# Shell				
```bash	
    sudo cp cm_linux_amd64 /usr/local/sbin/Selenoid
	  alias selenoid='Selenoid selenoid'
    echo ' Verificar: Configurações adicionais'
    selenoid start --vnc --browsers-json /home/pci/Docker/selenoid/config/selenoid/browsers.json
    Selenoid selenoid-ui start
    sudo docker pull selenoid/chrome:latest
    sudo docker pull selenoid/firefox:latest
```							
# YAML	
Use docker-compose ou Download 'selenoid_linux_amd64' [github-selenoid](https://github.com/aerokube/selenoid/releases/)

[Selenoid-docker-compose](https://github.com/aerokube/selenoid/blob/master/docs/docker-compose.adoc)		
```bash							
version: '3.8'
services:
  selenoid:
    image: aerokube/selenoid:latest-release
    volumes:
      - /home/pci/Docker/selenoid/config/selenoid:/etc/selenoid
      - /home/pci/Docker/selenoid/config/video:/opt/selenoid/video
      - /home/pci/Docker/selenoid/config/logs:/opt/selenoid/logs
      - /var/run/docker.sock:/var/run/docker.sock
    environment:
      - OVERRIDE_VIDEO_OUTPUT_DIR=/path/to/config/video
    command: [ "-conf", "/etc/selenoid/browsers.json", "-video-output-dir", "/opt/selenoid/video", "-log-output-dir", "/opt/selenoid/logs", "-container-network", "selenoid"]
    expose:
      - "4444"
    restart: unless-stopped
    networks:
      - selenoid

networks:
  selenoid:
    name: selenoid # This assumes network is already created
    attachable: true    
		
```
```json		
- Configurações adicionais:
 /home/pci/Docker/selenoid/config/selenoid/browsers.json
 /etc/selenoid/browsers.json
  {
    "chrome": {
      "default": "latest",
      "versions": {
        "latest": {
          "image": "selenoid/chrome:latest",
          "port": "4444"
        }
      }
    }
    "firefox": {
      "default": "latest",
      "versions": {
        "latest": {
          "image": "selenoid/firefox:latest",
          "port": "4444"
        }
      }
    }
  }
```