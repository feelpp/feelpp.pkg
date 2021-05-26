#! /bin/sh

set -x

version=$1
rep=${2:-.}
repo=${3:-ubuntu}
distribution=${4:-eoan}
channel=${5:-latest}
component=${6:-feelpp}
arch=${7:-amd64}

for i in $rep/*.deb $rep/*.changes; do
    
    filename=$(basename $i)
    curl -XPUT -T $i -uchristophe.prudhomme@cemosis.fr:${BINTRAY_API_KEY} "https://feelpp.jfrog.io/artifactory/$repo/pool/$filename;deb.distribution=$distribution;deb.component=$channel;deb.architecture=$arch;publish=1;override=1"
    
#"https://xapi.bintray.com/content/feelpp/$repo/feelpp/$version/$distribution/pool/$channel/f/$component/$filename;deb_distribution=$distribution;deb_component=$channel;deb_architecture=$arch;publish=1;override=1"

done
