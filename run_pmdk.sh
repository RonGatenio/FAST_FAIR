#!/bin/sh

PM_FILE="/tmp/btree_data"
INPUT_FILE="sample_input.txt"
NKEYS=1000
NKEYS=11
NTHREADS=4

# rm -f $PM_FILE

OUTPUT=fast-fair-pmdk-trace-btree_concurrent-$(date +"%Y-%m-%d_%H-%M").txt
echo [*] Executing btree_concurrent '       ' [$OUTPUT]
./concurrent_pmdk/btree_concurrent -n $NKEYS -t $NTHREADS -i $INPUT_FILE -p $PM_FILE 2> $OUTPUT

OUTPUT=fast-fair-pmdk-trace-btree_concurrent_mixed-$(date +"%Y-%m-%d_%H-%M").txt
echo [*] Executing btree_concurrent_mixed ' ' [$OUTPUT]
./concurrent_pmdk/btree_concurrent_mixed -n $NKEYS -t $NTHREADS -i $INPUT_FILE -p $PM_FILE 2> $OUTPUT
