#!/bin/bash

if [ `pwd` != "/srv/search.tenders/debian" ]
then
  echo "Buildout must be installed in /srv/search.tenders"
  exit
fi

if [ `id -u` -ne 0 ]
then
  sudo $0
  exit
fi

DIR=search-tenders

NAME=`awk -F: '$1~/Package/{print $2}' $DIR/DEBIAN/control`
VER=`awk -F: '$1~/Version/{print $2}' $DIR/DEBIAN/control`
ARCH=`awk -F: '$1~/Architecture/{print $2}' $DIR/DEBIAN/control`
DIST=${NAME// /}_${VER/ /}_${ARCH// /}

test -d $DIST && rm -r $DIST
test -f $DIST.deb && rm $DIST.deb

mkdir $DIST
cp -r $DIR/* $DIST
cp -r ../bin ../eggs ../src $DIST/srv/search.tenders/
cp -f ../etc/*.{ini,conf} $DIST/etc/search.tenders/

find $DIST/srv -name \*.pyc -name \*.pyo -delete

dpkg-deb --build $DIST

