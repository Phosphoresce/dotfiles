Docker
======

This readme describes my own best practices for docker and systemd usage on Coreos.  

Start with a `docker` directory in `home` and follow the guidelines below.  

Each docker container must be placed into their only directory.  

Dockerfiles:  
Each docker container needs a `Dockerfile` if only to document the intended run commond of for the container.  

Systemd Units:  
Each docker container must have a systemd service or unit file.  
As an example for a service called 'hello':  
Filename: hello.service  
```
[Unit]
Description=MyApp
After=docker.service
Requires=docker.service

[Service]
TimeoutStartSec=0
ExecStartPre=-/usr/bin/docker kill busybox1
ExecStartPre=-/usr/bin/docker rm busybox1
ExecStartPre=/usr/bin/docker pull busybox
ExecStart=/usr/bin/docker run --name busybox1 busybox /bin/sh -c "trap 'exit 0' INT TERM; while true; do echo Hello World; sleep 1; done"

[Install]
WantedBy=multi-user.target
```

To enable the service run:  
```
sudo cp hello.service /etc/systemd/system/
sudo systemctl enable /etc/systemd/system/hello.service
sudo systemctl start hello.service

```

To view logs from the service run:  
`journalctl -fu hello.service`
