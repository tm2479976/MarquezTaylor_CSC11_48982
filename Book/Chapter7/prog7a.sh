echo "Hello $USER. we are going to run prog7a"
echo "Today is $(date)"
echo "Current working directory : $(pwed)"
rm -vf *.o
./prog7a ; echo $?
