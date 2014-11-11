#!/bin/sh

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

set -e

DIR=$(cd $(dirname $0); pwd)
TEMP=$(mktemp $DIR/.master_zones.txt.XXXXX)

DOMAINS=`mysql -BN -u root pdns -e "SELECT name FROM domains WHERE TYPE <> 'SLAVE';"`
echo "$DOMAINS" | sort > $TEMP
mv $TEMP $DIR/master_zones.txt
