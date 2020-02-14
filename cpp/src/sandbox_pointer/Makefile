all: simple_pointer_exercise
	./simple_pointer_exercise

simple_pointer_exercise: simple_pointer_exercise.o
	g++ -o $@ $^

simple_pointer_exercise.o: simple_pointer_exercise.cpp
	g++ -c -o $@ $^
