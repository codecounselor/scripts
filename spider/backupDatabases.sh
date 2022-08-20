#!/bin/bash

mysqlBin=/usr/local/mysql/bin
year=`date +%Y`
month=`date +%m`
date=`date +%Y_%m_%d_%H%M`
target=`pwd`/backups/$year/$month
mkdir -p $target

cd $mysqlBin
for database in commercial_2021_emergency commercial_2021_sp commercial_2022 smc
do
  output=$target/db_dump_${database}_${date}.sql
  echo "dumping $database to $output"
  ./mysqldump --no-data --user=root --password=password $database > $output
  ./mysqldump --max_allowed_packet=1GB --no-create-info --user=root --password=password --ignore-table=$database.scorecardnodescores --ignore-table=$database.seriesvalues $database >> $output
done
cd -
