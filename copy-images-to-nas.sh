#!/bin/sh

IMAGE_DIR=/home/pi/timelapser/images

TMP_DIR_PATTERN=/tmp/images
TMP_DIR=$TMP_DIR_PATTERN-$(date '+%Y%m%d-%H%M%S')
TAR_NAME=/tmp/images-$(date '+%Y%m%d-%H%M%S').tar

mv $IMAGE_DIR $TMP_DIR
mkdir $IMAGE_DIR
 
tar cf $TAR_NAME -C $TMP_DIR .
rm -rf $TMP_DIR

for f in "$TMP_DIR_PATTERN"*tar; do 
    echo "Uploading $f"
    echo "put $f $2" | sshpass -f ~/.nas-password sftp $1

    if [ "$?" -eq "0" ]; then 
        echo "File $f uploaded"
        rm $f
    else
        echo "Failed to upload $f"
    fi

done
