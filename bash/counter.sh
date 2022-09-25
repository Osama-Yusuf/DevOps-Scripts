#!/bin/bash
#this script creates 25 empty files each time executed
:'
counter=$(ls | wc -l)
for((i=$counter; i<=$counter+24; i++));
do
	touch osama$i
done

echo "25 files created successfully"
'
#--------------------------

#this script creates 25 files for only one time execution and if executed again it will not create any file

counter=1
NAME="osama"

if [[ -f osama1  ]]
then 
	echo "fiels already exist on your machine"
else
	while [ $counter -le 25 ]
	do
		touch $NAME$counter
		((counter++))
	done
	echo "25 files created successfully"
fi
