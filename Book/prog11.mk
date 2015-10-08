# Makefile
all: prog11

prog11: prog11.o
	gcc -o $@ $+

prog11.o: prog11.s
	as -o $@ $<

clean:
	rm -vf *.o
