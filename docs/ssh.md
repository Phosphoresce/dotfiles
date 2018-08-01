SSH Tips and Tricks
-------------------

**Don't type username:**  
`echo "Host \*\n\tUser radio" >> ~/.ssh/config`  

**Generate RSA key**  
`ssh-keygen`  

Note: if you choose a filename other than id_rsa you will need to manually add that key to your ssh-agent or add the key to the ssh config. id_rsa will only be automatically added if it is located in `~/.ssh`.  
```
vim ~/.ssh/config
...
Host *
    IdentityFile ~/.ssh/another_identity_file
```

**Key setup**
copy key.pem.pub to server you would like to ssh to  
contents of key.pem.pub go in ~/.ssh/authorized_keys  
`chmod 400 ~/.ssh/authorized_keys`  

**Reverse ssh tunnel**  
This works if you need a tunnel to the remote network but cannot connect to it from the outside.  

Initiate the connection from the inside of the remote network to home.  
From remote:  
`ssh -R 2222:localhost:22 home.domain.com`  

Then connect to the other side of the shell from home.  
From home:  
`ssh -p 2222 localhost`  

**Regular ssh tunnel**  
This is useful for accessing servers in a private subnet. For example allowing the use of RDP from your local machine because a jumpbox doesn't have RDP.

Create the tunnel:
`ssh -L 3389:eventual_target:3389 jumpbox_ip`

From your starting machine connect to localhost and the tunnel will forward that connection to the eventual target.  

**Troubleshooting**  
Make sure the public key and private key are correctly copied over to your target server.  
Did you run `chmod 400 ~/.ssh/authorized_keys`?  
Is the `~/.ssh directory` open to the world? Try running `chmod 600 ~/.ssh`.  
