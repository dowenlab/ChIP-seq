#run in command line
#calculate average sizes of peak lists by subtracting end-start coordinate, then taking the average of that output


awk' {print $3-$2}' input > output 

awk '{sum += $1}END{print sum/NR}' input > output
