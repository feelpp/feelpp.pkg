#! /bin/sh

for  i in core coefficientformpdes heat electric fluid solid hdg fsi heatfluid thermoelectric; do
echo "Package: python3-feelpp-toolboxes-$i
Section: python
Architecture: amd64 i386 ia64 powerpc sparc
Depends: \${shlibs:Depends}, \${misc:Depends}, libfeelpp-toolboxes1-$i (= \${binary:Version})
Recommends: feelpp-toolboxes-data
Description: Feel++ toolboxes $i Python bindings
 Provides Feel++ $i toolbox via Python bindings"; echo
done
