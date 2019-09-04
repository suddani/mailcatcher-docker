```
docker run -d -p 1080:1080 -p 1025:1025 --name mailcatcher suddani/mailcatcher
```

Then go to http://localhost:1080/mailcatcher/

# Configure
You can also change the ports and path via env variables. The following options are available:
* SMTP_IP=0.0.0.0
* SMTP_PORT=1025
* HTTP_IP=0.0.0.0
* HTTP_PORT=1080
* HTTP_PATH=/mailcatcher/

Example: 
```
docker run -d -p 1080:1080 -p 1025:1025 -e HTTP_PATH=/ --name mailcatcher suddani/mailcatcher
```
Then go to http://localhost:1080/
