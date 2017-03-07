SSH Tips and Tricks
-------------------

Don't type username:
`echo "Host \*\n\tUser radio" >> ~/.ssh/config`

Generate RSA key:
`ssh-keygen`

copy key.pem.pub to server you would like to ssh to
contents of key.pem.pub go in ~/.ssh/authorized_keys
`chmod 400 ~/.ssh/authorized_keys`

Reverse ssh shell tunnel
from target:
`ssh -R 2222:localhost:22 domain.com`

From source:
`ssh -p 2222 localhost`
