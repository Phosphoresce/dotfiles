Docker
======

This readme describes my own best practices for docker and systemd usage on Coreos.  

Start with a `docker` directory in `home` and follow the guidelines below.  

Each docker container must be placed into their only directory.  

**Dockerfiles:**  
Each docker container needs a `Dockerfile` if only to document the intended run command of for the container.  

**Systemd Units:**  
Each docker container must have a systemd service or unit file.  
As an example for a service called 'registry' which is a docker image registry:  
Filename: registry.service  
```
[Unit]
Description=Registry
After=docker.service
Requires=docker.service

[Service]
TimeoutStartSec=0
ExecStartPre=-/usr/bin/docker kill registry
ExecStartPre=-/usr/bin/docker rm registry
ExecStartPre=/usr/bin/docker pull registry:latest
ExecStart=/usr/bin/docker run -d -p 5000:5000 --restart=always --name registry -v /home/core/docker/registry/data:/var/lib/registry registry:latest

[Install]
WantedBy=multi-user.target
```

To enable the service:  
```
sudo cp registry.service /etc/systemd/system/
sudo systemctl enable /etc/systemd/system/registry.service
sudo systemctl start registry.service
```

To view logs from the service:  
`sudo journalctl -fu registry.service`

If you make changes later:  
`sudo systemctl daemon-reload`
