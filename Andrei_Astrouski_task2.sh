#!/bin/bash

# Arguments are here 
Name=$1
Surname=$2
Filesize=$3
Filename=$4

# Arrays are here
SurnameArr=(A s t r o u s k i) 
ArrSumm=${#SurnameArr[@]}
Length=$((${#Surname} * 2 )) 

# Function makefile is here
function makefile(){
mkdir ./$Surname
echo "truncate -s ${Filesize} kib ./${Filename}" 
}

# Cycle is here
for (( i = 0;  i < $ArrSumm - 1;  i++ )){
echo  ${SurnameArr[i]} 
echo ${Length}
makefile () {
truncate -s $i mb ./${SurnameArr[i]}
}
}

# Second cycle is here
for (( i = 0; i< ${Length}; i++)) { 
mkdir ./$Surname/$i 
}


function exit_code() {
echo "The date command exit status:" $? | awk {print} > ./log.log
}

# Thanks for you Attention! Have a good day! 
