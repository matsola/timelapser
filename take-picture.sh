#!/bin/sh
fswebcam -r 1280x720 --no-banner /home/pi/timelapser/images/img-$(date +'%y%m%d-%H%M%S').jpg
