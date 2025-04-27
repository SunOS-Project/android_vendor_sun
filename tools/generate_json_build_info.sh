#!/bin/sh
if [ "$1" ]
then
    FILE=$1
    NAME=$(basename $FILE)
    SIZE=$(du -b $FILE | awk '{print $1}')
    SHA1=$(sha1sum $FILE | awk '{print $1}')
    MD5=$(md5sum $FILE | awk '{print $1}')
    OUT=${FILE%/*}
    DEVICE=${OUT##*/}

    DATE=`grep ro.sun.build_date_utc $OUT/product/etc/build.prop | sed "s/ro.sun.build_date_utc=//"`
    DATE_S=`date "+%Y_%m_%d" -d @$DATE`
    DATE=$(expr "$DATE" '*' 1000)

    JSON_DEVICE_DIR=ota/$DEVICE
    JSON=$JSON_DEVICE_DIR/ota.json

    CHANGELOG_FILE=$JSON_DEVICE_DIR"/changelog_"$DATE_S".txt"

    if [ ! -d $JSON_DEVICE_DIR ]; then
        mkdir -p $JSON_DEVICE_DIR
    fi

    VERSION="varuna"

    # Generate ota json
    :> $JSON
    echo "{" >> $JSON
    echo "    \"version\": \""$VERSION"\"," >> $JSON
    echo "    \"date\": \""$DATE"\"," >> $JSON
    echo "    \"requiredDate\": \"0\"," >> $JSON
    echo "    \"url\": \"https://sourceforge.net/projects/sunos-project/files/"$DEVICE"/"$NAME"/download\"," >> $JSON
    echo "    \"id\": \""$SHA1"\"," >> $JSON
    echo "    \"filename\": \""$NAME"\"," >> $JSON
    echo "    \"filesize\": \""$SIZE"\"," >> $JSON
    echo "    \"md5\": \""$MD5"\"" >> $JSON
    echo "}" >> $JSON

    touch $CHANGELOG_FILE

    echo "Succesfully generated json: "$JSON
    echo "Please fill in changelog to "$CHANGELOG_FILE
fi
