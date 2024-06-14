# SecureShell (SSH)
* secure communications with SSH
* network proxy configuration
## secure communications with SSH
### network proxy configuration
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