X#! /bin/bash
echo 'Welcome to Hartechworld Linux System Admin Dashboard!!!'
CHOICE="Your choice:"
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

done
