# untested - but to get me up to speed the next time
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y fswebcam vim
sudo timedatectl set-timezone Europe/Stockholm

crontab cron-entry

echo "All done!"
echo "To verify:"
echo " - 'sh take-picture.sh' puts an image in the images folder"
echo " - 'crontab -l' includes an entry for take-picture.sh"

## OPTIONAL: setup access point
sudo apt-get install -y hostapd dnsmasq

DHCPCD="
interface wlan0
static ip_address=192.168.0.10/24
denyinterfaces eth0
denyinterfaces wlan0
"
sudo echo "$DHCPCD" >> /etc/dhcpcd.conf

sudo cp dnsmasq.conf /etc/dnsmasq.conf
sudo cp hostapd.conf /etc/hostapd/hostapd.conf
sudo su -c 'echo "DAEMON_CONF=\"/etc/hostapd/hostapd.conf\"" >> /etc/default/hostapd'

sudo sed -i 's/exit 0/sudo hostapd \/etc\/hostapd\/hostapd.conf \&\nexit 0\n/g' /etc/rc.local

sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo systemctl start hostapd
sudo service dnsmasq start

sudo reboot
