# SecureShell (SSH)
* secure communications with SSH
* network proxy configuration
## secure communications with SSHs
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