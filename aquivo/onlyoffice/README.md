
[OnlyOffice](https://hub.docker.com/r/onlyoffice/documentserver/)
		
----
# Community Edition			
```bash	
wget http://download.onlyoffice.com/install/opensource-install.sh
```

# Shell				
```bash	
	  sudo docker run -i -t -d -p 80:80 onlyoffice/documentserver \
	  --name onlyoffice \
    -v /app/onlyoffice/DocumentServer/logs:/var/log/onlyoffice  \
    -v /app/onlyoffice/DocumentServer/data:/var/www/onlyoffice/Data  onlyoffice/documentserver
```							
# YAML							
```bash							
version: "2.1"				
```							
						
