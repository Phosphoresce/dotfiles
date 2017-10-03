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

connect to adfs:  
/etc/nsswitch.conf
`hosts: dns [!UNAVAIL=return] files`

/etc/resolv.conf
```
nameserver 127.0.0.53 # try if using stub resolver
nameserver ip.of.dns.server # also try ip of ad connected dns server, may not get automatically set if using openvpn
```

Make sure dnsmasq or other dns servers are not running on local machine.
