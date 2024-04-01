.PHONY: all clean
.DEFAULT_GOAL := all

CXX := clang++
CFLAGS=-O3 -std=c++11 -g
LIBS=-lrt -lm -pthread -lpmemobj -ldl
PRD_FLAGS := -Xclang -load -Xclang /app/build/bin/PrdPass.so -fpass-plugin=/app/build/bin/PrdPass.so -mllvm -cprd-dfsan-abilist=/app/benchmarks/dfsan_abilist.txt -l:/app/build/bin/cprd-x86_64.a -mclwb -mclflushopt -fuse-ld=gold -z muldefs -v #-fsanitize=dataflow -mllvm -dfsan-abilist=/app/benchmarks/dfsan_abilist.txt -v

output = btree_concurrent btree_concurrent_mixed

all: main

main: src/test.cpp
	$(CXX) $(CFLAGS) $^ $(PRD_FLAGS) -o btree_concurrent $(LIBS) -DCONCURRENT
	$(CXX) $(CFLAGS) $^ $(PRD_FLAGS) -o btree_concurrent_mixed $(LIBS) -DCONCURRENT -DMIXED

clean: 
	rm $(output)
