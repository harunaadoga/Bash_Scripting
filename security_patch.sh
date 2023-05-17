#!/bin/bash

# Update package lists
sudo yum update -y

# Install yum-security plugin
sudo yum install -y yum-plugin-security

# Check for security updates
sudo yum updateinfo security -y

# Apply security updates
sudo yum update --security -y

# Restart services or system as needed
# ...

# Log the date and time of the patch check and update
echo "Security patches checked and updated on $(date)" >> /var/log/patch-updates.log

