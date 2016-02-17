#!/usr/bin/env bash
 
LANG=C
LC_ALL=C
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
unalias -a
 
set -e
 
if [ $# -lt 1 ]; then
  echo "Usage: $0 <database1> [<database2> ...]" 1>&2
  exit 1
fi
 
DATE=`date +'%Y%m%d_%H%M%S'`
FILE=mysqldump.$DATE.sql.gz
mysqldump --single-transaction $@ | gzip > $FILE
 
BACKUP_GENERATION=${BACKUP_GENERATION:-14}
BACKUP_COUNT=`ls -1 mysqldump.*.sql.gz | wc -l`
BACKUP_EXPIRED=`expr $BACKUP_COUNT - $BACKUP_GENERATION`
if [ $BACKUP_EXPIRED -gt 0 ]; then
  for i in `ls -1 mysqldump.*.sql.gz | head -n $BACKUP_EXPIRED`; do
    rm -f $i
  done
fi
