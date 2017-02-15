DNS Tips and Tricks
-------------------

Don't type FQDN for things:  
vim /etc/resolv.conf
```
DOMAIN domain.com
SEARCH domain.suffix.1 domain.suffix.2
```
stop dhcp from changing dns:  
chattr +i /etc/resolv.conf  

to edit:  
chattr -i /etc/resolv.conf  
