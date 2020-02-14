all: dynamic_allocation
	./dynamic_allocation

dynamic_allocation: dynamic_allocation.o
	g++ -o $@ $^

dynamic_allocation.o: dynamic_allocation.cpp
	g++ -c $^ -o $@
