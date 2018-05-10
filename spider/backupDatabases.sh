#!/bin/bash

mysqlBin=/usr/local/mysql/bin
year=`date +%Y`
month=`date +%m`
date=`date +%Y_%m_%d_%H%M`
target=`pwd`/backups/$year/$month
mkdir -p $target

cd $mysqlBin
for database in kpi32 SB32Alerts SB32BlankStart SB33Local
do
  output=$target/db_dump_${database}_${date}.sql
  echo "dumping $database to $output"
  ./mysqldump --no-data --user=root --password=password $database > $output
  ./mysqldump --no-create-info --user=root --password=password --ignore-table=$database.scorecardnodescores --ignore-table=$database.seriesvalues $database >> $output
done
cd -
