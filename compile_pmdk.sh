#!/bin/sh

(cd concurrent_pmdk && make)

if [ ! -z "$CPRD_RESULTS_BIN" ]; then
    cp ./concurrent_pmdk/btree_concurrent* $CPRD_RESULTS_BIN
fi
