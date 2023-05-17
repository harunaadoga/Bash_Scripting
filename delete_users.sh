#!/bin/bash

# Function users and their home directories
del_Users() {
    local csv_file="$1"

    # Read the CSV
    while IFS=',' read -r username _; do
        # Delete the user account
        sudo userdel -r "$username"
    done < "$csv_file"
}

# enter the CSV file name
read -p "Enter CSV filename: " csv_file

# Check CSV file exists
if [ ! -f "$csv_file" ]; then
    echo "Error: File $csv_file not found."
    exit 1
fi

# function call
del_Users "$csv_file"

