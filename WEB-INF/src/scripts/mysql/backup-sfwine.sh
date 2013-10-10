#!/bin/sh

DBDIR="`pwd`"

if [ -z $1 ] ; then
	HEXT=`hostname`
elif [ -n $1 ] ; then
	HEXT=$1
fi

if [ -z $2 ] ; then
	DEXT=`date +'%y%m%d'`
else 
	DEXT=$2
fi

if [ -z $3 ] ; then
	PASSWORD=JZworkb0x
else 
	PASSWORD=$3
fi

echo "backup-mycoz $HEXT $DEXT $PASSWORD"

BackupDatabases() {

mysqldump -uroot -p$PASSWORD -t wineFrameWork > wineFrameWork-t.$HEXT.$DEXT.sql
mysqldump -uroot -p$PASSWORD -d -R wineFrameWork > wineFrameWork-d.$HEXT.$DEXT.sql

mysqldump -uroot -p$PASSWORD -t wineShared > wineShared-t.$HEXT.$DEXT.sql
mysqldump -uroot -p$PASSWORD -d -R wineShared > wineShared-d.$HEXT.$DEXT.sql

mysqldump -uroot -p$PASSWORD -t wineBranch > wineBranch-t.$HEXT.$DEXT.sql
mysqldump -uroot -p$PASSWORD -d -R wineBranch > wineBranch-d.$HEXT.$DEXT.sql
}


if [ ! -d $DEXT ] ; then
mkdir $DEXT
fi

cd $DEXT
BackupDatabases
