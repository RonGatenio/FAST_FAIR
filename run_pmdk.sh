#!/bin/sh

PM_FILE="/tmp/btree_data"
INPUT_FILE="sample_input.txt"
NKEYS=1000
NTHREADS=4

rm -f $PM_FILE

./concurrent_pmdk/btree_concurrent -n $NKEYS -t $NTHREADS -i $INPUT_FILE -p $PM_FILE 
