# Makefile
all: prog12

prog12: prog12.o
	gcc -o $@ $+

prog12.o: prog12.s
	as -o $@ $<

clean:
	rm -vf *.o
