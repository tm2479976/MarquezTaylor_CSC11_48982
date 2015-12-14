gcc -c main.s
gcc -c word0.s
gcc -c initarray.s
gcc -c divMod.s
gcc -o project main.o word0.o initarray.o divMod.o
rm -vf *.o
./project
