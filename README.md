# SecureShell (SSH)
* secure communications with SSH
* network proxy configuration
## secure communications with SSH
```terminal
cd /etc/ssh/
```
show 
```terminal
ls
```
ssh config list
```output
moduli        sshd_config.d           ssh_host_ed25519_key.pub
ssh_config    ssh_host_ecdsa_key      ssh_host_rsa_key
ssh_config.d  ssh_host_ecdsa_key.pub  ssh_host_rsa_key.pub
sshd_config   ssh_host_ed25519_key
```
New a new folder
```terminal
mkdir default_clef
```
transfer all keys to the new folder.
```terminal
mv mv ssh_host_* default_clef/
```
reconfigure openssh
```terminal
dpkg-reconfigure openssh-server
```
check the default key
```terminal
md5sum *
```
output
```
md5sum: default_clef: est un dossier
2679899083c9df983a24200f235fec11  moduli
8a5bddc82befb71d8ef34cc903d3d077  ssh_config
md5sum: ssh_config.d: est un dossier
6dbdc3a27e1953d209f929df7aff0c57  sshd_config
md5sum: sshd_config.d: est un dossier
4dc94c9a21c0f876dbd5575481dcc9e4  ssh_host_ecdsa_key
85a7020cad3038196c15abfa82374dc7  ssh_host_ecdsa_key.pub
6c3941a562d02457cb10f1dad98ba090  ssh_host_ed25519_key
16d5525465999791cd5adc769de18483  ssh_host_ed25519_key.pub
57f0578ed484e979e61b27213b9726b3  ssh_host_rsa_key
f250fe82cc167b4c38ef39cc8b89fa2c  ssh_host_rsa_key.pub
```
open the folder
```terminal
cd default_clef/
```
launch md5sum later
```terminal
md5sum *
```
output
```
4dc94c9a21c0f876dbd5575481dcc9e4  ssh_host_ecdsa_key
85a7020cad3038196c15abfa82374dc7  ssh_host_ecdsa_key.pub
6c3941a562d02457cb10f1dad98ba090  ssh_host_ed25519_key
16d5525465999791cd5adc769de18483  ssh_host_ed25519_key.pub
57f0578ed484e979e61b27213b9726b3  ssh_host_rsa_key
f250fe82cc167b4c38ef39cc8b89fa2c  ssh_host_rsa_key.pub
``` 
start ssh service

```terminal
service ssh start
```

enter the password

<img src="ssh.png" width="80%">

check ssh services
```terminal
netstat -antp
```
output
```
(Tous les processus ne peuvent être identifiés, les infos sur les processus
non possédés ne seront pas affichées, vous devez être root pour les voir toutes.)
Connexions Internet actives (serveurs et établies)
Proto Recv-Q Send-Q Adresse locale          Adresse distante        Etat        PID/Program name    
tcp        0      0 127.0.0.1:8830          0.0.0.0:*               LISTEN      10325/Code --standa 
tcp        0      0 127.0.0.1:8831          0.0.0.0:*               LISTEN      10325/Code --standa 
tcp        0      0 127.0.0.1:8832          0.0.0.0:*               LISTEN      10325/Code --standa 
tcp        0      0 127.0.0.1:40967         0.0.0.0:*               LISTEN      10325/Code --standa 
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:8828          0.0.0.0:*               LISTEN      10325/Code --standa 
tcp        0      0 127.0.0.1:8829          0.0.0.0:*               LISTEN      10325/Code --standa 
tcp        0      0 172.20.10.4:36030       140.82.113.25:443       ESTABLISHED 1835/chrome --type= 
tcp        0      0 172.20.10.4:59318       185.199.110.133:443     ESTABLISHED 1835/chrome --type= 
tcp        0      0 172.20.10.4:37572       13.107.246.64:443       TIME_WAIT   -                   
tcp        0      0 172.20.10.4:54140       142.250.217.174:443     ESTABLISHED 1835/chrome --type= 
tcp        0      0 172.20.10.4:43182       13.107.246.64:80        TIME_WAIT   -                   
tcp        0      0 172.20.10.4:49198       142.250.217.238:443     TIME_WAIT   -                   
tcp        0      0 172.20.10.4:57588       146.75.6.132:80         TIME_WAIT   -                   
tcp        0      0 172.20.10.4:50012       31.13.67.52:443         ESTABLISHED 1835/chrome --type= 
tcp        0      0 172.20.10.4:39120       74.125.139.188:5228     ESTABLISHED 1835/chrome --type= 
tcp        0      0 172.20.10.4:60260       20.42.65.84:443         ESTABLISHED 9903/Code --standar 
tcp        0      0 172.20.10.4:36798       68.232.34.200:443       ESTABLISHED 9903/Code --standar 
tcp        0      0 172.20.10.4:52038       217.31.202.63:80        TIME_WAIT   -                   
tcp        0      0 172.20.10.4:52420       104.16.208.203:443      TIME_WAIT   -                   
tcp        0      0 172.20.10.4:41800       139.84.238.12:443       TIME_WAIT   -                   
tcp        0      0 172.20.10.4:46336       185.199.109.154:443     ESTABLISHED 1835/chrome --type= 
tcp        0      0 172.20.10.4:54828       104.19.190.106:443      TIME_WAIT   -                   
tcp        0      0 172.20.10.4:56230       104.21.67.201:443       ESTABLISHED -                   
tcp6       0      0 :::22                   :::*                    LISTEN   
```
## network proxy configuration
open config file
```
nano /etc/proxychains.conf 
```
```bash
# proxychains.conf  VER 3.1
#
#        HTTP, SOCKS4, SOCKS5 tunneling proxifier with DNS.
#	

# The option below identifies how the ProxyList is treated.
# only one option should be uncommented at time,
# otherwise the last appearing option will be accepted
#
#dynamic_chain
#
# Dynamic - Each connection will be done via chained proxies
# all proxies chained in the order as they appear in the list
# at least one proxy must be online to play in chain
# (dead proxies are skipped)
# otherwise EINTR is returned to the app
#
strict_chain
#
# Strict - Each connection will be done via chained proxies
# all proxies chained in the order as they appear in the list
# all proxies must be online to play in chain
# otherwise EINTR is returned to the app
#
#random_chain
#
# Random - Each connection will be done via random proxy
# (or proxy chain, see  chain_len) from the list.
# this option is good to test your IDS :)

# Make sense only if random_chain
#chain_len = 2

# Quiet mode (no output from library)
#quiet_mode

# Proxy DNS requests - no leak for DNS data
proxy_dns 

# Some timeouts in milliseconds
tcp_read_time_out 15000
tcp_connect_time_out 8000

# ProxyList format
#       type  host  port [user pass]
#       (values separated by 'tab' or 'blank')
#
#
#        Examples:
#
#            	socks5	192.168.67.78	1080	lamer	secret
#		http	192.168.89.3	8080	justu	hidden
#	 	socks4	192.168.1.49	1080
#	        http	192.168.39.93	8080	
#		
#
#       proxy types: http, socks4, socks5
#        ( auth types supported: "basic"-http  "user/pass"-socks )
#
[ProxyList]
# add proxy here ...
# meanwile
# defaults set to "tor"
socks4 	127.0.0.1 9050
```
After :
* uncommenting #dynamic_chain