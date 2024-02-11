.PHONY: all clean
.DEFAULT_GOAL := all

CXX := clang++
CFLAGS=-O3 -std=c++11 -g
LIBS=-lrt -lm -pthread -lpmemobj -ldl
PRD_FLAGS := -fpass-plugin=/app/build/bin/PrdPass.so -l:/app/build/bin/tsan-x86_64.a -mclwb -mclflushopt -fuse-ld=gold -z muldefs

output = btree_concurrent btree_concurrent_mixed

all: main

main: src/test.cpp
	$(CXX) $(CFLAGS) $^ $(PRD_FLAGS) -o btree_concurrent src/test.cpp $(LIBS) -DCONCURRENT
	$(CXX) $(CFLAGS) $^ $(PRD_FLAGS) -o btree_concurrent_mixed src/test.cpp $(LIBS) -DCONCURRENT -DMIXED

clean: 
	rm $(output)
