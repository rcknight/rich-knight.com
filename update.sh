#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Specify tag as first param"
    exit
fi

git checkout upstream-master

rm -rf ./*

curl -L -o $1.tar.gz https://github.com/johnotander/pixyll/archive/$1.tar.gz
tar -xvf $1.tar.gz
mv pixyll-$1/* .
mv pixyll-$1/.* .
rm $1.tar.gz
rm -fr pixyll-$1

git add .
git commit -m "Update pixyll to $1"

git checkout master
git rebase upstream-master
