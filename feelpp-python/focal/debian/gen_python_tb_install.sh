#!/bin/sh

for i in core coefficientformpdes heat electric fluid solid hdg fsi heatfluid thermoelectric; do
cat > python3-feelpp-toolboxes-$i.install << EOF
usr/lib/python3*/*-packages/feelpp/toolboxes/$i/*.py
usr/lib/python3*/*-packages/feelpp/toolboxes/$i/*.so
EOF
done
