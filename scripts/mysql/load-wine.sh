#!/bin/sh

DBDIR="`pwd`"

if [ -z $1 ] ; then
	echo "load-wine [HostName] [Date] [Password]"
	echo "[HostName Null]"
	exit 1
fi

if [ -z $2 ] ; then
      echo "load-wine [HostName] [Date] [Password]"
      echo "[Date Null]"
      exit 1
fi

if [ -z $3 ] ; then
	echo "load-wine [HostName] [Date] [Password]"
	echo "[Password Null]"
	exit 1
fi

HEXT=$1
DEXT=$2
PASSWORD=$3

LoadDatabases() {
mysql -uroot -p$PASSWORD << FLAG
set FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS wineBranch;
DROP DATABASE IF EXISTS wineShared;
DROP DATABASE IF EXISTS wineFrameWork;

CREATE DATABASE wineFrameWork;
use wineFrameWork;
source wineFrameWork-d.$HEXT.$DEXT.sql;
source wineFrameWork-t.$HEXT.$DEXT.sql;

CREATE DATABASE wineShared;
use wineShared;
source wineShared-d.$HEXT.$DEXT.sql;
source wineShared-t.$HEXT.$DEXT.sql;

CREATE DATABASE wineBranch;
use wineBranch;
source wineBranch-d.$HEXT.$DEXT.sql;
source wineBranch-t.$HEXT.$DEXT.sql;

set FOREIGN_KEY_CHECKS=1;
FLAG
}

if [ ! -d $DEXT ] ; then
mkdir $DEXT
fi

cd $DEXT
LoadDatabases
