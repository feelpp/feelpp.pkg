#! /bin/sh

version=$1
rep=${2:-.}
repo=${3:-archiv}
for i in $rep/*.tar.gz; do
    
    curl -X PUT -T $i -uprudhomm:${BINTRAY_API_KEY} "https://api.bintray.com/content/feelpp/$repo/feelpp/$version/$i;publish=1;override=1"

done
