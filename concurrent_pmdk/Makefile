.PHONY: all clean
.DEFAULT_GOAL := all

CXX := clang++
CFLAGS=-O3 -std=c++11 -g
LIBS=-lrt -lm -pthread -lpmemobj -ldl
PRD_FLAGS := ${PRD_C_FLAGS}

output = btree_concurrent btree_concurrent_mixed

all: main

main: src/test.cpp
	$(CXX) $(CFLAGS) $^ $(PRD_FLAGS) -o btree_concurrent $(LIBS) -DCONCURRENT
	$(CXX) $(CFLAGS) $^ $(PRD_FLAGS) -o btree_concurrent_mixed $(LIBS) -DCONCURRENT -DMIXED

clean: 
	rm $(output)
