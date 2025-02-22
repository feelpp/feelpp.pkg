#!/bin/bash

dist=${1:-focal}
if test "$dist" = "focal" -o "$dist" = "kinetic" -o "$dist" = "jammy" -o "$dist" = "noble"; then
    flavor=ubuntu
fi
if test "$dist" = "buster" -o "$dist" = "bullseye" -o "$dist" = "bookworm" -o "$dist" = "trixie" -o "$dist" = "testing" -o "$dist" = "sid"; then
    flavor=debian
fi
echo "dist: $dist  -- flavor: $flavor" 

aptly repo create -distribution=$dist -component=stable feelpp-$dist-stable
aptly repo create -distribution=$dist -component=latest feelpp-$dist-latest

if test -z "$GPG_PASSPHRASE"; then
    echo "passphrase not defined"
    return
else
    echo "passphrase defined..."
    aptly publish repo -passphrase="${GPG_PASSPHRASE}" -gpg-key=${GPG_KEY}  -architectures="amd64" -component="stable,latest" feelpp-$dist-stable feelpp-$dist-latest s3:apt.feelpp.org:$flavor/$dist
fi
