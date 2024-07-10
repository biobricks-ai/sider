#! /usr/bin/bash

export localpath;
localpath=$(pwd)

export downloadpath;
downloadpath="$localpath"/download

export brickpath;
brickpath="$localpath"/brick

wget "http://sideeffects.embl.de/download"
cat download | grep -Po '(?<=href=")[^"]*\.tsv(\.gz)?' | sort > files.txt
rm download

export download_url;
download_url="http://sideeffects.embl.de"

cat files.txt | xargs -P14 -n1 bash -c '
    echo $1;
    wget -nH -q -P '$downloadpath' '$download_url'$1
    echo "Downloaded '$1'"
' {}

rm files.txt