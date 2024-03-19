#!/bin/sh

PM_FILE="/tmp/pmem_btree_data"
INPUT_FILE="sample_input.txt"
NKEYS=10000
NKEYS=1000
NTHREADS=4


rm -f $PM_FILE

PROG=btree_concurrent

OUTPUT=fast-fair-pmdk.trace
echo [*] Executing $PROG '             ' [$OUTPUT]
./concurrent_pmdk/$PROG -n $NKEYS -t $NTHREADS -i $INPUT_FILE -p $PM_FILE 2> $OUTPUT

# OUTPUT=fast-fair-pmdk-recovery.trace
# echo [*] Executing $PROG again '       ' [$OUTPUT]
# ./concurrent_pmdk/$PROG -n $NKEYS -t $NTHREADS -i $INPUT_FILE -p $PM_FILE 2> $OUTPUT


rm -f $PM_FILE

PROG=btree_concurrent_mixed

OUTPUT=fast-fair-pmdk-mixed.trace
echo [*] Executing $PROG '             ' [$OUTPUT]
./concurrent_pmdk/$PROG -n $NKEYS -t $NTHREADS -i $INPUT_FILE -p $PM_FILE 2> $OUTPUT

# OUTPUT=fast-fair-pmdk-mixed-recovery.trace
# echo [*] Executing $PROG again '       ' [$OUTPUT]
# ./concurrent_pmdk/$PROG -n $NKEYS -t $NTHREADS -i $INPUT_FILE -p $PM_FILE 2> $OUTPUT
