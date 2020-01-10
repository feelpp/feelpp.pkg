#! /bin/sh

version=$1
rep=${2:-.}
repo=${3:-ubuntu}
distribution=${4:-eoan}
components=${5:-main}
arch=${6:-amd64,i386}
for i in $rep/*.deb $rep/*.changes; do
    
    filename=$(basename $i)
    curl -X PUT -T $i -uprudhomm:${BINTRAY_API_KEY} "https://api.bintray.com/content/feelpp/$repo/feelpp/$version/$distribution/pool/$components/f/feelpp/$filename;deb_distribution=$distribution;deb_component=$components;deb_architecture=$arch;publish=1;override=1"

done
