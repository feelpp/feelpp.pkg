#!/bin/bash

for _tb in core coefficientformpdes heat electric fluid solid hdg fsi heatfluid thermoelectric
do
    if [ "$_tb" == "core"  ] ; then
        # libraries
        cat >  libfeelpp-toolboxes1-${_tb}.install <<EOF
usr/lib/*/libfeelpp_model*.so.*
EOF

        # dev files
        cat > libfeelpp-toolboxes1-${_tb}-dev.install <<EOF
usr/lib/*/libfeelpp_toolbox_model*.so
usr/include/feelpp/toolboxes/*/modelcore/*.hpp
usr/include/feelpp/toolboxes/*/modelmesh/*.hpp
usr/include/feelpp/toolboxes/*/modelvf/*.hpp
usr/include/feelpp/toolboxes/*/modelmaterials/*.hpp
EOF


    elif [ "$_tb" == "coefficientformpdes"  ] ; then
        # libraries
        cat > libfeelpp-toolboxes1-${_tb}.install <<EOF
usr/lib/*/libfeelpp_toolbox_coefficientformpde*.so.*
EOF

        # dev files
        cat > libfeelpp-toolboxes1-${_tb}-dev.install <<EOF
usr/lib/*/libfeelpp_toolbox_coefficientformpde*.so
usr/include/feelpp/toolboxes/*/${_tb}/*.hpp
EOF

        # executables
        cat > feelpp-toolboxes-${_tb}.install <<EOF
usr/bin/feelpp_toolbox_${tb}
usr/share/man/man1/feelpp_toolbox_${_tb}.*
usr/share/doc/feelpp/toolboxes/feelpp_toolbox_${_tb}.*
EOF

    else
        # libraries
        echo "usr/lib/*/libfeelpp_toolbox_${_tb}*.so.*" > libfeelpp-toolboxes1-${_tb}.install

        # dev files
        cat > libfeelpp-toolboxes1-${_tb}-dev.install <<EOF
usr/lib/*/libfeelpp_toolbox_${_tb}*.so
usr/include/feelpp/toolboxes/*/${_tb}/*.hpp
EOF

        # executables
        cat > feelpp-toolboxes-${_tb}.install <<EOF
usr/bin/feelpp_toolbox_${_tb}
usr/bin/feelpp_toolbox_${_tb}_*
usr/share/man/man1/feelpp_toolbox_${_tb}.*
usr/share/doc/feelpp/toolboxes/feelpp_toolbox_${_tb}.*
EOF
    fi
done

