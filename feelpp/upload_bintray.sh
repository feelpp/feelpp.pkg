#! /bin/sh

version=$1
repo=${2:-ubuntu}
distribution=${3:-eoan}
components=${4:-main}
arch=${5:-amd64,i386}
for i in *.deb *.changes; do
    
    curl -X PUT -T $i -uprudhomm:${BINTRAY_API_KEY} "https://api.bintray.com/content/feelpp/$repo/feelpp/$version/pool/main/f/feelpp/$i;deb_distribution=$distribution;deb_component=$components;deb_architecture=$arch;publish=1"

done
