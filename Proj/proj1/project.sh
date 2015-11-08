gcc -c main.s
gcc -c word0.s
gcc -c word1.s
gcc -c word2.s
gcc -c word3.s
gcc -c word4.s
gcc -o project main.o word0.o word1.o word2.o word3.o word4.o
rm -vf *.o
./project
