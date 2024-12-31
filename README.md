# Timelapser

To be used with a raspberrypi (tested raspberrypi 2b and it works) with an USB cam connected to it (I'm using Logitech, Inc. HD Pro Webcam C920). 
It sets up an raspberry pi to take picture every 5th minute.

Clone this repo into `/home/pi` and setup the system according to `setup-system*.sh` and your situation (haven't tested the scripts)

All files will end up in `/home/pi/timelapser/images`.

With a 32GB sd card you should be able to run the system for about 139 days give or take.

## Pushing files somewhere

To set up the system to push the files regularly edit `cron-entry` and uncomment the line containing `copy-images-to-nas.sh` and change it to reflect your setup. 

The script `copy-image-to-nas.sh` relies on `sftp` and `sshpass` to push your files. 

Note: the password to the `nas` is read from `/home/pi/.nas-password` (i.e. you need to create that file).

Finally run:
```sh
crontab cron-entry
```

Note: The images will be automatically removed when successfully uploaded to the nas

