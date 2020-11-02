#! /bin/sh

version=$1
rep=${2:-.}
repo=${3:-ubuntu}
distribution=${4:-focal}
channel=${5:-latest}
component=${6:-feelpp}
arch=${7:-amd64,i386}
for i in $rep/*.deb $rep/*.changes; do
    
    filename=$(basename $i)
    curl -X PUT -T $i -uprudhomm:${BINTRAY_API_KEY} "https://api.bintray.com/content/feelpp/$repo/feelpp/$version/$distribution/pool/$channel/f/$component/$filename;deb_distribution=$distribution;deb_component=$channel;deb_architecture=$arch;publish=1;override=1"

done
