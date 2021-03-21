#!/bin/bash

DATE=`date +%Y-%m-%d`
BACKUP_FOLDER="/opt/mysql/backup"

if [ ! -d "$BACKUP_FOLDER" ]
then
    mkdir -p "$BACKUP_FOLDER"
fi

BACKUP_FILENAME=$BACKUP_FOLDER/backup_$DATE.sql.gz

/usr/bin/mysqldump --all-databases --protocol=tcp -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER --password=$MYSQL_PASS \
| gzip > $BACKUP_FILENAME
