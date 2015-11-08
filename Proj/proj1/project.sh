gcc -c main.s
gcc -c word0.s
gcc -c word1.s
gcc -c word2.s
gcc -c word3.s
gcc -c word4.s
gcc -o all main.o word0.s word1.s word2.s word3.s word4.s
rm -vf *.o
./all