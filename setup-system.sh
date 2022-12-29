# untested - but to get me up to speed the next time
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install fswebcam

sudo timedatectl set-timezone Europe/Stockholm

chmod +x take-picture.sh
crontab cron-entry

echo "All done!"
echo "To verify:"
echo " - 'sh take-picture.sh' puts an image in the images folder"
echo " - 'crontab -l' includes an entry for take-picture.sh"