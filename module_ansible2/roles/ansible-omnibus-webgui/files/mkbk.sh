#!/bin/bash
set -x
my_date=`date +%Y%m%d_%T`
BACKUP_FILE=$1
cp -p $BACKUP_FILE $BACKUP_FILE.$my_date
