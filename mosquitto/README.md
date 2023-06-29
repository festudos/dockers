
[Mosquitto](https://www.duckdns.org/)
		
----

# Shell				
```bash	
	   sudo docker run -it \
       --name mqtt \
       -p 1883:1883 \
       -p 9001:9001 \
       -v /media/butt/Docker/mosquitto/config/config:/mosquitto/config \
       -v /media/butt/Docker/mosquitto/config/data:/mosquitto/data \
       -v /media/butt/Docker/mosquitto/config/log:/mosquitto/log \
       eclipse-mosquitto \
       --restart always
#s					
```							
# YAML							
```bash							
version: '3.3'
services:
  mosquitto:
    container_name: my_mqtt
    image: eclipse-mosquitto
    volumes:
      - /media/butt/Docker/mosquitto/config/config:/mosquitto/config
      - /media/butt/Docker/mosquitto/config/data:/mosquitto/data
      - /media/butt/Docker/mosquitto/config/log:/mosquitto/log
    ports:
      - 1883:1883
      - 9001:9001
    restart: always					
```							
						
