echo "Hello $USER. we are going to run prog10a"
echo "Today is $(date)"
echo "Current working directory : $(pwd)"
rm -vf *.o
./prog10a ; echo $?
