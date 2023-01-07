#!/bin/sh
fswebcam -r 1280x720 --no-banner $(dirname $0)/images/img-$(date +'%y%m%d-%H%M%S').jpg
