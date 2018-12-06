#! /bin/sh
CURRENT_DIR=`pwd`

BUILDDIR=cmake-build
P2P_CLINET=p2pclient
P2P_SERVER=p2pserver

if [ -d ${BUILDDIR} ]; then
    rm -rf ${BUILDDIR}
fi

mkdir ${BUILDDIR}

build()
{
    cd ${BUILDDIR}
    cmake .. -DCMAKE_BUILD_TYPE=Debug
    make -j4

    echo $CURRENT_DIR

    cd $CURRENT_DIR

    cp  ./${BUILDDIR}/bin/iceclient  $CURRENT_DIR/${P2P_CLINET}
    cp  ./${BUILDDIR}/bin/iceserver  $CURRENT_DIR/${P2P_SERVER}
}

clean()
{
    rm -rf ${BUILDDIR}
    rm $CURRENT_DIR/${P2P_CLINET}
    rm $CURRENT_DIR/${P2P_SERVER}

    echo "rm -rf "${BUILDDIR}
}

case $1 in 
    b)      build;;
    c)      clean;;
    *)      build;;
esac
