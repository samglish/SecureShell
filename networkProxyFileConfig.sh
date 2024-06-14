#echo "install nano"
#sudo apt install nano
#echo "install proxychains"
#sudo apt install proxychains-ng
echo "configure proxychains"
#sudo sed -i 's/quiet/quiet dns/g' /etc/proxychains.conf
#sudo sed -i 's/socks5/socks5 127.0.0.1 9050/g' /etc/proxychains.conf
sudo nano /etc/proxychains.conf 