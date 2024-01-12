sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y fswebcam vim
sudo timedatectl set-timezone Europe/Stockholm

crontab cron-entry

echo "All done!"
echo "To verify:"
echo " - 'sh take-picture.sh' puts an image in the images folder"
echo " - 'crontab -l' includes an entry for take-picture.sh"


WIFI_CONF="auto wlan0
iface wlan0 inet dhcp
	wpa-ssid <ssid>
        wpa-psk <password>"

echo $WIFI_CONF >> /etc/network/interfaces
