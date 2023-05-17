#!/bin/bash

# prompt user for CSV file name
read -p "Enter CSV filename: " csv_file


# Check if the CSV file exists
if [ ! -f "$csv_file" ]; then
	echo "Error: File $csv_file not found."
	exit 1
fi

# Open CSV file and create users
for i in $(cat $csv_file) ;
	NEWUSER=$(echo $i | cut -d ',' -f 1)
	NEWPASS=$(echo $i | cut -d ',' -f 2)
	sudo adduser $NEWUSER
	sudo echo $NEWPASS | sudo passwd $NEWUSER --stdin
done




