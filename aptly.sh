dist=${1:-focal}
if [ "$dist" = "focal" -o "$dist" = "impish" -o "$dist" = "jammy"]; then
    flavor=ubuntu
fi
if [ "$dist" = "buster" -o "$dist" = "bullseye"]; then
    flavor=debian
fi
echo "dist: $impish  -- flavor: $flavor" 

aptly repo create -distribution=$dist -component=stable feelpp-$dist-stable
aptly repo create -distribution=$dist -component=latest feelpp-$dist-latest

if test -z "$BUILDKITE_PASSPHRASE"; then
    echo "passphrase not defined"
    return
else
    echo "passphrase defined..."
    echo $BUILDKITE_PASSPHRASE > pp
    aptly publish repo -passphrase-file=pp -architectures="amd64" -component="stable,latest" feelpp-$dist-stable feelpp-$dist-latest s3:apt.feelpp.org:$flavor
    rm pp
fi