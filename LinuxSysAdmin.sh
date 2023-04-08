#! /bin/bash
echo 'Welcome to Hartechworld Linux System Admin Menu!!!'
PS3="Your choice:"
select ITEM in "Add user" "List All Processes" "Kill Process" "Install Program" "Quit"
do
if [[ $REPLY -eq 1 ]]
then
        read -p "Enter the username:" username
        output="$(grep -w $username /etc/passwd)"
        if [[ -n "$output" ]]
        then
                echo "The username $username already exists."
        else
                sudo usersadd -m -s /bin/bash "$username"
		if [[ $? -eq 0 ]]
		then 
			echo "The user $username was added successfully."
			tail -n 1 /etc/passwd		
		else
			echo "There was an error adding the user $username."
		fi
	fi

elif [[ $REPLY -eq 2 ]]
then
	echo "Listing all processes..."
	sleep 1
	ps -ef

elif [[ $REPLY -eq 3 ]]
then
	read -p "Enter the process to kill:" process
	pkill $process

elif [[ $REPLY -eq 4 ]]
then
	read -p "Enter the program to install:" app
	sudo apt update && sudo sudo apt install $app

elif [[ $REPLY -eq 5 ]]
then
	echo "Quitting..."
	sleep 1
	exit
else
	echo "Invalid menu selection"
fi

done
