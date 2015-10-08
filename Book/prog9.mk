# Makefile
all: prog9

prog9: prog9.o
	gcc -o $@ $+

prog9.o: prog9.s
	as -o $@ $<

clean:
	rm -vf *.o
