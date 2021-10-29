#!/bin/bash

ROOTDIR=$(dirname $0)

# first start of nodeos = workdir empty
if [ "$(ls ${ROOTDIR}/workdir/)" = "" ];  then
    echo "START: FIRST START"
    exec ${ROOTDIR}/bin/nodeos --genesis-json ${ROOTDIR}/settings/genesis.json \
           --disable-replay-opts \
           --data-dir ${ROOTDIR}/workdir/data \
           --config-dir ${ROOTDIR}/workdir/config \
           -c ${ROOTDIR}/settings/config.ini
else

    # restart of nodeos without snapshot = workdir not empty and no snapshot
    if [ "$(ls ${ROOTDIR}/workdir/data/snapshots/)" = "" ]; then
        echo "START: RESTART WITHOUT SNAPSHOT"
        exec ${ROOTDIR}/bin/nodeos --disable-replay-opts \
               --data-dir ${ROOTDIR}/workdir/data \
               --config-dir ${ROOTDIR}/workdir/config \
               -c ${ROOTDIR}/settings/config.ini

    # restart of nodeos with last snapshot = workdir not empty and has snapshot
    else
        SNAPSHOT=$(ls ${ROOTDIR}/workdir/data/snapshots/ | tail -1)
        echo "START: RESTART WITH SNAPSHOT = ${SNAPSHOT}"
        rm -rf ${ROOTDIR}/workdir/data/blocks/ ${ROOTDIR}/workdir/data/state/
        exec ${ROOTDIR}/bin/nodeos --snapshot=${ROOTDIR}/workdir/data/snapshots/${SNAPSHOT} \
               --disable-replay-opts \
               --data-dir ${ROOTDIR}/workdir/data \
               --config-dir ${ROOTDIR}/workdir/config \
               -c ${ROOTDIR}/settings/config.ini
    fi
fi
