dist=${1:-focal}
if [ "$dist" = "focal" -o "$dist" = "impish" -o "$dist" = "jammy"]; then
    flavor=ubuntu
fi
if [ "$dist" = "buster" -o "$dist" = "bullseye"]; then
    flavor=debian
fi
aptly repo create -distribution=$dist -component=stable feelpp-$dist-stable
aptly repo create -distribution=$dist -component=latest feelpp-$dist-latest

aptly publish repo -passphrase-file=$BUILDKITE_PASSPHRASE -architectures="amd64" -component="stable,latest" feelpp-$dist-stable feelpp-$dist-latest s3:apt.feelpp.org:$flavor
