#!/bin/bash

# "This scirpt will create batch of 25 empty .txt files. Name of the file will contain user name and number, example: johndoe1 . "
# "With every execution of this scipt will create another batch of files starting with numeration from highest number value found in existing file name."

save_directory=$PWD
user_name=$USER
file_exists=1

file_creator_func () {

	n=$(($1+1))
	min=$n
	max=$(($n + 24))

	while [ $min -le $max ]
	do
		touch "$user_name$min.txt" $2
		min=$(($min+1))
	done
}

read -p "Do you want to proceed and create batch of 25 files? Default directory is your currently working directory which is $save_directory. yes/no " answer

if [[ $answer == "yes" ]]; then

	echo "Proceeding"

	for file in $user_name*.txt; do
	    if [[ -e $file ]]; then
		    file_exists=0
		    break
	    fi
	done
	    
	if [[ $file_exists -eq 0 ]]; then
		echo "Files exist. Creating another batch."
		max_file_value=$(ls | awk -F"$user_name" '{gsub(".txt", ""); print $2}' | sort -n | tail -n 1)
		echo "Maximum number found in file names is: $max_file_value. Creating next batch of files, numbers: $(($max_file_value+1))-$(($max_file_value+25)) "
		file_creator_func $max_file_value $save_directory
		echo "Files created in $save_directory"
	else
		echo "No such files exist. Creating first batch of files, numbers: 1-25"
		file_creator_func 0 $save_directory
		echo "Files created in $save_directory"
	fi
else
	echo "Bye"
fi

