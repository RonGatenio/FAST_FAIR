.PHONY: all clean
.DEFAULT_GOAL := all

LIBS=-lrt -lm -pthread -lpmemobj
INCLUDES=-I./include
CFLAGS=-O3 -std=c++11 -g
CXX := ${LLVM_HOME}/bin/clang++ -fsanitize=thread
# CXX := g++

output = btree_concurrent btree_concurrent_mixed

all: main

main: src/test.cpp
	$(CXX) $(CFLAGS) -o btree_concurrent src/test.cpp $(LIBS) -DCONCURRENT
	$(CXX) $(CFLAGS) -o btree_concurrent_mixed src/test.cpp $(LIBS) -DCONCURRENT -DMIXED

clean: 
	rm $(output)
