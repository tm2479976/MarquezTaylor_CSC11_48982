gcc -c main.s
gcc -c fib.s
gcc -o fib main.o fib.o
rm -vf *.o
./fib
