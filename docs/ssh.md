SSH Tips and Tricks
-------------------

Don't type username:  
`echo "Host \*\n\tUser radio" >> ~/.ssh/config`  

Generate RSA key:  
`ssh-keygen`  

copy key.pem.pub to server you would like to ssh to  
contents of key.pem.pub go in ~/.ssh/authorized_keys  
`chmod 400 ~/.ssh/authorized_keys`  

Reverse ssh tunnel  
This works if you need a tunnel to the remote network but cannot connect to it from the outside.  

Initiate the connection from the inside of the remote network to home.  
From remote:  
`ssh -R 2222:localhost:22 home.domain.com`  

Then connect to the other side of the shell from home.  
From home:  
`ssh -p 2222 localhost`  
